<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:db="http://docbook.org/ns/docbook"
		xmlns:math="math:math"
		exclude-result-prefixes="math db"
		db:version="5.0">

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
    <xsl:document href="math/{generate-id()}.tex" omit-xml-declaration="yes">\nopagenumbers
$$ <xsl:value-of select="db:alt/text()"/> $$
\bye
    </xsl:document>
  </xsl:template>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
