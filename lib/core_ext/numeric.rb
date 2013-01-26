class Numeric
  def inches
    RubyWord::Units::Inches.new(self)
  end
  alias inch inches

  def twips
    RubyWord::Units::Twips.new(self)
  end
end
