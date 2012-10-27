require "RubyWord/version"
require "nokogiri"
require "zippy"

module RubyWord
  LIBRARY_PATH = File.dirname(__FILE__)
  UNITS_PATH   = File.join(LIBRARY_PATH, 'units')

  module Units
    autoload :Inches, File.join(UNITS_PATH, 'inches')
    autoload :Picas, File.join(UNITS_PATH, 'picas')
    autoload :Points, File.join(UNITS_PATH, 'pitch')
    autoload :Twips, File.join(UNITS_PATH, 'twips')
  end

  autoload :Document, File.join(File.dirname(__FILE__), 'document')

  # Monkey patch the Numeric Ruby class
  require 'core_ext/numeric'
end
