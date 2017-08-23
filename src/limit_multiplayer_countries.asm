@HOOK 0x00513363 _Skirmish_Dialog_DropList_Add_Amount
@HOOK 0x005070BF _Net_Join_Dialog_DropList_Add_Amount

_Net_Join_Dialog_DropList_Add_Amount:
    mov  [ebp-1Ch], cl
    cmp  cl, 3
    jmp  0x005070C5

_Skirmish_Dialog_DropList_Add_Amount:
    mov  [ebp-20h], ch
    cmp  ch, 3
    jmp  0x00513369
