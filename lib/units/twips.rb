module RubyWord
  module Units
    class Twips < Numeric

      ##
      # :nodoc:
      def initialize(numeric)
        @val = numeric
      end
      attr_reader :val

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
      alias to_inch to_inches
      alias to_in to_inches

      def +(other)
        case other
        when Fixnum, Float
          Twips.new(@val + other)
        else
          raise ArgumentError, "#{other.class} is an unknown type."
        end
      end

      def -(other)
        case other
        when Fixnum, Float
          Twips.new(@val - other)
        else
          raise ArgumentError, "#{other.class} is an unknown type."
        end
      end

      def *(other)
        case other
        when Fixnum, Float
          Twips.new(@val * other)
        else
          raise ArgumentError, "#{other.class} is an unknown type."
        end
      end

      def /(other)
        case other
        when Fixnum
          Twips.new(@val / other)
        when Float
          Twips.new(@val.to_f / other)
        else
          raise ArgumentError, "#{other.class} is an unknown type."
        end
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

      ##
      #
      def coerce(other)
        case other
        when Fixnum, Float
          [other, @val]
        else
          raise ArgumentError, "#{other.class} is an unknown type."
        end
      end
    end
  end
end
