SendMode Input
f14::
	Clipboard = 
	SendInput, ^c 
	ClipWait
	StringReplace, OutputText, Clipboard, `r`n, `n, All 
	StringLower, OutputText, OutputText
	SendRaw % OutputText
        VarSetCapacity(OutputText, 0) 
Return
