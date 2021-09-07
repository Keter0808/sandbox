#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>

$WindwosUser = @UserName
$cmd = "net localgroup administrators " & $WindwosUser & " /add"
$BatchPath = "C:\Users\"& $WindwosUser&"\Desktop\adduser.bat"
CreateBatch()
;Example()

MsgBox($MB_SYSTEMMODAL, "Title", $cmd , 10)


Func CreateBatch()
	  If FileExists ($BatchPath) Then
			FileDelete ($BatchPath)
			FileWrite($BatchPath,$cmd)
		 Else
			FileWrite($BatchPath,$cmd)
	  EndIf
EndFunc


Func Example()
    ; Change the username and password to the appropriate values for your system.
    Local $sUserName = "labuser"
    Local $sPassword = "Sandbox@00"

    ; Run Notepad with the window maximized. Notepad is run under the user previously specified.
    Local $iPID = RunAs($sUserName, @ComputerName, $sPassword, $RUN_LOGON_NOPROFILE, $BatchPath, "")
    ; Wait 10 seconds for the Notepad window to appear.
    ;WinWait("[CLASS:Notepad]", "", 10)
    ; Wait for 2 seconds.
    ;Sleep(1800000)
    ; Close the Notepad process using the PID returned by RunAs.
    ProcessClose($iPID)
EndFunc   ;==>Example
