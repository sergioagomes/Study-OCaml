(*
Find the difference between the square of the sum and the sum of the squares of 
the first N natural numbers.

The square of the sum of the first ten natural numbers is (1 + 2 + ... + 10)² = 55² = 3025.

The sum of the squares of the first ten natural numbers is 1² + 2² + ... + 10² = 385.

Hence the difference between the square of the sum of the first ten natural numbers and the 
sum of the squares of the first ten natural numbers is 3025 - 385 = 2640.

You are not expected to discover an efficient solution to this yourself from first principles; 
research is allowed, indeed, encouraged. Finding the best algorithm for the problem is a key skill in 
software engineering.

*)


let square_of_sum n = 
  let sum = n * (n + 1) / 2 in
  sum * sum

let sum_of_squares n =
  n * (n + 1) * (2 * n + 1) / 6  

let difference_of_squares n =
  let sum = square_of_sum n in
  let square_of_sum = sum * sum in
  let sum_squares = sum_of_squares n in
  square_of_sum - sum_squares

