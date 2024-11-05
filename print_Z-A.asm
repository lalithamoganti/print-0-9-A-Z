


ORG 100h              ; Origin for a COM file (starts at memory address 100h)

start:
    mov al, 'Z'       ; ASCII value of 'Z' (starting character)

print_char:
    ; Print the current character
    mov ah, 02h       ; DOS interrupt function to print a character
    mov dl, al        ; Move current character to DL (the character to print)
    int 21h           ; Call DOS interrupt to print character in DL

    dec al            ; Move to the previous character (e.g., 'Z' to 'Y', 'Y' to 'X', etc.)
    cmp al, 'A'       ; Check if we reached 'A'
    jge print_char    ; If AL >= 'A', continue loop

    ; Print a newline
    mov ah, 02h       ; DOS interrupt function to print a character
    mov dl, 0Dh       ; Carriage return (to go to start of line)
    int 21h           ; Call DOS interrupt
    mov dl, 0Ah       ; Line feed (to go to the next line)
    int 21h           ; Call DOS interrupt

    ; Exit program
    mov ah, 4Ch       ; DOS interrupt function to terminate program
    int 21h           ; End program


ret




