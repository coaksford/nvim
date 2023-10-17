local function zuli_header()
    return {
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⡢⡐⠜⠂⠀⠀⠀⠀⠀⠀                              ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀ ⠀   ",
        "⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠐⠠⡸⣼⠁⠀⠀⠀                                                                 ",
        "⠀⠀  ⠀⠀⠀⠀⢨⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠐⡌⡪⣪⢯⠀⡀⠀                                                                  ",
        "⠀⠀⠀⠀⠀⠀⠀⠀⢘⡄⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠌⢀⢢⠱⡝⣜⢽⡔⢀⠀⢀                                                                 ",
        "⠀       ⠀⡪⣐⠀⡀⠐⠀⠄⠀⠀⡀⠄⠂⠠⠐⡐⢌⠪⢨⢘⢎⢯⢦⡂⠄⡀                              ⣠⣀⣂⡈⡀⠄⠁⢀⠀⡀⠀⠀⠀⠀⠀          ⠀⠀       ",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⢃⠫⡒⡒⢅⢂⠢⠡⠐⢀⠡⠈⢔⠨⡂⠕⡡⠢⠡⡃⡳⡙⢗⢴⣠⡀⠄⢀⠠                    ⠀⠀⠀ ⠀⠀⠈⠈⠚⠛⡾⡺⣔⢤⢄⠔⠈⠀⠀          ⠀⠀⠀       ",
        "⠀        ⠐⠠⢑⠨⠨⢐⠐⡀⠅⢈⠀⠌⢌⢎⠆⡊⠔⡠⠡⢁⠂⡂⠪⠨⢂⢊⠪⠙⣐⡐⢄⠆⢄⢅⣂⠀⠄⠀ ⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⡀⡢⠑⠩⢳⡕⡝⡝⡆⡄⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀       ",
        "⠀        ⠀⠀⠂⠌⠨⠀⢂⠠⠐⠀⠄⢡⣳⢱⢑⢌⠌⢔⠨⢀⠢⠨⠐⡁⡂⢔⢐⢑⢔⡵⢵⢝⣮⠎⠈⠙⠒⠅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠊⠀⠂⠀⡀⡗⡕⣝⢜⢌⠄⠄⠂⠄⠁⠀ ⠀⠀ ⠀⠀⠀⠀       ",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠄⡁⠄⠀⠂⢈⠀⠪⠺⠸⡐⠅⠕⠐⡈⢐⠨⣐⢑⠔⢌⠢⡡⠱⡐⢽⡯⡯⣿⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀              ⠀⡁⣀⣢⡺⠨⢂⠑⠄⡅⠕⡡⠡⢂⢁⠐⠀⠀⠀⠀⠀⠀ ⠀       ",
        "⠀⠀           ⠀⠐⢀⠁⡈⢀⠀⠈⠜⡐⠠⠁⠌⠠⠐⢀⠂⠪⢲⡡⡱⢨⠨⡪⡘⢔⢝⣯⢿⣎⠄⠀        ⠀⠀⠀  ⠀⠀⠀ ⠀⠀⠀⠤⠓⠳⢜⣕⣔⢤⢑⠠⠡⡁⡂⠅⠂⠅⠅⠢⡨⠀⠂⠀ ⠀⠀⠀⠀       ",
        "⠀⠀           ⠀⠈⠀⠄⠠⠀⡀⠁⠀⠂⠅⠡⠈⡀⠂⠠⠈⠌⡐⠨⠪⡪⡪⡢⡣⡣⡲⣸⡫⡿⣶⡀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠄⡂⠀⠀⠀⠀ ⠀⠀⠀ ⠀⣷⣳⢽⡪⡪⢢⠢⡠⡁⠅⠌⠄⠡⠈⠌⠀⠁⠄ ⠀         ",
        "⠀⠀          ⠀⠀⠀⠀⠐⠀⡁⠠⠀⠁⠈⠨⢀⠁⠠⠈⠀⠌⡂⠄⠡⢁⢂⠪⡑⡳⠱⡧⡳⣽⢽⣳⣟⣦⡐   ⠀ ⠀⠀⠂⢸⣐⣴⣇⡌⠀ ⠀⠀⠀⠀  ⢰⣟⣾⢽⢪⢪⠪⡌⢆⢕⠱⡑⠌⠀⠡⠐⠀⠁⡀⢂⠀⠀        ",
        "⠀               ⠀⠀⠀⠐⠀⡁⠠⠈⠀⠌⢀⠈⢀⠡⠠⠁⠅⡂⡂⡑⢌⠪⠪⢪⠭⠮⠳⢕⠝⡚⡻⣳⣔⡀  ⠀ ⠘⠼⡮⣏⠖⠹⡄ ⠀  ⠀ ⣰⡿⣽⢞⡵⡣⡣⡣⡱⡑⠔⡁⠂⠄⢁⠀⠄⢁⠀⠄⠠⠀⠀        ",
        "⠀⠀               ⠀⠁⠀⠁⠀⠠⠀⠀⠂⠠⠐⠀⠂⠌⡨⢐⠐⢔⠌⠆⡡⢃⠃⡌⡌⡌⡔⢌⠠⠑⡐⠎⣟⣦⣢  ⠀⠈⢌⡎⡂⢑⢵⠁ ⠀ ⢌⣾⣗⢿⡹⡕⡧⡣⡣⣊⢐⠠⠁⡐⠈⠠⠀⠄⠀⠄⠠⠀⠂⠀⠀        ",
        "⠀⠀                    ⠀⠀⢁⠀⢁⠠⢈⠨⠀⠂⡂⢅⢑⠠⡑⡨⡢⡱⣪⢪⢪⠪⠣⠣⠣⠢⡨⠐⠘⠜⠯⡮⣔⡠⢀⡫⠠⠢⡹⣆⣂⣥⢾⢯⢳⠳⢙⠊⠅⡁⠅⢄⢐⠠⢑⠠⠂⠡⠈⠄⠅⢂⠂⠂⠄⢈⠀⠀        ",
        "⠀                    ⢀⠀⠈⠀⠀⠠⠐⢀⠂⡁⡁⡐⡐⢅⡕⠼⠚⠊⠉⠀⠀⠀⠀⠀⠀⠀⠠⠨⡐⡁⠐⢀⠈⢈⠻⣹⣆⠪⣸⡐⣽⡺⠑⠑⡁⠠⠐⠰⠨⠢⠕⠥⠣⣪⡪⡢⡢⡡⠡⡁⠅⡊⡐⢌⢂⠁⢀⠀         ",
        "⠀                    ⠀⠀⠀⠂⠄⠀⠄⠀⠄⠀⠐⠐⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⢌⠌⡀⠄⠀⠀⠓⡑⡥⣧⡃⠿⠀⠅⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠚⠳⠎⡢⠢⠨⠐⠐⠀⠀⠀⠀⠀       ",
        "⠀                              ⠀⠀⠀⠀⠀⠀⠀          ⠀⢸⢕⠅⡐⠀⡀⠡⠐⠨⡚⠸⡑⢈⠐⠀⠀⠀⠀           ⠀⠀⠀⠀⠁⠁⠈⠀⠀   ⠀       ",
        "⠀⠀                               ⠀⠀⠀⠐⡨⠴⢦⣆⡄⢀⠀⠀⠀⠀⠀⠀⢼⡃⡂⠠⠠⠀⡐⢄⠅⠌⠂⢂⢔⠄⠀⠀⠀⠀                               ",
        "⠀⠀                              ⠀⠀⠀⠀⢁⢀⠡⢁⠑⠻⣦⣂⢁⠀ ⠀⢌⢎⠂⡀⠂⡀⠂⠐⠈⠪⡆⣕⠇⠃⠀⠀⠀⠀                   ⠀⠀⠀⠀⠀⠀       ",
        "⠀⠀                              ⠀⠀ ⠈⢀⢴⠀⠀⠠⠁⡈⠪⠳⡬⣀⠕⡃⠄⠢⠀⠂⠄⠁⠀⠀⠀⠪⠾⠀⠀⠀⠀⠀⠀⠀                    ⠀⠀⠀⠀       ",
        "⠀⠀                               ⠀⠀⠀⡐⢽⠀⠀⠀⠀⠀⠄⠠⠀⡀⢀⠠⢀⠇⠅⠐⠀⠠⠁⠀⠠                                        ",
        "                                 ⠀⠀⠀⠐⡙⡄ ⠀⠀⠀⠀⠀⠀⠀⠀⠄⢊⢎⠠⠀⠀⠅⠀                                          ",
        "⠀                                   ⠀⠂⠱⡠⠀⠀   ⠀⢀⠁⢀⠀⠀⠀⠀⠀ ⠀⠀⠀                                        ",
        "⠀                               ⠀⠀⠀⠀⠀⠀⠁⡈⠢⡀⠀⠀⠀⡀⠂⠀⠀⠀                           ⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀       ",
        "⠀          ⠀⠀ ⠀⠀⠀                      ⠀⠀⠈⡈⠂⠄⠊⡀⠁⠀⠀                                     ⠀⠀⠀⠀       ",
        "                                                                                                  ",
        "⠀⠀ ⠀ ⠀  ⠀ ⠀⠀⠀⠀⠀ ⠀⠀⠀⠀ ⠀ ⠀ ⠀⠀⠀  ⠀⠀⠀⠀⠀ ⠀⠀⠀⠀ ⠀ ⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀    ⠀⠀         ⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀         ",
    }
end

