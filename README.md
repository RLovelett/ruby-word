# RubyWord

RubyWord is a gem that provides an API creating word documents.

Generated files are in the standard Office Open XML format, therefore,
the resulting files can be opened by all major office software
(Microsoft Office 2007/2010, LibreOffice, et al.).

## Installation

Add this line to your application's Gemfile:

    gem 'RubyWord'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install RubyWord

## Usage

```ruby
require 'RubyWord'

# Create a new Word Document
doc = RubyWord::Document.new do
  style "Paragraph1Style" do
  end

  section do
    style "Paragraph1Style"
    text "Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Vestibulum bibendum tincidunt tellus, at laoreet lectus eleifend sed. Ut odio augue, egestas a iaculis eget, gravida id diam. Fusce nisi nulla, varius sit amet cursus ut, feugiat quis lorem. Phasellus gravida posuere velit non convallis.  Pellentesque placerat pellentesque dolor, id pellentesque eros interdum sit amet. Duis vel elit quam, ut tristique ante. Proin congue facilisis lectus, sit amet pellentesque lacus egestas a. Cras iaculis laoreet massa, non mollis lectus scelerisque non. Fusce et nisl urna, ac rhoncus lacus.  Quisque dignissim posuere auctor.  Aenean a tellus risus. Proin facilisis placerat libero, vel fermentum augue feugiat eu. Ut euismod nisl quis sem tincidunt vitae dignissim ipsum ultrices. Maecenas gravida faucibus quam, at feugiat sapien porttitor semper. Aliquam lectus mauris, lacinia quis tristique et, placerat sed turpis."
  end
end

# Write the new document to the filesystem
doc.save("ExampleApi.rb")
```

## Block Level Content

## Run Level Content

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

(The MIT License)
