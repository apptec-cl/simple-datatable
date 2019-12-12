module Datatable
  class Generator
    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def up
      # The first is to create folder in case it does not exist.
      create_folder
      create_file
    end

    private

    def create_folder
      require 'fileutils'
      dirname = 'datatables'
      FileUtils.mkdir_p(dirname) unless File.directory?(dirname)
    end

    def create_file
      File.copy('templates/template_datatable.rb', "#{@name}_datatable.rb")
    end
  end
end