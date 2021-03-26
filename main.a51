include c51ed2.inc

; P1 < 100
mov     a,#156
add     a,P1
jc      yello

; set green
mov     P2, #0
setb    P2.0
ljmp 0x0 ; go back to start

yello:
; P1 > 100
mov     a,P1
add     a,#156
jnc     red

; P1 < 150
mov     a,#106
add     a,P1
jc      red

; set yello
mov     P2, #0
setb    P2.1
ljmp 0x0 ; go back to start

red:
; P1 > 150
mov     a,P1
add     a,#156
jnc     0x0 ; go back to start

; set red, delay, and clear.
mov     P2, #0
setb    P2.2
lcall   	delay
clr      P2.2
ljmp	0x0 ; go back to start

delay:
mov R0, #0xff

outer:
mov R1, #0xff
inner:
djnz R1, inner
djnz R0, outer
ret

end

