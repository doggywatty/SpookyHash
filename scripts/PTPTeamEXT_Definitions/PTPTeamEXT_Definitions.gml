/*
	## This is just an assumptation, as such, this is not confirmed. ##
	
	Determines if the current window is using rounded corners (Win 11).
	
	Internally, this calls the native "_window_get_rounded()" from the extension, which retrieves
	the DWMWA_WINDOW_CORNER_PREFERENCE value via DwmGetWindowAttribute.
	
	--------------------------------------------------------------------------
	IDA Decompile and Diassembly:
	.text:0000000180002AA0                 public window_get_rounded
	.text:0000000180002AA0 window_get_rounded proc near            ; DATA XREF: .rdata:off_18000E098↓o
	.text:0000000180002AA0                                         ; .pdata:00000001800132E8↓o
	.text:0000000180002AA0
	.text:0000000180002AA0 pvAttribute     = dword ptr -18h
	.text:0000000180002AA0 var_10          = qword ptr -10h
	.text:0000000180002AA0
	.text:0000000180002AA0 ; __unwind { // __GSHandlerCheck
	.text:0000000180002AA0                 sub     rsp, 38h
	.text:0000000180002AA4                 mov     rax, cs:__security_cookie
	.text:0000000180002AAB                 xor     rax, rsp
	.text:0000000180002AAE                 mov     [rsp+38h+var_10], rax
	.text:0000000180002AB3                 mov     r9d, 4          ; cbAttribute
	.text:0000000180002AB9                 lea     r8, [rsp+38h+pvAttribute] ; pvAttribute
	.text:0000000180002ABE                 mov     edx, 21h ; '!'  ; dwAttribute
	.text:0000000180002AC3                 call    cs:DwmGetWindowAttribute
	.text:0000000180002AC9                 test    eax, eax
	.text:0000000180002ACB                 jnz     short loc_180002AE9
	.text:0000000180002ACD                 movd    xmm0, [rsp+38h+pvAttribute]
	.text:0000000180002AD3                 cvtdq2pd xmm0, xmm0
	.text:0000000180002AD7                 mov     rcx, [rsp+38h+var_10]
	.text:0000000180002ADC                 xor     rcx, rsp        ; StackCookie
	.text:0000000180002ADF                 call    __security_check_cookie
	.text:0000000180002AE4                 add     rsp, 38h
	.text:0000000180002AE8                 retn

	double __fastcall window_get_rounded(HWND a1)
	{
	  int pvAttribute; // [rsp+20h] [rbp-18h] BYREF

	  if ( DwmGetWindowAttribute(a1, 0x21u, &pvAttribute, 4u) )
	    return -1.0;
	  else
	    return (double)pvAttribute;
	}

	--------------------------------------------------------------------------

	https://learn.microsoft.com/en-us/windows/win32/api/dwmapi/ne-dwmapi-dwm_window_corner_preference
*/

enum DWM_WINDOW_CORNER_PREFERENCE
{
	DWMWCP_DEFAULT = 0,
	DWMWCP_DONOTROUND = 1,
	DWMWCP_ROUND = 2,
	DWMWCP_ROUNDSMALL = 3
}

function window_is_rounded()
{
	var _result = _window_get_rounded(window_handle());
	trace("window_is_rounded: ", _result, ", ", _result != -1 && _result != DWM_WINDOW_CORNER_PREFERENCE.DWMWCP_DONOTROUND);
	return _result != -1 && _result != DWM_WINDOW_CORNER_PREFERENCE.DWMWCP_DONOTROUND;
}
