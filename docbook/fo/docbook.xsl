<?xml version='1.0'?>
<xsl:stylesheet  
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:d="http://docbook.org/ns/docbook"
    exclude-result-prefixes="d">
  <xsl:import href="http://docbook.sourceforge.net/release/xsl/current/fo/docbook.xsl"/>

  <xsl:include href="../common/common.xsl"/>

  <xsl:param name="monospace.font.family">Ubuntu Light</xsl:param>
  <xsl:param name="monospace.font.size">9pt</xsl:param>
  
  <xsl:attribute-set name="monospace.verbatim.properties">
    <xsl:attribute name="keep-together.within-column">always</xsl:attribute>
  </xsl:attribute-set>
</xsl:stylesheet>
