<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
    
    <xsl:output method="html" indent="yes"/>
    
    
    <xsl:template match="/" >
        <html lang="es">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title> 
                    <xsl:value-of select="empresa/@nombre"/>
                </title>
                <link rel="stylesheet" href="../CSS/estilos.css"/>
            </head>
            
            <body>
                <div class="info">Datos del primer primer empleado</div>
                <table>
                    <caption>El Corte Inglés</caption>
                    <tbody>
                        <tr>
                            <th>Nombre</th>
                            <th>Trabajo</th>
                            <th>Sueldo</th>
                        </tr>
                        <xsl:for-each select="//empleado" >
                        <xsl:sort select="nombre" order="descending"/>
                        

                        <tr>
                            <xsl:choose>
                                <xsl:when test="sueldo &gt; 2700">
                                        <xsl:attribute name="class">gt-2700</xsl:attribute>
                                </xsl:when>
                                <xsl:when test="sueldo &lt; 2700">
                                    <xsl:attribute name="class">lt-2700</xsl:attribute>
                            </xsl:when>
                            </xsl:choose>

                            <td>
                                <xsl:if test="@nacionalidad">
                                    <span class="nationality">
                                        <xsl:value-of select="@nacionalidad"></xsl:value-of>
                                    </span>
                                </xsl:if>

                                <xsl:value-of select="nombre"/>
                            </td>
                            <td>
                                <xsl:value-of select="trabajo"/>
                            </td>
                            <td class="number">
                                <xsl:value-of select="format-number(sueldo,'#.00')"/>
                            </td>
                        </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                
            </body>
            
        </html>
    </xsl:template>
</xsl:stylesheet>