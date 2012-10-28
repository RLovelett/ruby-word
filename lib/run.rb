
module RubyWord
  class Run

    attr_accessor :text

    def initialize(text, &block)
      @text = text

      # Run properties
      @bold = false
      @underline = false
      @italics = false

      instance_eval(&block) if block_given?
    end

    def bold
      @bold = true
    end

    def underline
      @underline = true
    end

    def italics
      @italics = true
    end

    def to_xml
      "<w:r><w:rPr></w:rPr></w:r>"
    end

  end
end
