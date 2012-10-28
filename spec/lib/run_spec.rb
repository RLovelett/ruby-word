require 'spec_helper'

describe RubyWord::Run do
  let(:txt) { Faker::Lorem.words(3).join(" ") }
  let(:run_bold_underline_italicized) do
    RubyWord::Run.new txt do
      bold
      underline
      italics
    end
  end

  let(:run_bold_underline) do
    RubyWord::Run.new txt do
      bold
      underline
    end
  end

  let(:run_bold) do
    RubyWord::Run.new txt do
      bold
    end
  end

  let(:run) do
    RubyWord::Run.new txt
  end

  describe "plain text run" do
    subject { run }
    it { should respond_to :underline }
    it { should respond_to :bold }
    it { should respond_to :italics }
    it { should respond_to :to_xml }
    its(:to_xml) { should be_an_instance_of(Nokogiri::XML::Node) }
    its(:to_xml) { should_not have_xpath("/w:r/w:rPr/w:u") }
    its(:to_xml) { should have_xpath("/w:r/w:t").with_text(txt) }
  end

  describe "text run, with bold" do
    subject { run_bold }
    its(:to_xml) { should be_an_instance_of(String) }
    its(:to_xml) { should have_xpath("/w:r/w:t").with_text(txt) }
    its(:to_xml) { should have_xpath("/w:r/w:rPr/w:u") }
  end
end
