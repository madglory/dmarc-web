<?xml version="1.0"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
    <!-- Copy everything -->
    <xsl:template match="@*|node()">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
    </xsl:template>
    
    <!-- Add default namespace to reports @BJC -->
    <xsl:template match="feedback"><!-- Catching element(eg. row) that you want to change -->
      <xsl:element name="provider:feedback" xmlns:provider="urn:dmarc"><!-- Replace row element with Paragraph element by creating Paragraph element-->
        <xsl:apply-templates select="@*|node()"/><!-- Copy everything under row node and put them here -->
      </xsl:element>
    </xsl:template> 

    <!-- Fix previously reported Google syntax error @BJC -->
    <xsl:template match="identities"><!-- Catching element(eg. row) that you want to change -->
      <xsl:element name="identifiers"><!-- Replace row element with Paragraph element by creating Paragraph element-->
        <xsl:apply-templates select="@*|node()"/><!-- Copy everything under row node and put them here -->
      </xsl:element>
    </xsl:template> 
</xsl:stylesheet>
