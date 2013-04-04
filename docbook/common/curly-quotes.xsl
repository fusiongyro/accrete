<xsl:stylesheet  
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:d="http://docbook.org/ns/docbook"
    exclude-result-prefixes="d">

  <!-- define the kinds of quotes we're going to fix -->
  <xsl:param name="singlequote"><xsl:text>'</xsl:text></xsl:param>
  <xsl:param name="curlyquote"><xsl:text>’</xsl:text></xsl:param>

  <!-- apply the fix -->
  <xsl:template match="para/text() | title/text()">
    <xsl:value-of select="translate(.,$singlequote,$curlyquote)"/>
  </xsl:template>
</xsl:stylesheet>
