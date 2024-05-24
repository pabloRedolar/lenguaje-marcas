<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="3.0">

    <xsl:template match="/" >
        <html lang="en">
            <head>
                <title>Document</title>
            </head>
        <body>
            <h1>Cesta de la compra</h1>
            <!-- Mostramos el nombre del producto -->
            <table border="1">
                <tr bgcolor="#a0a0ff">
                    <th>Id Producto</th>
                    <th>Nombre del producto</th>
                    <th>Origen</th>
                    <th>Cantidad (kg)</th>
                    <th>Precio Total</th>
                </tr>

                <xsl:for-each select="cesta/producto">
                    <tr>
                        <td>
                            <xsl:value-of select="@idproducto"/>
                        </td>
                        <td>
                            <xsl:value-of select="nombre"/>
                        </td>
                        <td>
                            <xsl:value-of select="origen"/>
                        </td>
                        <td>
                            <xsl:value-of select="cantidad"/>
                        </td>
                        <td>
                            <xsl:value-of select="coste"/> €
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
        </body>
        </html>
    </xsl:template>

    

</xsl:stylesheet>
