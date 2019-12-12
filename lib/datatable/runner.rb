module Datatable
  class Runner

    ERROR_MESSAGE = 'USAGE: datatable up APP_NAME'

    def initialize(options)
      @options = options
    end

    def execute
      raise ERROR_MESSAGE unless valid?
      Datatable::Generator.new(@options[1]).up
    end

    def valid?
      # first option should always be up
      return false unless @options[0].include?['generate', 'g']
      true
    end
  end
end