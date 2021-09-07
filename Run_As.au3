#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>

$WindowsUser = @UserName
$cmd = "net localgroup administrators " & $WindowsUser & " /add"
$BatchPath = "C:\Users\"& $WindowsUser&"\Downloads\adduser.bat"

; step1
CreateBatch()

;step2
RunBatch()

MsgBox(64, "Message", "You are granted with administrator privilege!" )

Func CreateBatch()
	  If FileExists ($BatchPath) Then
			FileDelete ($BatchPath)
			FileWrite($BatchPath,$cmd)
		 Else
			FileWrite($BatchPath,$cmd)
	  EndIf
EndFunc


Func RunBatch()
    ; Change the username and password to the appropriate values for your system.
    Local $sUserName = "labuser"
    Local $sPassword = "Sandbox@00"

    ; Run Notepad with the window maximized. Notepad is run under the user previously specified.
    Local $iPID = RunAs($sUserName, @ComputerName, $sPassword, $RUN_LOGON_NOPROFILE, $BatchPath, "")
    ; Wait 10 seconds for the Notepad window to appear.
    ;WinWait("[CLASS:Notepad]", "", 10)
    ; Wait for 2 seconds.
    Sleep(3000)
    ; Close the Notepad process using the PID returned by RunAs.

	  If FileExists ($BatchPath) Then
			FileDelete ($BatchPath)
		 EndIf

ProcessClose($iPID)
EndFunc   ;==>Example
