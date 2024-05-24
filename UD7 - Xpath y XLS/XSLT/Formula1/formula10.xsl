<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
    
    <xsl:output method="html" indent="yes"/>
    
    
    <xsl:template match="/formula1" >
        <html lang="es">
            <head>
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
                            <xsl:for-each select="//coche">
                                <xsl:variable name="modelo" select="@modelo"/>
                                <tr>
                                    <td><xsl:value-of select="../@nombre"/></td>
                                    <td><xsl:value-of select="@modelo"/></td>                            
                                    <td><xsl:value-of select="@piloto"/></td>
                                    <td><xsl:value-of select="@puntos"/></td>
                                </tr>
                            </xsl:for-each>
                            <!-- Lista de equipos y coches generada por XSLT -->
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
                            <xsl:for-each select="//coche">
                                <xsl:variable name="modelo" select="@modelo"/>
                                <tr>
                                    <td><xsl:value-of select="position()"/></td>
                                    <td><xsl:value-of select="@piloto"/></td>
                                    <td><xsl:value-of select="../@nombre"/></td>                            
                                    <td><xsl:value-of select="@puntos"/></td>
                                </tr>
                            </xsl:for-each>
                            <!-- Clasificación general generada por XSLT -->
                        </tbody>
                    </table>
                    <!-- Estadísticas -->
                    <div class="estad">
                        <h2>Estadísticas</h2>
                        <ul>
                            <li><span>Número total de equipos: </span><xsl:value-of select="count(//@nombre)"/> <span class="stats"><!-- Inserta aquí el número total de equipos --></span></li>
                            <li><span>Número total de coches: </span> <xsl:value-of select="count(//coche)"/> <span class="stats"><!-- Inserta aquí el número total de coches --></span></li>
                            <li><span>Puntuación media: </span> <xsl:value-of select="format-number(sum(//coche/@puntos) div count(//coche), '0.00')"/> <span class="stats"><!-- Inserta aquí la puntuación media --></span></li>
                        </ul>
                        
                        <!-- Tabla de participantes por provincia -->
                        <table class="participantes-t">
                            <thead>
                                <tr>
                                    <th>Provincia</th>
                                    <th>Nº Equipos</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Tabla de participantes por provincia generada por XSLT -->
                                <!-- Inserta aquí el HTML resultante después de aplicar la transformación XSLT -->
                            </tbody>
                        </table>
                    </div>
                </main>
                <footer>
                    <p>Nombre del Alumno - 2024</p>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    
    
</xsl:stylesheet>