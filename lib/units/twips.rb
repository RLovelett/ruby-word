module RubyWord
  module Units
    class Twips < Numeric
      def initialize(numeric)
        @val = numeric
      end

      ##
      # Convert the Twips object back to an Fixnum
      def to_i
        @val.to_i
      end

      ##
      #
      def to_f
        @val.to_f
      end

      ##
      # Convert the Twips object into a Inches instance
      def to_inches
        Inches.new(@val.to_f / 1440)
      end

      ##
      #
      def ==(other)
        @val == other
      end

      ##
      #
      def ===(other)
        @val === other
      end
    end
  end
end
