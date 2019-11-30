#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=C:\Users\Admin\Downloads\soundcloud_2dC_icon.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#EndRegion
#include<_HttpRequest.au3>
#include<Array.au3>
#include<IDM.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
;-------------SETTINGS-----------------------------------

;----------------------------------------------------------


#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Get Link Music SoundCloud", 359, 85, 192, 124)
$link = GUICtrlCreateInput("Copy link vao day", 48, 16, 297, 21)
$Label1 = GUICtrlCreateLabel("Link", 16, 16, 24, 17)
$download = GUICtrlCreateButton("Download", 128, 40, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
        Case $download
			$url = GUICtrlRead($link)
			if($url == '') then
				MsgBox(0,'Notifications',"Please type link")
			Else
				$url = GUICtrlRead($link)
$client_id = '18567101f44a1bf6dacafa35338c506a'
$resolve_url = "http://api.soundcloud.com/resolve?url="&$url&"&client_id="&$client_id;
$data = _HttpRequest(2,$resolve_url)
$title = StringRegExp($data,'"title":"(.*?)"',3)
$stream_url = StringRegExp($data,'"stream_url":"(.*?)"',3)
$url = $stream_url[0]&'?client_id='&$client_id
_IDM_SendLink($url, @ScriptDir, $title[0]&' download by KidDeepTry.mp3', 1)
EndIf
	EndSwitch
WEnd
#EndRegion