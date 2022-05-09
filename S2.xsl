<?xml version="1.0"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes" />
        <xsl:template match="/forecast">
            <html>
                <head>
                    <h3><xsl:value-of select="@queryLocation"></xsl:value-of> [<xsl:value-of select="@queryTime"></xsl:value-of>]</h3>
                </head>
                <body>
                    <!-- Create table of weather data info -->
                    <table border="1">
                        <tr align="center" bgcolor="orange">
                            <th>Date</th>
                            <th>Mon</th>
                            <th>Tue</th>
                            <th>Wed</th>
                            <th>Thu</th>
                            <th>Fri</th>
                            <th>Sat</th>
                            <th>Sun</th>
                        </tr>
                        
                        <xsl:for-each select="weather">
                            <tr>
                                <!-- Display date (in decending order)-->
                                <td><xsl:value-of select="@yyyymmdd"/></td>
                                
                                <!-- Extract day and month of weather forecast for first column of data-->
                                <td><xsl:value-of select="concat(@month, ' ', @date)"/></td> 
                                
                                
                            </tr>   
                        </xsl:for-each>
                    </table>
                </body>
            </html>
        </xsl:template>
</xsl:stylesheet>