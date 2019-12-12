require "datatable/application_datatable"
require "datatable/generator"
require "datatable/runner"
require 'erb'
require 'fileutils'

module Datatable
  def self.root
    File.dirname __dir__
  end

  def self.templates
    File.join root, 'templates'
  end
end