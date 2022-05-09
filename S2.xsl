<?xml version="1.0"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes" />
        <xsl:template match="S2.xml">
            <html>
                <h2><xsl:value-of select="@queryLocation"> [<xsl:value-of select="@queryTime">]</xsl:value-of></xsl:value-of></h2>
                
                <!-- Create table of weather data info -->
                <table border="1">


                </table>
            </html>
        </xsl:template>
</xsl:stylesheet>