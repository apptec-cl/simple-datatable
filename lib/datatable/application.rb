module Datatable
  class Application
    include AbstractController::Rendering
    include Rails.application.routes.url_helpers
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::NumberHelper
    include ActionView::Helpers::SanitizeHelper

    delegate :params, :h, :link_to, :image_tag, :current_user, to: :@view

    def initialize(view, model, items, order_items=nil, pre_filter=false, filter='')
      @view = view
      if pre_filter
        @model= model.where(filter)
      else
        @model = model
      end
      @items = items
      @order = order_items.blank? ? items : order_items
    end

    def as_json(options = {})
      {
        sEcho: params[:draw].to_i,
        iTotalRecords: @model.count,
        iTotalDisplayRecords: dimension.total_entries,
        aaData: sanitize_data(data)
      }
    end

    def set_datatable_button dimension, partial_path
      ApplicationController.new.render_to_string(partial: partial_path, locals: { dimension: dimension })
    end

    private

    def dimension
      @dimension ||= fetch_dimension
    end

    def fetch_dimension
      dimension = @model
      search = ''

      @items.each_with_index do |val, key|
        search << (key == 0 ? val+' LIKE :search ' : 'OR ' + val + ' LIKE :search ')
      end

      if params[:order]
        params[:order].each do |key, val|
          column_for_order = val[:column].to_i
          dimension = dimension.order("#{@order[column_for_order]} #{val[:dir]}")
        end
      end

      if !params[:search][:value].blank?
        dimension = dimension.where(search, search: "%#{params[:search][:value]}%")
      end

      params[:columns].each do |key,column|
        if !column[:search][:value].blank?
          dimension = dimension.where(@items[column[:data].to_i] + ' LIKE :search ', search: "%#{column[:search][:value]}%")
        end
      end
      dimension = dimension.page(page).per_page(per_page)
      dimension
    end

    def page
      params[:start].to_i / per_page + 1
    end

    def per_page
      params[:length].to_i > 0 ? params[:length].to_i : 10
    end

    def imagen_data value, url, default
      if value.url(:thumb) == url
        image_tag default, class: "img-circle", size: "60", style: "border: 5px solid #FFF;"
      else
        image_tag value.url(:thumb), class: "img-circle", size: "60", style: "border: 5px solid #FFF;"
      end
    end

    def miles value
      number_with_delimiter(value, delimiter: ".")
    end

    def rut_format value
      spliter = value.split("-")
      formated = number_with_delimiter(spliter[0], delimiter: ".")
      formated.to_s+"-"+spliter[1].to_s
    end

    def get_asset id
      asset = AssetConsumer.new current_user.customer_id, id
      asset = asset.get_asset
    end

    def sanitize_data data
      # sanitize data, when the persistent (or stored) Cross-site scripting vulnerability
      data.each do |row|
        row.each_with_index do |attribute, index|
          row[index] = sanitize(row[index]) if row[index].is_a? String
        end
      end
      data
    end

  end
end