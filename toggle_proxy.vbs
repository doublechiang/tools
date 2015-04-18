Option Explicit 
Dim WSHShell, strSetting
Set WSHShell = WScript.CreateObject("WScript.Shell")

'Determine current proxy setting and toggle to oppisite setting
strSetting = wshshell.regread("HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ProxyEnable")
If strSetting = 1 Then 
NoProxy
Else Proxy
End If

'Subroutine to Toggle Proxy Setting to ON
Sub Proxy 
WSHShell.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ProxyEnable", 1, "REG_DWORD"
End Sub

'Subroutine to Toggle Proxy Setting to OFF
Sub NoProxy 
WSHShell.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ProxyEnable", 0, "REG_DWORD"
End Sub