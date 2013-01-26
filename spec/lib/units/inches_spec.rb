require 'spec_helper'

describe RubyWord::Units::Inches do
  context "Numeric monkey patch" do
    it { expect(30).to respond_to(:inches) }
    it { expect(30.0).to respond_to(:inches) }
    it { expect(30.inches).to be_instance_of(RubyWord::Units::Inches) }
  end

  context "30 inch" do
    let(:inches) { 30.inches }
    subject { inches }

    context "conversions" do
      its(:to_twips) { should be_instance_of(RubyWord::Units::Twips) }
      its(:to_twips) { should eq 43200 }
      its(:to_twips) { should eq 43200.twips }
      its(:to_twip)  { should be_instance_of(RubyWord::Units::Twips) }
      its(:to_twip)  { should eq 43200 }
      its(:to_twip)  { should eq 43200.twips }
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
      it { expect(40 + 30.inches).to eq(43240) }   # 40 + 43,200 =  43,240
      it { expect(40 - 30.inches).to eq(-43160) }  # 40 - 43,200 = -43,160
      it { expect(40 * 30.inches).to eq(1728000) } # 40 * 43,200 =  1,728,000
      it { expect(40 / 30.inches).to eq(1/1080) }  # 40 / 43,200 =  1/1080 = 0

      it { expect(30.inches + 40).to eq(43240) }   # 43,200 + 40 =  43,240
      it { expect(30.inches - 40).to eq(43160) }   # 43,200 - 40 =  43,160
      it { expect(30.inches * 40).to eq(1728000) } # 43,200 * 40 =  1,728,000
      it { expect(30.inches / 40).to eq(1080) }    # 43,200 / 40 =  1,080
    end

    context "math operators with Float" do
      it { expect(40.0 + 30.inches).to eq(43240) }   # 40 + 43,200 =  43,240
      it { expect(40.0 - 30.inches).to eq(-43160) }  # 40 - 43,200 = -43,160
      it { expect(40.0 * 30.inches).to eq(1728000) } # 40 * 43,200 =  1,728,000
      it { expect(40.0 / 30.inches).to eq(1/1080.to_f) }  # 40 / 43,200 =  1/1080 = 0

      it { expect(30.inches + 40.0).to eq(43240) }   # 43,200 + 40 =  43,240
      it { expect(30.inches - 40.0).to eq(43160) }   # 43,200 - 40 =  43,160
      it { expect(30.inches * 40.0).to eq(1728000) } # 43,200 * 40 =  1,728,000
      it { expect(30.inches / 40.0).to eq(1080) }    # 43,200 / 40 =  1,080
    end
  end
end
