module Datatable
  class Generator
    attr_accessor :name

    def initialize(name)
      @name = name
      @dirname = 'datatables'
    end

    def up
      # The first is to create folder in case it does not exist.
      create_folder
      create_principal
      create_file
    end

    def templates
      Datatable.templates
    end

    private

    def create_folder
      FileUtils.mkdir_p(@dirname) unless File.directory?(@dirname)
    end

    def create_principal
      template = ERB.new(File.read("#{templates}/application_datatable.erb"), nil, '-')
      result = template.result(binding)
      puts result
      File.open("datatables/application_datatable.rb", 'w') { |file| file.write(result) }
      puts "Created principal class application_datatable.rb"
    end

    def create_file
      template = ERB.new(File.read("#{templates}/template_datatable.erb"), nil, '-')
      result = template.result(binding)
      puts result
      File.open("datatables/#{@name.downcase}_datatable.rb", 'w') { |file| file.write(result) }
      puts "Created new file #{@name}_datatable.rb in folder datatables"
    end
  end
end