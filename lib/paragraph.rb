module RubyWord
  class Paragraph

    def initialize
      @runs = []
    end

    def run(content, &block)
      run = Run.new content
      run.instance_eval(&block) if block_given?
    end

    def to_xml
      ""
    end

  end
end
