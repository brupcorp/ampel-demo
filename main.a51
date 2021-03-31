include c51ed2.inc

; cache input
mov R4, P1

; P1 < 100
mov     a,#156
add     a,R4
jc      yellow ; skip if false

; set green
mov     P2, #0
setb    P2.0
ljmp 0x0 ; go back to start

yellow:
; P1 > 100
mov     a,R4
add     a,#156
jnc     red  ; skip if false

; P1 < 150
mov     a,#106
add     a,R4
jc      red  ; skip if false

; set yello
mov     P2, #0
setb    P2.1
ljmp 0x0 ; go back to start

red:
; P1 > 150
mov     a,R4
add     a,#156
jnc     0x0 ; go back to start if false

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

