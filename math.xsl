<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:db="http://docbook.org/ns/docbook"
		xmlns:math="math:math"
		exclude-result-prefixes="math db"
		db:version="5.0">

    <!-- This is where all the work really happens: we convert the three
      equation types into their true DocBook representations, also
      generating the necessary media includes for the TeX output we're generating -->
  <xsl:template match="math:informalequation|math:inlineequation|math:equation">
    <xsl:element name="{local-name()}" namespace="http://docbook.org/ns/docbook">
      <mediaobject xmlns="http://docbook.org/ns/docbook">
        <alt><xsl:value-of select="text()"/></alt>
          <imageobject role="html">
        <imagedata fileref="math/{generate-id()}.jpeg"/>
        </imageobject>
        <imageobject role="fo">
          <imagedata fileref="math/{generate-id()}.pdf"/>
        </imageobject>
      </mediaobject>
    </xsl:element>

    <!-- This is where we generate the actual TeX input file -->
    <xsl:document href="math/{generate-id()}.tex" omit-xml-declaration="yes">\nopagenumbers
$$ <xsl:value-of select="text()"/> $$
\bye</xsl:document>
  </xsl:template>

  <!-- This is the generic "copy" template that will be invoked one
    every other kind of node -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
