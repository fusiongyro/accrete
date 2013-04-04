<?xml version='1.0'?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:sh="xmlns:sh"
    exclude-result-prefixes="d sh">

  <!-- Syntax Highlighting -->

  <!-- First we need to inject some Javascript and some CSS into the <head> -->
  <xsl:template name="user.head.content">
    <!-- the main script -->
    <script type="text/javascript" src="shjs-0.6/sh_main.min.js">&#160;</script>

    <!-- Prolog support -->
    <script type="text/javascript" src="shjs-0.6/lang/sh_prolog.js">&#160;</script>

    <!-- The "The" theme, which is nicer than the default nedit theme -->
    <link type="text/css" rel="stylesheet" href="shjs-0.6/css/sh_the.css"/>

    <!-- let's set an encoding here -->
    <meta charset="utf-8"/>
  </xsl:template>

  <!-- Next, we need to make sure there is an onload property on the body -->
  <xsl:template name="body.attributes">
    <xsl:attribute name="onload">sh_highlightDocument();</xsl:attribute>
  </xsl:template>

  <!-- Finally, we need to tag our programlistings with a special
       class to indicate that we want source highlighting. Note that
       it's only going to handle Prolog this way. -->
  <xsl:template match="programlisting[@sh:language]">
    <pre>
      <xsl:attribute name="class">programlisting sh_<xsl:value-of select="@sh:language"/></xsl:attribute>
      <xsl:apply-templates/>
    </pre>
  </xsl:template>
</xsl:stylesheet>
