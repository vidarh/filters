
all: gem install

gem:	pkg
	-mkdir pkg
	gem build hokstad-markdown.gemspec
	touch pkg
	mv *.gem pkg/

install:
	gem install --local pkg/`ls pkg | sort -r | head -n1`

push:
	scp pkg/`ls pkg | sort -r | head -n1` gems@gems:gems/
	ssh gems@gems gem generate_index -d .
