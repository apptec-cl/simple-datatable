module Datatable
  class Runner

    MESSAGE = "      ___           ___         ___                     ___           ___
                    /  /\         /  /\       /  /\        ___        /  /\         /  /\
                   /  /::\       /  /::\     /  /::\      /  /\      /  /:/_       /  /:/
                  /  /:/\:\     /  /:/\:\   /  /:/\:\    /  /:/     /  /:/ /\     /  /:/
                 /  /:/~/::\   /  /:/~/:/  /  /:/~/:/   /  /:/     /  /:/ /:/_   /  /:/  ___
                /__/:/ /:/\:\ /__/:/ /:/  /__/:/ /:/   /  /::\    /__/:/ /:/ /\ /__/:/  /  /\
                \  \:\/:/__\/ \  \:\/:/   \  \:\/:/   /__/:/\:\   \  \:\/:/ /:/ \  \:\ /  /:/
                 \  \::/       \  \::/     \  \::/    \__\/  \:\   \  \::/ /:/   \  \:\  /:/
                  \  \:\        \  \:\      \  \:\         \  \:\   \  \:\/:/     \  \:\/:/
                   \  \:\        \  \:\      \  \:\         \__\/    \  \::/       \  \::/
                    \__\/         \__\/       \__\/                   \__\/         \__\/


                    https://datatables.net/
              Add advanced interaction controls to your HTML tables the free & easy way \n
              \n
              \n
              Example: \n
              datatable g model_name"
    ERROR_MESSAGE = 'USAGE: datatable up APP_NAME'

    def initialize(options)
      @options = options
    end

    def execute
      MESSAGE if @options[0] == 'h'
      raise ERROR_MESSAGE unless valid?
      Datatable::Generator.new(@options[1]).up
    end

    def valid?
      # first option should always be up
      return false if @options[0] != 'g'
      true
    end
  end
end