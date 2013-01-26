class Numeric
  def inches
    RubyWord::Units::Inches.new(self)
  end

  def twips
    RubyWord::Units::Twips.new(self)
  end
end
