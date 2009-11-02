
Filters
=======

The "filters" package provides a stream oriented way of chaining small filters
that operate on lines of text.

For example, one filter provided passes the text through RDiscount for Markdown
rendering, while another adds classes to "pre" text, like this:

-grammar-
    This bit has the "grammar" class set
	
This bit on the other hand:

-ruby-
    class Foo
       def bar
          puts "Hello"
       end
    end

... has the Ruby class set