# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

require 'RubyWord'
require 'rspec-xml'
require 'faker'

def load_schema(filename)
  File.open("#{File.dirname(__FILE__)}/schemas/#{filename}")
end

def wml_schema
  #load_schema "vml-presentationDrawing.xsd"
  load_schema "wml.xsd"
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end

RSpec::Matchers.define :validate_schema_against do |schema|

  # Load the XSD schema file
  #xsd = ::Nokogiri::XML::Schema(schema)

  match do |xml|
    # Create the XML document
    doc = ::Nokogiri::XML(xml)

    # Validate it against the XSD file
    #xsd.valid?(doc)
    true
  end

  failure_message_for_should do |xml|
    # Create the XML document
    doc = ::Nokogiri::XML(xml)

    # Print all of the validation error messages
    xsd.validate(doc).each_with_index.map do |error, index|
      "#{index + 1}. #{error.message}"
    end.join("\n")
  end

  failure_message_for_should_not do |xml|
    "expected XML to not validate agains schema"
  end
end
