#include <MsgBoxConstants.au3>
#include <MsgBoxConstants.au3>

$WindwosUser = @UserName
$cmd = "net localgroup administrators " & $WindwosUser & " /add"



MsgBox($MB_SYSTEMMODAL, "Title", $cmd , 10)
