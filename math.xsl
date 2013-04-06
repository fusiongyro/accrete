<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:db="http://docbook.org/ns/docbook"
		db:version="5.0">
  <xsl:output method="text" omit-xml-declaration="yes"/>

  <xsl:template match="/">
    <xsl:apply-templates select="//db:informalequation/db:mediaobject"/>
    <xsl:apply-templates select="//db:inlineequation/db:mediaobject"/>
  </xsl:template>
  
  <xsl:template match="db:mediaobject">
    <xsl:document href="math/{@xml:id}.tex" omit-xml-declaration="yes">\nopagenumbering
$$ <xsl:value-of select="db:alt/text()"/> $$
\bye
    </xsl:document>
  </xsl:template>
</xsl:stylesheet>
