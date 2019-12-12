class "#{@name}_Datatable".class < ApplicationDatatable
private
  def data
    dimension.map do |dimension|
    [
      # Add your attributes
    ]
    end
  end
end