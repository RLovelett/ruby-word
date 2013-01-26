module RubyWord
  module Units
    class Inches < Numeric

      ##
      # :nodoc:
      def initialize(numeric)
        @val = numeric
      end

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
        when Fixnum
          Twips.new(to_twips.to_i + other).to_inches
        when Float
          Twips.new(to_twips.to_f + other).to_inches
        else
          raise ArgumentError, "#{other.class} is an unknown type."
        end
      end

      ##
      # Do subtraction
      def -(other)
        case other
        when Fixnum
          Twips.new(to_twips.to_i - other).to_inches
        when Float
          Twips.new(to_twips.to_f - other).to_inches
        else
          raise ArgumentError, "#{other.class} is an unknown type."
        end
      end

      ##
      # Do multiplication
      def *(other)
        case other
        when Fixnum
          Twips.new(to_twips.to_i * other).to_inches
        when Float
          Twips.new(to_twips.to_f * other).to_inches
        else
          raise ArgumentError, "#{other.class} is an unknown type."
        end
      end

      ##
      # Do division
      def /(other)
        case other
        when Fixnum
          Twips.new(to_twips.to_i / other).to_inches
        when Float
          Twips.new(to_twips.to_f / other).to_inches
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
        when Fixnum
          [other, to_twips.to_i]
        when Float
          [other, to_twips.to_f]
        end
      end

      ##
      #
      def ==(other)
        case other
        when Fixnum
          to_twips.to_i == other
        end
      end

    end
  end
end
