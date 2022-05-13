<?xml version="1.0"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">

  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

  <xsl:template match="/forecast">
    <html>
      <body>
        <h2><xsl:value-of select="@queryLocation"/> [<xsl:value-of select="@queryTime"/>]</h2>

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

              <!-- if dayOfWeek is Mon, Tue, Wed, Thu, Fri, Sat, Sun, display weather data -->
              <xsl:if test="dayOfWeek = 'Mon' and dayOfWeek = 'Tue' and dayOfWeek = 'Wed' and dayOfWeek = 'Thu' and dayOfWeek = 'Fri' and dayOfWeek = 'Sat' and dayOfWeek = 'Sun'">
                <td align="center" width="100px" height="100px">
                  <!-- Print lowest to highest temperature -->
                  <p>
                    <xsl:value-of select="lowest" />
                    <xsl:text>° - </xsl:text>
                    <xsl:value-of select="highest" />
                    <xsl:text>°</xsl:text>
                  </p>
  
                  <!-- Print weather image -->
                  <img>
                    <xsl:attribute name="src">
                      <xsl:text>images/</xsl:text>
                      <xsl:value-of select="@overallCode"/>
                      <xsl:text>.png</xsl:text>
                    </xsl:attribute>
                  </img>
  
                  <!-- Print weather description -->
                  <p>
                    <xsl:choose>
                      <xsl:when test="@overallCode='cloudy'">
                        <span style="color:blue">
                          <xsl:value-of select="overall"/>
                        </span>
                      </xsl:when>
                      <xsl:when test="@overallCode='thunderstorm'">
                        <span style="color:green">
                          <xsl:value-of select="overall"/>
                        </span>
                      </xsl:when>
                      <xsl:when test="@overallCode='rain'">
                        <span style="color:green">
                          <xsl:value-of select="overall"/>
                        </span>
                      </xsl:when>
                      <xsl:when test="@overallCode='sunny'">
                        <span style="color:red">
                          <xsl:value-of select="overall"/>
                        </span>
                      </xsl:when>
                      <xsl:otherwise test="@overallCode='partlySunny'">
                        <span style="color:purple">
                          <xsl:value-of select="overall"/>
                        </span>
                      </xsl:otherwise>
                    </xsl:choose>
                  </p>
                </td>
              </xsl:if>
              <!-- if dayOfWeek is not Mon, Tue, Wed, Thu, Fri, Sat, Sun, display empty cell -->
              <xsl:if test="dayOfWeek != 'Mon' and dayOfWeek != 'Tue' and dayOfWeek != 'Wed' and dayOfWeek != 'Thu' and dayOfWeek != 'Fri' and dayOfWeek != 'Sat' and dayOfWeek != 'Sun'">
                <td align="center" width="100px" height="100px">
                </td>
              </xsl:if>

              <!-- else display empty cell -->
              <!-- <xsl:if test="dayOfWeek!='Mon'">
                <td align="center" bgcolor="white"></td>
              </xsl:if> -->


              
            </tr>   <!-- end of one row in the table -->
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>