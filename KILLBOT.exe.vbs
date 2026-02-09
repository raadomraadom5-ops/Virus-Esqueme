Set shell = CreateObject("WScript.Shell")

' 1. El susto inicial
MsgBox "DIAGNOSTIC: KILLBOT PROTOCOL OVERRIDE", 16, "SYSTEM FAILURE"

' 2. Abrir la música de Doom en segundo plano
' Usamos "start" para que abra el navegador y el script siga corriendo
shell.Run "cmd /c start https://youtu.be/DraDpi4bM-Y?si=OdfqjFwjRvRh6o0o", 0

WScript.Sleep 3000

' 3. Bucle de Modo Kiosk
Do
    ' Creamos el archivo HTML temporal
    Set fso = CreateObject("Scripting.FileSystemObject")
    tempHTML = fso.GetSpecialFolder(2) & "\killbot_kiosk.html"
    
    Set file = fso.CreateTextFile(tempHTML, True)
    file.WriteLine "<html><body style='margin:0; background-color:black; overflow:hidden; cursor:none;'>"
    file.WriteLine "<img src='https://img.freepik.com/fotos-premium/fondo-diseno-cuadrado-abstracto-rojo_7954-28487.jpg?semt=ais_hybrid&w=740&q=80' style='width:100vw; height:100vh; object-fit:cover;'>"
    file.WriteLine "</body></html>"
    file.Close

    ' Ejecutamos Microsoft Edge en modo KIOSK
    ' --kiosk fuerza el F11 absoluto y --edge-kiosk-type=fullscreen quita barras
    shell.Run "msedge.exe --kiosk " & tempHTML & " --edge-kiosk-type=fullscreen", 3, True
    
    ' Si logran cerrarlo, espera medio segundo y vuelve a atacar
    WScript.Sleep 500
Loop