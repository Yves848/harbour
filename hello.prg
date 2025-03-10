#include "Box.ch"

PROCEDURE Main()
    

    LOCAL maxRow, maxCol  // Déclaration AVANT toute exécution
    LOCAL cTest := space(10)
    REQUEST HB_CODEPAGE_UTF8
    HB_CDPSELECT( "UTF8" )
    CLS

    maxRow := MaxRow()
    maxCol := MaxCol()

    // Vérification des limites avant de dessiner la boîte
    IF maxRow > 1 .AND. maxCol > 1
        @ 1, 1 TO maxRow - 1, maxCol - 1 
    ENDIF
    set color to "W/N,W/N"
    @ 1, 1 SAY "╭"
    @ 5, 10 SAY "Hello, Harbour!"
    @ 6, 10 GET cTest
    READ

    @ 15, 15, 22, 79 BOX B_DOUBLE_SINGLE

    INKEY(0)  // Attend une touche avant de quitter
RETURN
