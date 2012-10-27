require 'spec_helper'

describe RubyWord::Document do
  it { should respond_to :to_xml }

  context "when creating a new document" do
    let(:document) { RubyWord::Document.new }
    subject { document }

    its(:to_xml) { should match "xmlns:w=\"http://schemas.openxmlformats.org/wordprocessingml/2006/main\"" }
    its(:to_xml) { should have_xpath "/w:document/w:body" }
    its(:to_xml) { should have_xpath "/w:document/w:body/w:sectPr" }
    its(:to_xml) { should validate_schema_against wml_schema }
  end
end
