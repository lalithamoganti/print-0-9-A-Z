
ORG 100h              ; Origin for a COM file (starts at memory address 100h)

start:
    mov cx, 10        ; Set loop counter to 10 (for numbers 0 to 9)
    mov al, '0'       ; ASCII value of '0' (starting character)

print_digit:
    ; Print the current digit
    mov ah, 02h       ; DOS interrupt function to print a character
    mov dl, al        ; Move current digit character to DL (the character to print)
    int 21h           ; Call DOS interrupt to print character in DL

    inc al            ; Move to the next character (e.g., '0' to '1', '1' to '2', etc.)
    loop print_digit  ; Decrement CX and loop if CX is not zero

    ; Print a newline
    mov ah, 02h       ; DOS interrupt function to print a character
    mov dl, 0Dh       ; Carriage return (to go to start of line)
    int 21h           ; Call DOS interrupt
    mov dl, 0Ah       ; Line feed (to go to the next line)
    int 21h           ; Call DOS interrupt

    ; Exit program
    mov ah, 4Ch       ; DOS interrupt function to terminate program
    int 21h           ; End program