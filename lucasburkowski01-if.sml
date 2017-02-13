(* Lucas Burkowski
   E01251405
   COSC 341 Project 1
   2-12-2017 *)

(* FUNCTION NAME: delnthc *)
(* DESCRIPTION: deletes the nth character of a string *)
fun delnthc(a:string , b:int)=
     if b <=0 then a
     else if b = 1 then implode(tl(explode(a))) 
     else str(hd(explode(a))) ^ delnthc(implode(tl(explode(a))), b - 1);
 
(* FUNCTION NAME: dispnthc *)
(* DESCRIPTION: displays the nth character of a string *)
fun dispnthc(a:string , b:int)=
     if b <= 0 then a
     else if b = 1 then hd(explode(a)) 
     else dispnthc(implode(tl(explode(a))), b - 1);

(* FUNCTION NAME: multin *)
(* DESCRIPTION: multiply first element of list by second and third*)
fun multinhelp(a, b, c, d)=
     if d = 0 then a :: multinhelp(a, b, c, d + 1)
     else if d = c then [a * b]
     else (a * b) :: multinhelp(a * b, b, c, d + 1);

fun multin([a, b, c])=
     if c = 0 then [a]
     else multinhelp(a, b, c, 0);

(* FUNCTION NAME: remv *)
(* DESCRIPTION: removes any instance of a character from a list *)
fun remv(n, L)=
     if null L then nil
     else if null(tl L) andalso hd L = n then nil 
     else if null(tl L) andalso hd L <> n then L 
     else if hd L = n then remv(n, tl L) 
     else hd L :: remv(n, tl L);

(* FUNCTION NAME: remvdub *)
(* DESCRIPTION: removes any instance of a character from a list that appears twice *)
fun remvdub(L)=
     if null L then nil
     else if null (tl L) then L
     else hd L :: remvdub(remv(hd L, tl L));

(* FUNCTION NAME: int2str *)
(* DESCRIPTION: turns an int into a string*)
fun int2str(n)=
     if n div 10 = 0 then str(chr((n mod 10) + 48))
     else int2str(n div 10) ^ str(chr((n mod 10) + 48));

(* FUNCTION NAME: str2int *)
(* DESCRIPTION: turns a string into an int*)
fun str2inthelp(n, L)=
     if null L then 0
     else if null(tl(L)) then (n * 10) + (ord(hd L) - 48)
     else str2inthelp((n * 10) + (ord(hd L) - 48), tl L);

fun str2int(L)=
     if null(tl(explode(L))) then (ord(hd(explode(L)) - 48)
     else str2inthelp((ord(hd(explode(n))) - 48), tl(explode(L));

(* FUNCTION NAME: inde *)
(* DESCRIPTION: returns the position(s) of a given int in a list*)
fun indehelp(a, b, c)= 
     if null(b) then nil 
     else if a = hd b 
     then c :: indehelp(a, tl b, c + 1)
     else indehelp(a, tl b, c + 1);
        
fun inde(n, L)= 
     if null L then nil 
     else indehelp(n, L, 1);

(* FUNCTION NAME: nele *)
(* DESCRIPTION: repeats each element in the list n number of times*)
fun nelehelp(L, n, a)= 
     if null L then nil else 
     if n = 0 then nelehelp(tl L, a, a) 
     else hd L :: nelehelp(L, n - 1, a);

fun nele(L, n)= 
     if null L orelse n = 0 then nil 
     else if n = 1 then L 
     else nelehelp(L, n, n);

(* FUNCTION NAME: spliat *)
(* DESCRIPTION: splits a string at the given int of chars*)
fun spliat(str, n)= 
     if n = 0 then [str]
     else if n = 1 then implode([hd(explode(str))]) :: [implode(tl(explode(str)))]
     else implode((hd(explode(str)) :: explode(hd(spliat(implode(tl(explode(str))), n - 1))))) :: tl(spliat(implode(tl(explode(str))), n - 1));

(* FUNCTION NAME: ntrin *)
(* DESCRIPTION: creates a list of triangular numbers up to n*)
fun ntrinhelp(n, L, a)=
     if n = 0 then [0]
     else if a > n then L
     else ((a * (a + 1)) div 2) :: ntrinhelp(n, L, a + 1);

fun ntrin(n)=
     ntrinhelp(n, nil, 0);

(* FUNCTION NAME: isfact *)
(* DESCRIPTION: determines if an positive int is a factorial number*)
fun isfacthelp(n, a) = 
     if n = 1 then true 
     else if n mod a = 0 then isfacthelp(n div a, a + 1) 
     else false;
        
fun isfact(n) = 
     isfacthelp(n, 2);

(* FUNCTION NAME: occr *)
(* DESCRIPTION: displays teh number of occurances of each element in a list (uses remv function from above)*)
fun occrhelp(n, L, a) = 
     if null L then (n, a) 
     else if n = hd L then occrhelp(n, tl L, a + 1) 
     else occrhelp(n, tl L, a);
        
fun occr(L) = 
     if null L then nil 
     else occrhelp(hd L, tl L, 1) :: occr(remv(hd L, L));












