(*Trying do Peano Fold*)

type nat = 
  | O 
  | S of nat

(*define a number one*)
let one = S O 
let two = S (S O)

(*convert nat to int*)
let rec nat_to_int = function
  | O -> 0
  | S n -> 1 + nat_to_int n

let () = 
  print_int (nat_to_int two);
  print_newline ()

