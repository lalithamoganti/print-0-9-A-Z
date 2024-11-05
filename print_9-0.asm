
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


start:
    mov al, '9'         ; Start with ASCII value of '9'

print_digit:
    mov ah, 02h         ; DOS function to print a character
    mov dl, al          ; Move current character into DL (character to print)
    int 21h             ; Call DOS interrupt to print the character in DL

    dec al              ; Move to the previous digit (e.g., '9' to '8', '8' to '7', etc.)
    cmp al, '0'         ; Check if we have reached '0'
    jge print_digit     ; If AL >= '0', continue looping

    ; Print a newline
    mov ah, 02h         ; DOS function to print a character
    mov dl, 0Dh         ; Carriage return (to go to start of the line)
    int 21h             ; Call DOS interrupt
    mov dl, 0Ah         ; Line feed (to go to the next line)
    int 21h             ; Call DOS interrupt

    ; Exit program
    mov ah, 4Ch         ; DOS function to terminate the program
    int 21h             ; End program

ret




