require 'spec_helper'

describe RubyWord::Paragraph do
  let(:paragraph) do
    RubyWord::Paragraph.new do
      run "Lorem ipsum" do
        bold
        underline
      end
      run "Lorem ipsum, dolor." do
        bold
      end
    end
  end
  subject { paragraph }

  it { should respond_to :run }
  it { should respond_to :to_xml }
  its(:to_xml) { should be_an_instance_of(String) }
  its(:to_xml) { should have_xpath("/w:p") }

end
