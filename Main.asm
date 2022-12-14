format PE GUI 4.0
entry WinMain
include 'win32w.inc'

proc WinMain
    xor     ebx, ebx
    invoke  RegisterClassExW, DemoWindow.wcexClass
    invoke  ShowCursor, ebx
    invoke  CreateWindowExW, ebx, DemoWindow.szClassName, ebx,\
                             WS_POPUP or WS_VISIBLE or WS_MAXIMIZE,\
                             ebx, ebx, ebx, ebx, ebx, ebx, ebx, ebx
    mov     [hwndDesc], eax
    lea     edx, [rcClient]
    invoke  GetClientRect, eax, edx

invoke     GetTickCount
xchg       esi, eax
    ;;;;;;;;;;;;;;;;;;;;;;;;
    stdcall    InitDevice
    stdcall    InitRandomData
    stdcall    InitVBuffer
    stdcall    InitIBuffer
    ;;;;;;;;;;;;;;;;;;;;;;;;
    lea     edi, [Msg]
.MsgLoop:
    invoke  PeekMessage, edi, ebx, ebx, ebx, PM_REMOVE
    test    eax, eax
    jz      .MsgLoop
    invoke  TranslateMessage, edi
    invoke  DispatchMessage, edi
    jmp     .MsgLoop
.EndMsgLoop:
endp


proc DemoWindow.WindowProc uses ebx esi edi,\
                           hWnd, uMsg, wParam, lParam
    xor     ebx, ebx
    mov     eax, [uMsg]

    cmp     eax, WM_CREATE
    je      .Create
    cmp     eax, WM_PAINT
    je      .Paint
    cmp     eax, WM_KEYDOWN
    je      .KeyDown
    cmp     eax, WM_DESTROY
    je      .Destroy

    invoke  DefWindowProc, [hWnd], [uMsg], [wParam], [lParam]
    jmp     .Return

.Create:
   ; stdcall    InitDevice
   ; stdcall    InitRandomData
   ; stdcall    InitVBuffer
   ; stdcall    InitIBuffer
    jmp     .ReturnZero
.Paint:
    call    Paint
    invoke  InvalidateRect, [hWnd], ebx, ebx
    jmp     .ReturnZero
.KeyDown:
    cmp     [wParam], VK_LEFT
    je      .Left
    cmp     [wParam], VK_UP
    je      .Up
    cmp     [wParam], VK_RIGHT
    je      .Right
    cmp     [wParam], VK_DOWN
    je      .Down
    cmp     [wParam], VK_ESCAPE
    je      .Destroy
    jne     .ReturnZero

.Left:
 ;   finit
 ;   fld     [freq]
 ;   fsub    [NoiseDelta]
 ;   fst     [freq]
    jmp     .ReturnZero
.Up:
 ;   add     [depth], 1
    jmp     .ReturnZero
.Right:
 ;   finit
 ;   fld     [freq]
 ;   fadd    [NoiseDelta]
 ;   fst     [freq]
    jmp     .ReturnZero
.Down:
 ;   sub     [depth], 1
    jmp     .ReturnZero

.Destroy:
    comcall [pD3D], IDirect3D9, Release
    comcall [pD3DDevice], IDirect3DDevice9, Release
    comcall [pVBuffer], IDirect3DVertexBuffer9, Release
    comcall [pIBuffer], IDirect3DIndexBuffer9, Release
    invoke  ExitProcess, ebx
.ReturnZero:
        xor     eax, eax
.Return:
        ret
endp

rcClient        RECT    ?
hwndDesc        dd      ?
Msg             MSG

include '%myinclude%\code\initdevice.c'
include '%myinclude%\code\initbuffer.c'
include '%myinclude%\code\paint.c'

include          '%myinclude%\data\initdevice.d'
include          '%myinclude%\data\initbuffer.d'
include          '%myinclude%\data\perlinnoise.d'
include          '%myinclude%\code\perlinnoise.c'
include          '%myinclude%\random\random.d'
include          '%myinclude%\random\random.c'
data import
        library kernel32, 'kernel32.dll',\
                gdi32,    'gdi32.dll',\
                user32,   'user32.dll',\
                d3d9,     'd3d9.dll',\
                d3dx9,    'd3dx9_25.dll'

        include 'api\kernel32.inc'
        include 'api\gdi32.inc'
        include 'api\user32.inc'
        include '%myinclude%\API\d3d9.inc'
        
        include '%myinclude%\EQUATES\d3d9.inc'

end data

ImageBase = $ - rva $
nil       = 0

DemoWindow.szClassName    du              'Demo', 0
DemoWindow.wcexClass      WNDCLASSEX      sizeof.WNDCLASSEX, CS_GLOBALCLASS,\
                                                  DemoWindow.WindowProc, 0, 0, ImageBase,\
                                                  0, 0, 0, nil, DemoWindow.szClassName, 0

d3dppDemo       D3DPRESENT_PARAMETERS     0, 0, D3DFMT_UNKNOWN, 0, D3DMULTISAMPLE_NONE,\
                                          0, D3DSWAPEFFECT_DISCARD, 0, TRUE, FALSE,\
                                          D3DFMT_UNKNOWN, 0, 0, 0

struct D3DMATRIX
       _11      dd      ?
       _12      dd      ?
       _13      dd      ?
       _14      dd      ?
       _21      dd      ?
       _22      dd      ?
       _23      dd      ?
       _24      dd      ?
       _31      dd      ?
       _32      dd      ?
       _33      dd      ?
       _34      dd      ?
       _41      dd      ?
       _42      dd      ?
       _43      dd      ?
       _44      dd      ?
ends

struct TVertex
       x        dd      ?
       y        dd      ?
       z        dd      ?
       color    dd      ?
ends

struct D3DVECTOR
       x        dd      ?
       y        dd      ?
       z        dd      ?
ends

vecEye          D3DVECTOR               0.0, 500.0, 0.0
vecAt           D3DVECTOR               500.0, 0.0, 500.0
vecUp           D3DVECTOR               0.0, 1.0, 0.0

matWorld        D3DMATRIX
matView         D3DMATRIX
matProj         D3DMATRIX

TVertex.FVF = D3DFVF_XYZ or D3DFVF_DIFFUSE


Divisor         dd      1000
tmNow           dd      ?
fAngle          dd      ?


XTriangles      dd      ?
YTriangles      dd      ?

Xvertexes       dd      ?
YVertexes       dd      ?

XVertexCount      = 100
ZVertexCount      = 100
VertexCount       = XVertexCount * ZVertexCount

TriangleCount  = (XVertexCount - 1) * (ZVertexCount - 1) * 2
