                                                                     ORG 100h              ; Origin for a COM file (starts at memory address 100h)

start:
    mov al, 'A'       ; ASCII value of 'A' (starting character)
    mov cx, 26        ; Set loop counter to 26 (for letters A to Z)

print_char:
    ; Print the current character
    mov ah, 02h       ; DOS interrupt function to print a character
    mov dl, al        ; Move current character to DL (the character to print)
    int 21h           ; Call DOS interrupt to print character in DL

    inc al            ; Move to the next character (e.g., 'A' to 'B', 'B' to 'C', etc.)
    loop print_char   ; Decrement CX and loop if CX is not zero

    ; Print a newline
    mov ah, 02h       ; DOS interrupt function to print a character
    mov dl, 0Dh       ; Carriage return (to go to start of line)
    int 21h           ; Call DOS interrupt
    mov dl, 0Ah       ; Line feed (to go to the next line)
    int 21h           ; Call DOS interrupt

    ; Exit program
    mov ah, 4Ch       ; DOS interrupt function to terminate program
    int 21h           ; End program
