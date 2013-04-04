<?xml version='1.0'?>
<xsl:stylesheet  
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="d">

  <!-- We're customizing the HTML5 template -->
  <xsl:import href="http://docbook.sourceforge.net/release/xsl/current/xhtml5/docbook.xsl"/>

  <!-- Standard parameter settings -->
  <xsl:param name="make.clean.html" select="true"/>
  <xsl:param name="custom.css.source" select="'dkl.css.xml'"/>

  <!-- Include common stuff -->
  <xsl:include href="../common/common.xsl"/>
  
  <!-- Syntax highlighting -->
  <xsl:include href="syntax-highlighting.xsl"/>
</xsl:stylesheet>
