#NoEnv
#SingleInstance


F1::
{
DetectHiddenWindows, On
IfWinExist, Tilda
{
	DetectHiddenWindows, Off
	IfWinActive
		WinHide
	else
	{
		WinShow
		WinActivate
	}	
}
else
{
	Run, C:\Program Files (x86)\Console2\console.exe -w Tilda
	WinWaitActive, Tilda,,2
	WinMaximize
}
return
}
