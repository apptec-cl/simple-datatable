module Datatable
  class Generator
    attr_accessor :name

    def initialize(name)
      @name = name
      @dirname = 'app/datatables'
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
      result = generate_template('application_datatable.erb')
      puts result
      File.open("#{@dirname}/application_datatable.rb", 'w') { |file| file.write(result) }
      puts "Created principal class application_datatable.rb"
    end

    def create_file
      result = generate_template('template_datatable.erb')
      puts result
      File.open("#{@dirname}/#{@name.downcase}_datatable.rb", 'w') { |file| file.write(result) }
      puts "Created new file #{@name}_datatable.rb in folder datatables"
    end

    def copy_datatable_js
      result = generate_template('datatable.coffee')
      puts result
      File.open("app/assets/stylesheets/datatable.coffee", 'w') { |file| file.write(result) }
      puts "Created new file datatable.coffee in folder :app/assets/stylesheets/"
    end

    def generate_template name_template
      ERB.new(File.read("#{templates}/#{name_template}"), nil, '-').result(binding)
    end
  end
end