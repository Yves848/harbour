FUNCTION RunPowerShell( cCommand )
  LOCAL hPipe, cLine, cResult := ""

  // Ouvre un pipe pour exécuter PowerShell
  hPipe := hb_popen( "pwsh -Command " + hb_OsEncode( cCommand ) + " 2>&1", "r" )

  IF hPipe != NIL
      // Lire chaque ligne de la sortie PowerShell
      DO WHILE .T.
          cLine := hb_fgets( hPipe )  // Récupérer une ligne
          IF EMPTY( cLine )
              EXIT
          ENDIF
          cResult += cLine  // Ajouter à la sortie finale
      ENDDO
      hb_pclose( hPipe )  // Fermer le pipe
  ELSE
      cResult := "Erreur : Impossible d'exécuter PowerShell"
  ENDIF

RETURN cResult

PROCEDURE Main()
  LOCAL cOutput
  CLS

  // Exécuter une commande PowerShell et récupérer le résultat
  cOutput := RunPowerShell( "Get-Date" )

  // Afficher le résultat dans Harbour
  ? "Résultat de PowerShell :"
  ? cOutput

  INKEY(0)  // Attente avant de quitter
RETURN
