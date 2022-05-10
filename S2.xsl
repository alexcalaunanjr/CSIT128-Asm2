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
                <table border="1" empty-cells="show">
                    <tr name="tableHeading" align="center" bgcolor="orange">
                        <th>Date</th>
                        <th>Mon</th>
                        <th>Tue</th>
                        <th>Wed</th>
                        <th>Thu</th>
                        <th>Fri</th>
                        <th>Sat</th>
                        <th>Sun</th>
                    </tr>

                    <!-- Loop through each weather data entry -->
                    <xsl:for-each select="weather">
                        <!-- Sort date in decending order -->
                        <xsl:sort select="@yyyymmdd" data-type="numeric" order="descending" />
                        <tr align="center">                                
                            <!-- e.g., Date looks like this: 01 Jun-->
                            <td align="center" bgcolor="orange"><xsl:value-of select="concat(date,' ')" />   
                                <!-- Convert month number to month name -->
                                <xsl:choose>
                                    <xsl:when test="month='1'">Jan</xsl:when>
                                    <xsl:when test="month='2'">Feb</xsl:when>
                                    <xsl:when test="month='3'">Mar</xsl:when>
                                    <xsl:when test="month='4'">Apr</xsl:when>
                                    <xsl:when test="month='5'">May</xsl:when>
                                    <xsl:when test="month='6'">Jun</xsl:when>
                                    <xsl:when test="month='7'">Jul</xsl:when>
                                    <xsl:when test="month='8'">Aug</xsl:when>
                                    <xsl:when test="month='9'">Sep</xsl:when>
                                    <xsl:when test="month='10'">Oct</xsl:when>
                                    <xsl:when test="month='11'">Nov</xsl:when>
                                    <xsl:when test="month='12'">Dec</xsl:when>
                                </xsl:choose>
                            </td>
                            
                            <td align="center">
                                <!-- When dayOfWeek is Mon, print the following -->
                                <xsl:when test="dayOfWeek='Mon'">
                                    <!-- Print lowest to highest temperature -->
                                    <xsl:value-of select="lowest" />&deg; 
                                    <xsl:text> - </xsl:text>
                                    <xsl:value-of select="highest" />&deg;

                                    <!-- Line break before image -->
                                    <xsl:text>&#xa;</xsl:text>

                                    <!-- Print weather image -->
                                    <img>
                                        <xsl:attribute name="src">
                                          <xsl:text>images/</xsl:text>
                                          <xsl:value-of select="@overallCode"/>
                                          <xsl:text>.png</xsl:text>
                                        </xsl:attribute>
                      
                                        <xsl:attribute name="width">
                                          <xsl:text>30px</xsl:text>
                                        </xsl:attribute>
                                     </img>

                                    <!-- Line break after image -->
                                     <xsl:text>&#xa;</xsl:text>

                                    <!-- Print overall weather description -->
                                     <xsl:value-of select="@overall"/>
                                </xsl:when>
                                <!-- When dayOfWeek is not Mon, print nothing -->
                                <xsl:otherwise>
                                    <xsl:text></xsl:text>
                                </xsl:otherwise>
                            </td>
                        </tr>   <!-- end of one row in the table -->
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>