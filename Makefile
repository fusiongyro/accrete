DOCBOOK_ROOT := /opt/local/share/xsl/docbook-xsl

all: accrete.html accrete.pdf

# code generating style
#%.pl: %.docbook code.xsl
#	xsltproc --output $@ code.xsl $<

# document output: HTML and then FO
%.html: %.docbook dkl.css.xml docbook/xhtml5/docbook.xsl docbook/xhtml5/syntax-highlighting.xsl
	xsltproc --xinclude --output $@ docbook/xhtml5/docbook.xsl $<

%.fo: %.docbook docbook/fo/docbook.xsl
	xsltproc --xinclude --output $@ docbook/fo/docbook.xsl $<

%.pdf: %.fo
	fop -c ~/Downloads/fop-1.1/conf/fop.xconf $< $@

.PHONY: clean
clean:
	rm -f accrete.html accrete.pdf accrete.pl

