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
                        </tr>   <!-- end of date row -->

                        <tr>
                            <xsl:when test="dayOfWeek='Mon'">
                            <!-- Display column in first column of table --> 
                            <td align="center" bgcolor="yellow"><xsl:value-of select="highest" /></td>
                            
                            <!-- Display column in second column of table -->
                            <td align="center" bgcolor="yellow"><xsl:value-of select="lowest" /></td>
                            


                        </tr>

                        <!-- Display different weather data depending on overallCode -->
                        <xsl:choose>
                            <xsl:when test="overallCode='sunny'">
                                    <!-- Display temperature lowest-highest and corresponding image and description -->
                                <td align="center"><xsl:value-of select="lowest" />&deg; - <xsl:value-of select="highest" />&deg;</td>
                                <td align="center"><img src="sunny.png" alt="sunny" /></td>
                                <td align="center" bgcolor="red"><xsl:value-of select="overall" /></td>
                            </xsl:when>
                            <xsl:when test="overallCode='partlySunny'">
                                <td align="center"><xsl:value-of select="lowest" />&deg; - <xsl:value-of select="highest" />&deg;</td>
                                <td align="center"><img src="partlySunny.png" alt="partlySunny" /></td>
                                <td align="center" bgcolor="purple"><xsl:value-of select="overall" /></td>
                            </xsl:when>
                            <xsl:when test="overallCode='cloudy'">
                                <td align="center"><xsl:value-of select="lowest" />&deg; - <xsl:value-of select="highest" />&deg;</td>
                                <td align="center"><img src="cloudy.png" alt="cloudy" /></td>
                                <td align="center" bgcolor="blue"><xsl:value-of select="overall" /></td>
                            </xsl:when>
                            <xsl:when test="overallCode='rain'">
                                <td align="center"><xsl:value-of select="lowest" />&deg; - <xsl:value-of select="highest" />&deg;</td>
                                <td align="center"><img src="rain.png" alt="rain" /></td>
                                <td align="center" bgcolor="green"><xsl:value-of select="overall" /></td>
                            </xsl:when>
                            <xsl:when test="overallCode='thunderstorm'">
                                <td align="center"><xsl:value-of select="lowest" />&deg; - <xsl:value-of select="highest" />&deg;</td>
                                <td align="center"><img src="thunderstorm.png" alt="thunderstorm" /></td>
                                <td align="center" bgcolor="green"><xsl:value-of select="overall" /></td>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>