; Group :BCSF20M018, BCSF21M002, BCSF21M007, BCSF21M009, BCSF21M029

;Project Description : The Resturant Managemnet System Following is the description :
;	Programme starts with asking user to select a menue for BreakFast, Lunch or Dinner!
;	Then it shows dishes availiable dishes with price on base of Menue Selected, asks to selects one
;	After User Selects a dish it asks for quantity of dishes
;	In the end it shows total Price 
;   The Prices calculated with depends of the Prices of the 
;	We Made tdifferent labels according to prces of Dishes
;	For example :If a user Buyes a dish of price LABLE1 it jumps to label LABLE1
;	Now, no matter what the quantity is the total price will be a multiple of LABLE1
;	Knowing this fact we multiplied the quantity by one 
;   Than used AAM to manage output upto 3 figures!
;	Every price is calculated using this technique
;	Than calculates Total Profit %age resturant earned and asks user to quit or go again at main menu
;	If user quits It also asks user to rate the resturant
;	if user buys more than 3 dishes it also give a loyality badge to get discount on next purchase!
;	Dicount property is added using a counter
;	Counter Counts the No of times user purchase by incrementing total count
;	In the end programme terminates displaying hefty thanks


.model large
.stack 1000h
.data
profit1 db ?
profit db 0dh,0ah,0dh,0ah,'The Profit Resturant erarns from that Costomeron for items is: $',0dh,0ah
thank db 0dh, 0ah, 0dh, 0ah, '--------Thank you for choosing us to satisfy your hunger!!!!!!!--------$'
totalPurchase db 0dh, 0ah, 0ah, '--------You have purchased items: $', 0ah, 0dh
Discount db 0dh, 0ah, 0dh, 0ah, 'Congratulations you got loyality Badges and will get the discount on next visit$'
menu1 db 0dh, 0ah, 0dh, 0ah, '                 ----welcome to our restaurants----$',0ah,0dh
choice db 0dh, 0ah, 0dh, 0ah, 'Enter your choise :$'
Dis = 3;
menu3 db 0dh, 0ah, '1.BREAKFAST Menue $'
menu4 db 0dh, 0ah, '2.LUNCH Menue$'
menu5 db 0dh, 0ah, '3.DINNER Menue$'
response db 0dh, 0ah, 0ah, '--------Thanks for yor response! Enjoy your day$', 0ah, 0dh
Rate db 0
EnterRating db 0dh, 0ah, 0dh, 0ah, '                 ----enter your Rating from (1-5)----$', 0ah, 0dh
choicemenu db 0dh, 0ah, 0dh, 0ah, '---Choose your food from the menu---$'
; breakfast
d1 db 0dh, 0ah, '1 allopratha              10/-                      $'; breakfast
d2 db 0dh, 0ah, '2.makhan                  10/-                      $'
d3 db 0dh, 0ah, '3.simpleparata            10/-                      $'
d4 db 0dh, 0ah, '4.omelete                 10/-                      $'
d5 db 0dh, 0ah, '5.chole batore            20/-                      $'
d6 db 0dh, 0ah, '6.halwa                   20/-                      $'
d7 db 0dh, 0ah, '7.bread butter            10/-                      $'
d8 db 0dh, 0ah, '8.fried egg               20/-                      $'
d9 db 0dh, 0ah, '9.bread jamm              60/-                      $'
;Lunch
lunch1 db 0dh, 0ah, '1.grilled chicken sanwich         90/-           $'
lunch2 db 0dh, 0ah, '2.roasted vegatables              90/-           $'
lunch3 db 0dh, 0ah, '3.sada chawal                     30/-           $'
lunch4 db 0dh, 0ah, '4.classic ceaser salad            90/-           $'
lunch5 db 0dh, 0ah, '5.biryani                         90/-           $'
lunch6 db 0dh, 0ah, '6.plain rice with raita           10/-           $'
lunch7 db 0dh, 0ah, '7.mixed rice                      30/-           $'
lunch8 db 0dh, 0ah, '8.thai peanut                     30/-           $'
lunch9 db 0dh, 0ah, '9 grilled vegatables              30/-           $'
; dinner
din1 db 0dh, 0ah, '1.lemon and herb  roasted chicken               80/-       $'
din2 db 0dh, 0ah, '2.chicken karahi                                80/-       $'
din3 db 0dh, 0ah, '3.baked salmon                                  80/-       $'
din4 db 0dh, 0ah, '4.baked sijii                                   40/-       $'
din5 db 0dh, 0ah, '5.grilled fish                                  50/-       $'
din6 db 0dh, 0ah, '6.sapagetti                                     70/-       $'
din7 db 0dh, 0ah, '7.dal chawal special                            60/-       $'
din8 db 0dh, 0ah, '8. fish deal with roti                          60/-       $'
din9 db 0dh, 0ah, '9.beef karahi                                   60/-       $'
; invalid
invalidentry db 0dh, 0ah, 0dh, 0ah, 'invalid entry$'
tryagain db 0dh, 0ah, 'Try again$'



order db 0dh, 0ah, 0dh, 0ah, 'Enter your order: $'
quatity db 0dh, 0ah, 'Quatity you want to buy: $'
totalprice db 0dh, 0ah, 'Total price of the Item: $'

quantity db ?
purchaseCount db 0

goback db 0dh, 0ah, 0dh, 0ah, '1.go back to main menu$'
terminate db 0dh, 0ah, '2.exit$'


sej db 0dh, 0ah, 0dh, 0ah, ' $'

.code

main proc
mov ax, @data
mov ds, ax

top :
inc purchaseCount

lea dx, menu1; line feed(0dh), carriage return(0ah) and message wellcome at our resturant!
mov ah, 9
int 21h

lea dx, sej; line feed(0dh), carriage return(0ah)
mov ah, 9
int 21h


lea dx, menu3; displaying menue items(breakfast)
mov ah, 9
int 21h

lea dx, menu4; lunch
mov ah, 9
int 21h

lea dx, menu5; dinner
mov ah, 9
int 21h


lea dx, choice;// 
mov ah, 9
int 21h



mov ah, 1; takes input
int 21h

mov bh, al; moves it into bh
sub bh, 48; to convert the ascii code of  digit character to corresponding decimal value in bh.

cmp bh, 1; if pannel like in c++

je breatfast

cmp bh, 2
je ld; 

cmp bh, 3

je dinner;


jmp invalid

breatfast :

lea dx, choicemenu; breakfast starts
mov ah, 9
int 21h

lea dx, sej; newline formatting
mov ah, 9
int 21h


lea dx, d1; item 1
mov ah, 9
int 21h


lea dx, d2; item 2
mov ah, 9
int 21h

lea dx, d3
mov ah, 9; 3nd
int 21h

lea dx, d4
mov ah, 9; 4rd
int 21h


lea dx, d5; 5th
mov ah, 9
int 21h


lea dx, d6; 6th
mov ah, 9
int 21h


lea dx, d7
mov ah, 9; 7th
int 21h


lea dx, d8; 8th
mov ah, 9
int 21h

lea dx, d9; 9th
mov ah, 9
int 21h


lea dx, order; enter your order
mov ah, 9
int 21h


mov ah, 1; input again conveerted to decimal
int 21h
mov bl, al
sub bl, 48

cmp bl, 1; if condition for each dish choice of break fast
je LABLE1

cmp bl, 2;//
je LABLE1;        you have chosed food for yuor breakfast of price LABLE1

cmp bl, 3;//
je LABLE1

cmp bl, 4;//
je LABLE1

cmp bl, 5; dish number 5, 6 price LABLE2 at line 901
je LABLE2

cmp bl, 6;//
je LABLE2

cmp bl, 7
je LABLE1

cmp bl, 8
je LABLE2

cmp bl, 9; dish 9, with price LABLE6
je LABLE6



jmp invalid; for invalid input at line 2225

LABLE4:; ---------- - Logic for calculating price if enters 40 rupees item and other at price-------------- -

mov bl, 4; move the value 4 into the BL register

lea dx, quatity; load the address of the "quatity" variable into the DX register

mov ah, 9; set the AH register to 9, show that we want to print a string

int 21h;  will print the string at the address in DX

mov ah, 1; set the AH register to 1, indicating that we want to read a character from the keyboard

int 21h; will wait for the user to enter a character and then store it in the AL register


sub al, 48; subtract 48 from the AL register, converting the input character from ASCII to its numeric value


mul bl; multiply the BL register by the AL register, storing the result in the AX register

aam; divide the AX register by 10, storing the quotient in the AH register and the remainder in the AL register

mov cx, ax; move the value in the AX register (the remainder from the previous step) into the CX register

add ch, 48; add 48  to the CH register, converting the quotient back to ASCII

add cl, 48; add 48  to the CL register, converting the remainder back to ASCII

lea dx, totalprice; load the address of the "totalprice" variable into the DX register

mov ah, 9; set the AH register to 9, indicating that we want to print a string

int 21h;  print the string at the address in DX

mov ah, 2; set the AH register to 2, indicating that we want to print a character

mov dl, ch; move the value in the CH register (the quotient as an ASCII character) into the DL register

int 21h; call interrupt 21h, which will print the character in the DL register

mov dl, cl; move the value in the CL register (the remainder as an ASCII character) into the DL register

int 21h; call interrupt 21h, which will print the character in the DL register




; profit
lea dx, profit
mov ah, 9
int 21h
mov ah,2
mov dl, bl
add dl,30h
int 21h
mov ah,2
mov dl, '%'
int 21h

; go back

lea dx, goback
mov ah, 9
int 21h

lea dx, terminate
mov ah, 9
int 21h

lea dx, choice
mov ah, 9
int 21h; main menu

mov ah, 1
int 21h
sub al, 48

cmp al, 1
je top

jmp exit


fifty :
mov bl, 5; move 5 into bl register

lea dx, quatity; load the address of the "quatity" variable into the DX register

mov ah, 9; set the AH register to 9, show that we want to print a string
int 21h; inturrupt


mov ah, 1; set the AH register to 1, indicating that we want to read a character from the keyboard

int 21h; will wait for the user to enter a character and then store it in the AL register


sub al, 48; subtract 48 from the AL register, converting the input character from ASCII to its numeric value


mul bl; multiply the BL register by the AL register, storing the result in the AX register

aam; divide the AX register by 10, storing the quotient in the AH register and the remainder in the AL register

mov cx, ax; move the value in the AX register (the remainder from the previous step) into the CX register

add ch, 48; add 48  to the CH register, converting the quotient back to ASCII

add cl, 48; add 48  to the CL register, converting the remainder back to ASCII

lea dx, totalprice; load the address of the "totalprice" variable into the DX register

mov ah, 9; set the AH register to 9, indicating that we want to print a string

int 21h;  print the string at the address in DX



mov ah, 2; set the AH register to 2, indicating that we want to print a character

mov dl, ch; move the value in the CH register (the quotient as an ASCII character) into the DL register

int 21h; call interrupt 21h, which will print the character in the DL register

mov dl, cl; move the value in the CL register (the remainder as an ASCII character) into the DL register

int 21h; call interrupt 21h, which will print the character in the DL register



mov dl, '0'; the last digit of calculating price
int 21h; call interrupt 21h, which will print the character in the DL register



; profit
lea dx, profit
mov ah, 9
int 21h
mov ah,2
mov dl, bl
add dl,30h
int 21h
mov ah,2
mov dl, '%'
int 21h

; go back

lea dx, goback
mov ah, 9
int 21h

lea dx, terminate
mov ah, 9
int 21h

lea dx, choice
mov ah, 9
int 21h

mov ah, 1
int 21h
sub al, 48; main  menu



cmp al, 1
je top

jmp exit

LABLE7 :

mov bl, 7; move 7 into bl register

lea dx, quatity; load the address of the "quatity" variable into the DX register

mov ah, 9; set the AH register to 9, show that we want to print a string
int 21h; inturrupt


mov ah, 1; set the AH register to 1, indicating that we want to read a character from the keyboard

int 21h; will wait for the user to enter a character and then store it in the AL register


sub al, 48; subtract 48 from the AL register, converting the input character from ASCII to its numeric value


mul bl; multiply the BL register by the AL register, storing the result in the AX register

aam; divide the AX register by 10, storing the quotient in the AH register and the remainder in the AL register

mov cx, ax; move the value in the AX register (the remainder from the previous step) into the CX register

add ch, 48; add 48  to the CH register, converting the quotient back to ASCII

add cl, 48; add 48  to the CL register, converting the remainder back to ASCII

lea dx, totalprice; load the address of the "totalprice" variable into the DX register

mov ah, 9; set the AH register to 9, indicating that we want to print a string

int 21h;  print the string at the address in DX



mov ah, 2; set the AH register to 2, indicating that we want to print a character

mov dl, ch; move the value in the CH register (the quotient as an ASCII character) into the DL register

int 21h; call interrupt 21h, which will print the character in the DL register

mov dl, cl; move the value in the CL register (the remainder as an ASCII character) into the DL register

int 21h; call interrupt 21h, which will print the character in the DL register



mov dl, '0'; the last digit of calculating price
int 21h; call interrupt 21h, which will print the character in the DL register



; profit
lea dx, profit
mov ah, 9
int 21h
mov ah,2
mov dl, bl
add dl,30h
int 21h
mov ah,2
mov dl, '%'
int 21h


; go back

lea dx, goback
mov ah, 9
int 21h

lea dx, terminate
mov ah, 9
int 21h

lea dx, choice
mov ah, 9
int 21h; main menu

mov ah, 1
int 21h
sub al, 48



cmp al, 1
je top

jmp exit


LABLE8 :
mov bl, 8; move 8 into bl register

lea dx, quatity; load the address of the "quatity" variable into the DX register

mov ah, 9; set the AH register to 9, show that we want to print a string
int 21h; inturrupt


mov ah, 1; set the AH register to 1, indicating that we want to read a character from the keyboard

int 21h; will wait for the user to enter a character and then store it in the AL register


sub al, 48; subtract 48 from the AL register, converting the input character from ASCII to its numeric value


mul bl; multiply the BL register by the AL register, storing the result in the AX register

aam; divide the AX register by 10, storing the quotient in the AH register and the remainder in the AL register

mov cx, ax; move the value in the AX register (the remainder from the previous step) into the CX register

add ch, 48; add 48  to the CH register, converting the quotient back to ASCII

add cl, 48; add 48  to the CL register, converting the remainder back to ASCII

lea dx, totalprice; load the address of the "totalprice" variable into the DX register

mov ah, 9; set the AH register to 9, indicating that we want to print a string

int 21h;  print the string at the address in DX



mov ah, 2; set the AH register to 2, indicating that we want to print a character

mov dl, ch; move the value in the CH register (the quotient as an ASCII character) into the DL register

int 21h; call interrupt 21h, which will print the character in the DL register

mov dl, cl; move the value in the CL register (the remainder as an ASCII character) into the DL register

int 21h; call interrupt 21h, which will print the character in the DL register



mov dl, '0'; the last digit of calculating price
int 21h; call interrupt 21h, which will print the character in the DL register


; profit
lea dx, profit
mov ah, 9
int 21h
mov dl, bl
add dl,30h
mov ah,2
int 21h
mov ah,2
mov dl, '%'
int 21h


; go back

lea dx, goback
mov ah, 9
int 21h

lea dx, terminate
mov ah, 9
int 21h

lea dx, choice; main menu
mov ah, 9
int 21h

mov ah, 1
int 21h
sub al, 48


cmp al, 1
je top

jmp exit


ld :
; lunch
lea dx, choicemenu; asks for food choice
mov ah, 9
int 21h

lea dx, sej; newline
mov ah, 9
int 21h

lea dx, lunch1; 1th dish
mov ah, 9
int 21h

lea dx, lunch2; 2th
mov ah, 9
int 21h

lea dx, lunch3; 3rd
mov ah, 9
int 21h

lea dx, lunch4; 4th
mov ah, 9
int 21h

lea dx, lunch5; 5th
mov ah, 9
int 21h


lea dx, lunch6; 6th
mov ah, 9
int 21h

lea dx, lunch7; 7th
mov ah, 9
int 21h

lea dx, lunch8; 8th
mov ah, 9
int 21h

lea dx, lunch9; 9th
mov ah, 9
int 21h

lea dx, order
mov ah, 9
int 21h


mov ah, 1; input taken
int 21h
mov bl, al
sub bl, 48

cmp bl, 1; first lunch dish with price ninty
je LABLE9

cmp bl, 2
je LABLE9

cmp bl, 3
je LABLE3

cmp bl, 4
je LABLE9

cmp bl, 5
je LABLE9;

cmp bl, 6
je LABLE1

cmp bl, 7
je LABLE3

cmp bl, 8
je LABLE3

cmp bl, 9
je LABLE3

jmp invalid

LABLE1 : ; comes to this label if first four dishes of breakfast are chosen
; "LABLE1" name is given as all these items have price 10
mov bl, 1; move 1 into bl register

lea dx, quatity; load the address of the "quatity" variable into the DX register

mov ah, 9; set the AH register to 9, show that we want to print a string
int 21h; inturrupt


mov ah, 1; set the AH register to 1, indicating that we want to read a character from the keyboard

int 21h; will wait for the user to enter a character and then store it in the AL register


sub al, 48; subtract 48 from the AL register, converting the input character from ASCII to its numeric value


mul bl; multiply the BL register by the AL register, storing the result in the AX register

aam; divide the AX register by 10, storing the quotient in the AH register and the remainder in the AL register

mov cx, ax; move the value in the AX register (the remainder from the previous step) into the CX register

add ch, 48; add 48  to the CH register, converting the quotient back to ASCII

add cl, 48; add 48  to the CL register, converting the remainder back to ASCII

lea dx, totalprice; load the address of the "totalprice" variable into the DX register

mov ah, 9; set the AH register to 9, indicating that we want to print a string

int 21h;  print the string at the address in DX



mov ah, 2; set the AH register to 2, indicating that we want to print a character

mov dl, ch; move the value in the CH register (the quotient as an ASCII character) into the DL register

int 21h; call interrupt 21h, which will print the character in the DL register

mov dl, cl; move the value in the CL register (the remainder as an ASCII character) into the DL register

int 21h; call interrupt 21h, which will print the character in the DL register



mov dl, '0'; the last digit of calculating price
int 21h; call interrupt 21h, which will print the character in the DL register


; actually first it multiplies quatity with 1 and than displays zero at end as all
; items handeled here have price 10


; profit
lea dx, profit
mov ah, 9
int 21h
mov ah,2
mov dl, bl
add dl,30h
int 21h
mov ah,2
mov dl, '%'
int 21h
; go back

lea dx, goback; displays go back to main menu
mov ah, 9
int 21h

lea dx, terminate; displays exit
mov ah, 9
int 21h

lea dx, choice; asks for choice
mov ah, 9
int 21h

mov ah, 1; input taken
int 21h
sub al, 48



cmp al, 1; if 1 than once again at top asking for input breakfast, lunch or dinner
je top

jmp exit




LABLE2:

mov bl, 2; move 2 into bl register

lea dx, quatity; load the address of the "quatity" variable into the DX register

mov ah, 9; set the AH register to 9, show that we want to print a string
int 21h; inturrupt


mov ah, 1; set the AH register to 1, indicating that we want to read a character from the keyboard

int 21h; will wait for the user to enter a character and then store it in the AL register


sub al, 48; subtract 48 from the AL register, converting the input character from ASCII to its numeric value


mul bl; multiply the BL register by the AL register, storing the result in the AX register

aam; divide the AX register by 10, storing the quotient in the AH register and the remainder in the AL register

mov cx, ax; move the value in the AX register (the remainder from the previous step) into the CX register

add ch, 48; add 48  to the CH register, converting the quotient back to ASCII

add cl, 48; add 48  to the CL register, converting the remainder back to ASCII

lea dx, totalprice; load the address of the "totalprice" variable into the DX register

mov ah, 9; set the AH register to 9, indicating that we want to print a string

int 21h;  print the string at the address in DX



mov ah, 2; set the AH register to 2, indicating that we want to print a character

mov dl, ch; move the value in the CH register (the quotient as an ASCII character) into the DL register

int 21h; call interrupt 21h, which will print the character in the DL register

mov dl, cl; move the value in the CL register (the remainder as an ASCII character) into the DL register

int 21h; call interrupt 21h, which will print the character in the DL register



mov dl, '0'; the last digit of calculating price
int 21h; call interrupt 21h, which will print the character in the DL register


; profit
lea dx, profit
mov ah, 9
int 21h
mov ah,2
mov dl, bl
add dl,30h
int 21h
mov ah,2
mov dl, '%'
int 21h
; go back
lea dx, goback
mov ah, 9
int 21h

lea dx, terminate
mov ah, 9
int 21h

lea dx, choice
mov ah, 9
int 21h

mov ah, 1
int 21h
sub al, 48



cmp al, 1
je top

jmp exit

LABLE3 :

mov bl, 3; move 3 into bl register

lea dx, quatity; load the address of the "quatity" variable into the DX register

mov ah, 9; set the AH register to 9, show that we want to print a string
int 21h; inturrupt


mov ah, 1; set the AH register to 1, indicating that we want to read a character from the keyboard

int 21h; will wait for the user to enter a character and then store it in the AL register


sub al, 48; subtract 48 from the AL register, converting the input character from ASCII to its numeric value


mul bl; multiply the BL register by the AL register, storing the result in the AX register

aam; divide the AX register by 10, storing the quotient in the AH register and the remainder in the AL register

mov cx, ax; move the value in the AX register (the remainder from the previous step) into the CX register

add ch, 48; add 48  to the CH register, converting the quotient back to ASCII

add cl, 48; add 48  to the CL register, converting the remainder back to ASCII

lea dx, totalprice; load the address of the "totalprice" variable into the DX register

mov ah, 9; set the AH register to 9, indicating that we want to print a string

int 21h;  print the string at the address in DX



mov ah, 2; set the AH register to 2, indicating that we want to print a character

mov dl, ch; move the value in the CH register (the quotient as an ASCII character) into the DL register

int 21h; call interrupt 21h, which will print the character in the DL register

mov dl, cl; move the value in the CL register (the remainder as an ASCII character) into the DL register

int 21h; call interrupt 21h, which will print the character in the DL register



mov dl, '0'; the last digit of calculating price
int 21h; call interrupt 21h, which will print the character in the DL register


; profit
lea dx, profit
mov ah, 9
int 21h
mov ah,2
mov dl, bl
add dl,30h
int 21h
mov ah,2
mov dl, '%'
int 21h
; go back

lea dx, goback
mov ah, 9
int 21h

lea dx, terminate
mov ah, 9
int 21h

lea dx, choice
mov ah, 9
int 21h

mov ah, 1
int 21h
sub al, 48



cmp al, 1
je top

jmp exit


LABLE6 :

mov bl, 6; move 6 into bl register

lea dx, quatity; load the address of the "quatity" variable into the DX register

mov ah, 9; set the AH register to 9, show that we want to print a string
int 21h; inturrupt


mov ah, 1; set the AH register to 1, indicating that we want to read a character from the keyboard

int 21h; will wait for the user to enter a character and then store it in the AL register


sub al, 48; subtract 48 from the AL register, converting the input character from ASCII to its numeric value


mul bl; multiply the BL register by the AL register, storing the result in the AX register

aam; divide the AX register by 10, storing the quotient in the AH register and the remainder in the AL register

mov cx, ax; move the value in the AX register (the remainder from the previous step) into the CX register

add ch, 48; add 48  to the CH register, converting the quotient back to ASCII

add cl, 48; add 48  to the CL register, converting the remainder back to ASCII

lea dx, totalprice; load the address of the "totalprice" variable into the DX register

mov ah, 9; set the AH register to 9, indicating that we want to print a string

int 21h;  print the string at the address in DX



mov ah, 2; set the AH register to 2, indicating that we want to print a character

mov dl, ch; move the value in the CH register (the quotient as an ASCII character) into the DL register

int 21h; call interrupt 21h, which will print the character in the DL register

mov dl, cl; move the value in the CL register (the remainder as an ASCII character) into the DL register

int 21h; call interrupt 21h, which will print the character in the DL register



mov dl, '0'; the last digit of calculating price
int 21h; call interrupt 21h, which will print the character in the DL register


; profit
lea dx, profit
mov ah, 9
int 21h
mov ah,2
mov dl, bl
add dl,30h
int 21h
mov ah,2
mov dl, '%'
int 21h
; go back

lea dx, goback
mov ah, 9
int 21h

lea dx, terminate
mov ah, 9
int 21h; main menu

lea dx, choice
mov ah, 9
int 21h

mov ah, 1
int 21h
sub al, 48



cmp al, 1
je top

jmp exit


LABLE9 :
mov bl, 9; move 9 into bl register

lea dx, quatity; load the address of the "quatity" variable into the DX register

mov ah, 9; set the AH register to 9, show that we want to print a string
int 21h; inturrupt


mov ah, 1; set the AH register to 1, indicating that we want to read a character from the keyboard

int 21h; will wait for the user to enter a character and then store it in the AL register


sub al, 48; subtract 48 from the AL register, converting the input character from ASCII to its numeric value


mul bl; multiply the BL register by the AL register, storing the result in the AX register

aam; divide the AX register by 10, storing the quotient in the AH register and the remainder in the AL register

mov cx, ax; move the value in the AX register (the remainder from the previous step) into the CX register

add ch, 48; add 48  to the CH register, converting the quotient back to ASCII

add cl, 48; add 48  to the CL register, converting the remainder back to ASCII

lea dx, totalprice; load the address of the "totalprice" variable into the DX register

mov ah, 9; set the AH register to 9, indicating that we want to print a string

int 21h;  print the string at the address in DX



mov ah, 2; set the AH register to 2, indicating that we want to print a character

mov dl, ch; move the value in the CH register (the quotient as an ASCII character) into the DL register

int 21h; call interrupt 21h, which will print the character in the DL register

mov dl, cl; move the value in the CL register (the remainder as an ASCII character) into the DL register

int 21h; call interrupt 21h, which will print the character in the DL register



mov dl, '0'; the last digit of calculating price
int 21h; call interrupt 21h, which will print the character in the DL register



; profit
lea dx, profit
mov ah, 9
int 21h
mov ah,2
mov dl, bl
add dl,30h
int 21h
mov ah,2
mov dl, '%'
int 21h
; go back

lea dx, goback
mov ah, 9
int 21h

lea dx, terminate
mov ah, 9
int 21h

lea dx, choice
mov ah, 9
int 21h

mov ah, 1
int 21h
sub al, 48



cmp al, 1
je top

jmp exit





jmp exit








dinner:

lea dx, choicemenu
mov ah, 9; dinner starts
int 21h

lea dx, sej; newline
mov ah, 9
int 21h


lea dx, din1; 1th dish of dinner
mov ah, 9
int 21h

lea dx, din2
mov ah, 9; 2th
int 21h


lea dx, din3; 3th
mov ah, 9
int 21h

lea dx, din4
mov ah, 9; 4th
int 21h


lea dx, din5; 5th
mov ah, 9
int 21h


lea dx, din6; 6th
mov ah, 9
int 21h


lea dx, din7; 0dhth
mov ah, 9
int 21h


lea dx, din8; 11th
mov ah, 9
int 21h

lea dx, din9; 12th
mov ah, 9
int 21h

lea dx, order
mov ah, 9
int 21h


mov ah, 1; takes choice off dinner dish
int 21h
mov bl, al
sub bl, 48

cmp bl, 1
je LABLE6

cmp bl, 2
je LABLE8

cmp bl, 3
je LABLE8

cmp bl, 4
je LABLE4

cmp bl, 5
je fifty

cmp bl, 6
je LABLE7

cmp bl, 7
je LABLE6

cmp bl, 8
je LABLE6

cmp bl, 9
je LABLE6


invalid :
lea dx, invalidentry; invalid entry
mov ah, 9
int 21h


lea dx, tryagain; try again
mov ah, 9
int 21h

jmp exit

exit :

lea dx, totalPurchase
mov ah, 9
int 21h

mov ah, 2
mov dl, purchaseCount
add dl, 30h
int 21h

cmp purchaseCount,dis
jae DISC  ;for discount
jmp rating

DISC:
lea dx,discount
mov ah,9
int 21h

Rating:
lea dx,EnterRating
mov ah,9
int 21h

mov ah,1
int 21h

mov Rate,al

lea dx,response
mov ah,9
int 21h

lea dx, thank
mov ah, 9
int 21h


mov ah, 4ch
int 21h
main endp
end main