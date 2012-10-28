module RubyWord

  ##
  # This class represents the document tag
  #
  # @link http://www.schemacentral.com/sc/ooxml/e-w_document.html
  class Document
    def initialize(&block)
      @paragraphs = []
      instance_eval(&block) if block_given?
    end

    # Accept the section block
    def paragraph(&block)
      p = Paragraph.new
      @paragraphs << p
      p.instance_eval(&block) if block_given?
    end

    ##
    # Turn the current document into an XML string
    #
    # Optionally, this can "pretty-print" the XML string
    def to_xml(pretty_print = false)
      @builder = Nokogiri::XML::Builder.new(encoding: "UTF-8") do |xml|
        xml.document do
          # Create a namespace and save it for later
          ns = xml.doc.root.add_namespace_definition("w", "http://schemas.openxmlformats.org/wordprocessingml/2006/main")

          # Assign the saved namespace reference to the document element
          xml.doc.root.namespace = ns

          xml["w"].body do
            xml["w"].sectPr
          end
        end

      end
      @builder.to_xml
    end
  end

end
