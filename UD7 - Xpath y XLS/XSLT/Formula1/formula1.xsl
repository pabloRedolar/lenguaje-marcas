<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
    
    <xsl:output method="html" indent="yes"/>
    
    
    <xsl:template match="/formula1" >
        <html lang="es">
            <head>
                <meta charset="UTF-8"/>
                <title>Clasificación de Fórmula 1</title>
                <link rel="stylesheet" href="estilos.css"/>
            </head>
            <body>
                <div class="header">
                    <h1>Clasificación de Fórmula 1</h1>
                </div>
                
                <main>
                    <h2>Listado de Equipos y Coches</h2>
                    <table class="formula1-t ancho">
                        <thead>
                            <tr>
                                <th>Equipo</th>
                                <th>Modelo</th>
                                <th>Piloto</th>
                                <th>Puntos</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Lista de equipos y coches generada por XSLT -->
                            <xsl:for-each select="//coche">
                            <tr>
                                    <td><xsl:value-of select="../@nombre"/></td>
                                    <td><xsl:value-of select="@modelo"/></td>
                                    <td><xsl:value-of select="@piloto"/></td>
                                    <td><xsl:value-of select="@puntos"/></td>
                            </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                    
                    <h2>Clasificación General</h2>
                    <table class="formula1-t ancho">
                        <thead>
                            <tr>
                                <th>Posición</th>
                                <th>Piloto</th>
                                <th>Equipo</th>
                                <th>Puntos</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Clasificación general generada por XSLT -->
                            <xsl:for-each select="//coche">
                            <xsl:sort select="//@puntos" order="descending">
                                
                            </xsl:sort>
                                <tr>
                                    <td><xsl:value-of select="position()"/></td>
                                    <td><xsl:value-of select="@piloto"/></td>
                                    <td><xsl:value-of select="../@nombre"/></td>
                                    <td><xsl:value-of select="@puntos"/></td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </main>
            </body>
        </html>
        
    </xsl:template>
    
</xsl:stylesheet>