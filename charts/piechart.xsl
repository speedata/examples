<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="charts.xsl" />
	<xsl:output method="xml" indent="yes" version="1.0" encoding="UTF-8" standalone="no"
        doctype-public="-//W3C//DTD SVG 1.1//EN" doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" />
	<xsl:template match="data">
        <xsl:call-template name="pieChart">
            <xsl:with-param name="xData" select="datum/x" />
            <xsl:with-param name="yData" select="datum/y" />
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>