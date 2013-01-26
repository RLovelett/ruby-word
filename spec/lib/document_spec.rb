require 'spec_helper'

describe RubyWord::Document do
  it { should respond_to :to_xml }

  context "when creating an empty new document" do
    let(:document) { RubyWord::Document.new }
    subject { document }

    its(:to_xml) { should match "xmlns:w=\"http://schemas.openxmlformats.org/wordprocessingml/2006/main\"" }
    its(:to_xml) { should have_xpath "/w:document/w:body" }
    its(:to_xml) { should have_xpath "/w:document/w:body/w:sectPr" }
    its(:to_xml) { should validate_schema_against wml_schema }
  end

  #context "when creating a document with a section" do
    #let(:document) do
      #RubyWord::Document.new do
        #paragraph do
          #run "Lorem ipsum"
        #end
      #end
    #end
    #subject { document }

    #its(:to_xml) { should match "xmlns:w=\"http://schemas.openxmlformats.org/wordprocessingml/2006/main\"" }
    #its(:to_xml) { should have_xpath("/w:document/w:body/w:p").with_text("Lorem ipsum") }
  #end

  #contet "full example DSL" do
    #let(:document) do
      #RubyWord::Document.new do

        #style :stuff do
          #indent :left, 25.points
        #end

        ## begin section
        #section do
          #width 8.5.inches
          #height 11.inches

          #margins do
            #top 1.inch
            #bottom 1.inch
            #left 1.inch
            #right 1.inch
          #end

          #header :first do
            #paragraph do
              #text "Lorem ipsum"
            #end
            #paragraph do
              #text "Lorem ipsum"
            #end
          #end

          #header :default do
            #paragraph do
              #text "Lorem ipsum"
            #end
          #end

          #paragraph do
            #number "One", :numbered
            #number "Two", :numbered
            #number "Three", :numbered do
              #number "A", :alpha
              #number "B", :alpha
              #number "C", :alpha
            #end
            #text "Lorem ipsum"
          #end
        #end
        ## end section

      #end
    #end

  #end
end
