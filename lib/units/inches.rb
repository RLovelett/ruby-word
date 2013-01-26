module RubyWord
  module Units
    class Inches < Numeric

      ##
      # :nodoc:
      def initialize(numeric)
        @val = numeric
      end
      attr_reader :val

      ##
      # Convert the value to twips
      def to_twips
        Twips.new(1440 * @val)
      end
      alias :to_twip :to_twips

      ##
      # Do addition
      def +(other)
        case other
        when Fixnum, Float
          Twips.new(to_twips + other).to_inches
        when Inches
          Inches.new(@val + other.val)
        else
          raise ArgumentError, "#{other.class} is an unknown type."
        end
      end

      ##
      # Do subtraction
      def -(other)
        case other
        when Fixnum, Float
          Twips.new(to_twips - other).to_inches
        when Inches
          Inches.new(@val - other.val)
        else
          raise ArgumentError, "#{other.class} is an unknown type."
        end
      end

      ##
      # Do multiplication
      def *(other)
        case other
        when Fixnum, Float
          Twips.new(to_twips * other).to_inches
        when Inches
          Inches.new(@val * other.val)
        else
          raise ArgumentError, "#{other.class} is an unknown type."
        end
      end

      ##
      # Do division
      def /(other)
        case other
        when Fixnum, Float
          Twips.new(to_twips / other).to_inches
        when Inches
          Inches.new(@val / other.val)
        else
          raise ArgumentError, "#{other.class} is an unknown type."
        end
      end

      ##
      # Allow the Inches object to be coerced into a Fixnum.
      # It is assumed that all Fixnum and Float instances are
      # already in Twip units
      def coerce(other)
        case other
        when Fixnum, Float
          [other, to_twips]
        else
          raise ArgumentError, "#{other.class} is an unknown type."
        end
      end

      ##
      #
      def ==(other)
        case other
        when Fixnum, Float
          to_twips == other
        when Inches
          @val == other.val
        else
          false
        end
      end

    end
  end
end
