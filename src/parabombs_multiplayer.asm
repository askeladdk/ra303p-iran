@HOOK 0x004D5B13 _Paraboms_Single_Player_Check

%define SessionClass__Session 0x0067F2B4

_Paraboms_Single_Player_Check:
%ifdef PARABOMBS_MULTIPLAYER_WORKAROUND
    jmp  0x004D5B1C
%else
    cmp  BYTE [parabombsinmultiplayer], 1
    jz   0x004D5B1C

    cmp  BYTE [SessionClass__Session], 0
    jmp  0x004D5B1A
%endif
