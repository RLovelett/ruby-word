require 'spec_helper'

describe RubyWord::Units::Twips do
  context "Numeric monkey patch" do
    it { expect(1440).to respond_to(:twips) }
    it { expect(1440.0).to respond_to(:twips) }
    it { expect(1440.twips).to be_instance_of(RubyWord::Units::Twips) }
  end

  context "1440 twips" do
    let(:twips) { 1440.twips }
    subject { twips }

    context "conversions" do
      its(:to_inches) { should be_instance_of(RubyWord::Units::Inches) }
      its(:to_inches) { should eq 1.inch }
      its(:to_inch)   { should be_instance_of(RubyWord::Units::Inches) }
      its(:to_inch)   { should eq 1.inch }
      its(:to_in)     { should be_instance_of(RubyWord::Units::Inches) }
      its(:to_in)     { should eq 1.inch }
    end

    context "math operators with twips" do
    end

    context "math operators with picas" do
    end

    context "math operators with pitch" do
    end

    context "math operators with inches" do
    end

    context "math operators with Fixnum" do
      it { expect(40 + subject).to eq(1480) }     # 40 + 1,440 =  1,480
      it { expect(40 - subject).to eq(-1400) }    # 40 - 1,440 = -1,400
      it { expect(40 * subject).to eq(57600) }    # 40 * 1,440 = 57,600
      it { expect(40 / subject).to eq(1/36) }     # 40 / 1,440 =  1/36 = 0

      it { expect(subject + 40).to eq(1480) }     # 1,440 + 40 = 1,480
      it { expect(subject - 40).to eq(1400) }     # 1,440 - 40 = 1,400
      it { expect(subject * 40).to eq(57600) }    # 1,440 * 40 = 57,600
      it { expect(subject / 40).to eq(36) }       # 1,440 / 40 = 36
    end

    context "math operators with Float" do
      it { expect(40.0 + subject).to eq(1480) }       # 40 + 1,440 =  1,480
      it { expect(40.0 - subject).to eq(-1400) }      # 40 - 1,440 = -1,400
      it { expect(40.0 * subject).to eq(57600) }      # 40 * 1,440 = 57,600
      it { expect(40.0 / subject).to eq(1/36.to_f) }  # 40 / 1,440 =  1/36 = 0

      it { expect(subject + 40.0).to eq(1480) }       # 1,440 + 40 = 1,480
      it { expect(subject - 40.0).to eq(1400) }       # 1,440 - 40 = 1,400
      it { expect(subject * 40.0).to eq(57600) }      # 1,440 * 40 = 57,600
      it { expect(subject / 40.0).to eq(36) }         # 1,440 / 40 = 36
    end
  end
end
