<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="3.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html lang="es">
            <head>
                <meta charset="UTF-8"/>
                <title>Participantes</title>
                <link rel="stylesheet" href="estilos.css"/>
            </head>
            <body>
                <div class="header">
                    <h1>Información del concurso</h1>
                </div>
                
                <main>
                    <h2>Listado de Participantes</h2>
                    <ol class="participantes">
                        <xsl:for-each select="//participante">
                            <!-- Lista de participantes-->
                            <li>
                                <xsl:text>Apellidos: </xsl:text><xsl:value-of select="apellidos"/>
                                <xsl:text>, nombre: </xsl:text><xsl:value-of select="nombre"/>
                                <xsl:text>, codigo: </xsl:text><xsl:value-of select="@codigo"/>
                                <xsl:text> - </xsl:text><xsl:value-of select="puntos"/><xsl:text> puntos.</xsl:text>
                            </li>
                        </xsl:for-each>
                    </ol>
                    
                    <h2>5 - Mejores participantes con más de 20 puntos</h2>
                    <table class="participantes-t ancho">
                        <thead>
                            <tr>
                                <th>Posición</th>
                                <th>Participante</th>
                                <th>Puntos</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Tabla de participantes-->
                            <xsl:for-each select="//participante[puntos>=20]">
                                <xsl:sort select="puntos" order="descending"/>
                                <xsl:if test="position()&lt;6">
                                    <tr>
                                        <td>
                                            <xsl:value-of select="position()"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="apellidos"/>
                                            <xsl:text>, </xsl:text>
                                            <xsl:value-of select="nombre"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="puntos"/>
                                        </td>
                                    </tr>
                                </xsl:if>
                            </xsl:for-each>
                        </tbody>
                    </table>
                    
                    <div class="estad">
                        <h2>Estadísticas</h2>
                        <xsl:variable name="cant_participantes" select="count(//participante)"/>
                        <ul>
                            <li>
                                <span>Número total de participantes:</span><span class="stats">
                                    <xsl:value-of select="$cant_participantes"/>
                                </span>
                            </li>
                            <li><span>Puntuación media:</span> <span class="stats">2,5</span></li>
                            <li><span>Participantes de 18 a 35 años:</span> <span class="stats">3 (12,34%)</span></li>
                            <li><span>Participantes de 36 a 55 años:</span> <span class="stats">4 (12,34%)</span></li>
                            <li><span>Participantes de más de 55 años:</span> <span class="stats">6 (12,34%)</span></li>
                        </ul>
                        <table class="participantes-t">
                            <thead>
                                <tr>
                                    <th>Provincia</th>
                                    <th>Nº Participantes</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Tabla de participantes por provincia -->
                                <tr>
                                    <td>Provincia A</td>
                                    <td>15</td>
                                </tr>
                                <tr>
                                    <td>Provincia B</td>
                                    <td>10</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    
                </main>
            </body>
            <br/>
            <footer>
                <p>Pablo Redolar - 2024</p>
            </footer>
        </html>
    </xsl:template>
</xsl:stylesheet>