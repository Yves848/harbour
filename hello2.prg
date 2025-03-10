FUNCTION RunPowerShellCommand( cCommand )
  LOCAL cOutputFile := "ps_output.txt"
  LOCAL cFullCommand := "powershell -Command " + hb_ValToStr( cCommand ) + " > " + cOutputFile
  LOCAL nResult := hb_run( cFullCommand )

  IF hb_FileExists( cOutputFile )
    cResult := hb_MemoRead( cOutputFile )
    hb_FileDelete( cOutputFile )  // Nettoyage
    RETURN cResult
  ENDIF

RETURN ""


PROCEDURE Main()
  LOCAL cCmd := '"Get-Date"'
  LOCAL cResult := RunPowerShellCommand( cCmd )
    
  ? "Résultat de PowerShell:", cResult
  INKEY(0)
RETURN
