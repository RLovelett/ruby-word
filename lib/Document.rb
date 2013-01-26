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
      document = Nokogiri::XML::Document.new
      document.encoding="UTF-8"

      root = document.create_element "document"
      # Create a namespace and save it for later
      ns = root.add_namespace("w", "http://schemas.openxmlformats.org/wordprocessingml/2006/main")
      root.namespace = ns
      document << root


      body = document.create_element "body"
      body.namespace = ns
      root << body

      @paragraphs.each do |p|
        puts "Paragraph"
        p.to_xml(root)
      end

      document.to_xml
    end
  end

end
