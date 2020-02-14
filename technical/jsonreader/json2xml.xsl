<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" default-mode="main">
  <xsl:output indent="yes"/>

  <xsl:template name="main">
    <xsl:variable name="doc" select="json-to-xml(unparsed-text('us-500.json'))"/>
    <xsl:copy-of select="$doc"/>
  </xsl:template>
</xsl:stylesheet>
