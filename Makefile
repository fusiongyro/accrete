all: accrete.html accrete.pdf

# let's see how we go about creating some math for inclusion
%.dvi %.log: %.tex
	tex -output-directory=math $<

%.eps: %.dvi
	dvips -E $< -o $@

%.pdf: %.eps
	perl epstopdf.pl $< --outfile=$@

%.pgm: %.pdf
	pdftoppm -gray $< foo
	mv foo-000001.pgm $@

%.jpeg: %.pgm
	pnmtojpeg $< > $@

# code generating style
#%.pl: %.docbook code.xsl
#	xsltproc --output $@ code.xsl $<

.SECONDARY: math/instantaneous-mass.jpeg math/effective-density.jpeg math/instantaneous-mass.pdf math/effective-density.pdf

# document output: HTML and then FO
%.html: %.docbook dkl.css.xml docbook/xhtml5/docbook.xsl docbook/xhtml5/syntax-highlighting.xsl math/instantaneous-mass.jpeg math/effective-density.jpeg
	xsltproc --xinclude --output $@ docbook/xhtml5/docbook.xsl $<

%.fo: %.docbook docbook/fo/docbook.xsl
	xsltproc --xinclude --output $@ docbook/fo/docbook.xsl $<

%.pdf: %.fo math/instantaneous-mass.pdf math/effective-density.pdf
	fop -c ~/Downloads/fop-1.1/conf/fop.xconf $< $@

.PHONY: clean
clean:
	rm -f accrete.html accrete.pdf accrete.pl

