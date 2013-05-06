# -*- ruby -*-

Gem::Specification.new do |s|
   s.name     = "hokstad-filters"
   s.version  = "0.11"
   s.date     = "2013-05-06"
   s.authors  = "Vidar Hokstad"
   s.email    = "vidar@hokstad.com"
   s.summary  = "Wrapper for rdiscount that provides additional filters on top"
   s.homepage = "http://www.hokstad.com"
   s.description = s.summary
   s.files    = `git ls-files`.collect(&:chomp).collect(&:strip).find_all{|f| f =~ /lib\/.*/ || f == "README" || f =~ /.*\.rdoc/}
   s.add_dependency('rdiscount')
   s.add_dependency('syntax')
end
