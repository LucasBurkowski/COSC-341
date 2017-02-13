
(* FUNCTION NAME: delnthc *)
(* DESCRIPTION: deletes the nth character of a string *)
fun delnthc("", n) = ""
     | delnthc(st, 0) = st
     | delnthc(st, 1) = implode(tl(explode(st)))
     | delnthc(st, n) = str(hd(explode(st))) ^ delnthc(implode(tl(explode(st))), n - 1);

(* FUNCTION NAME: dispnthc *)
(* DESCRIPTION: displays the nth character of a string *)
fun dispnthc("", n) = chr(0)
     | dispnthc(st, 0) = chr(0)
     | dispnthc(st, 1) = hd(explode(st))
     | dispnthc(st, n) = dispnthc(implode(tl(explode(st))), n - 1);

(* FUNCTION NAME: multin *)
(* DESCRIPTION: multiply first element of list by second and third*)
fun multinhelp(a, b, c, 0) = 
     a :: multinhelp(a, b, c, 1)
     | multinhelp(a, b, c, d) = if d = c then [a * b] 
       else (a * b) :: multinhelp(a * b, b, c, d + 1);

fun multin(nil) = nil
     | multin([a, b, 0]) = [a]
     | multin([a, b, c]) = multinhelp(a, b, c, 0)
     | multin(L) = nil;

(* FUNCTION NAME: remv *)
(* DESCRIPTION: removes any instance of a character from a list *)
fun remv(n, nil) = nil
     | remv(n, x :: nil) = if x = n then nil else [x]
     | remv(n, x :: xs) = if x = n then remv(n, xs) else x :: remv(n, xs);

(* FUNCTION NAME: remvdub *)
(* DESCRIPTION: removes any instance of a character from a list that appears twice (uses remv function)*)
fun remvdub(nil) = nil
     | remvdub(x :: nil) = [x]
     | remvdub(x :: xs) = x :: remvdub(remv(x, xs));

(* FUNCTION NAME: inde *)
(* DESCRIPTION: returns the position(s) of a given int in a list*)
fun indehelp(n, nil, a) = nil
     | indehelp(n, x :: xs, a) = if x = n 
       then a :: indehelp(n, xs, a + 1)
       else indehelp(n, xs, a + 1);
        
fun inde(n, nil) = nil
     | inde(n, L) = indehelp(n, L, 1);

(* FUNCTION NAME: nele *)
(* DESCRIPTION: repeats each element in the list n number of times*)
fun nelehelp(nil, n, a) = nil
     | nelehelp(x :: xs, 0, a) = nelehelp(xs, a, a)
     | nelehelp(x :: xs, n, a) = x :: nelehelp(x :: xs, n - 1, a);

fun nele(nil, n) = nil
     | nele(_, 0) = nil
     | nele(L, n) = if n = 1 then L else nelehelp(L, n, n);

(* FUNCTION NAME: spliat *)
(* DESCRIPTION: splits a string at the given int of chars*)
fun spliat(st, 0) = [st]
     | spliat(st, 1) = implode([hd(explode(st))]) :: [implode(tl(explode(st)))]
     | spliat(st, n) = 
       implode((hd(explode(st)) :: explode(hd(spliat(implode(tl(explode(st))), n - 1))))) :: tl(spliat(implode(tl(explode(st))), n - 1));

(* FUNCTION NAME: isfact *)
(* DESCRIPTION: determines if an positive int is a factorial number*)
fun isfacthelp(1, a) = true
     | isfacthelp(n, a) = 
       let val cont = (n mod a = 0)
           val quot = n div a
       in  if cont then isfacthelp(quot, a + 1) 
           else false
       end;
   
fun isfact(n)=
     isfacthelp(n, 2); 

(* FUNCTION NAME: occr *)
(* DESCRIPTION: displays teh number of occurances of each element in a list (uses remv function from above)*)
fun occrhelp(n, nil, a) = (n, a)
     | occrhelp(n, x :: xs, a) = if n = x then occrhelp(n, xs, a + 1)
        else occrhelp(n, xs, a);

fun occr(nil) = nil
     | occr(x :: xs) = occrhelp(x, xs, 1) :: occr(remv(x, xs));


