(*
A leap year (in the Gregorian calendar) occurs:

In every year that is evenly divisible by 4.
Unless the year is evenly divisible by 100, in which case it's only a leap year if the year is also evenly divisible by 400.
Some examples:

1997 was not a leap year as it's not divisible by 4.
1900 was not a leap year as it's not divisible by 400.
2000 was a leap year!
*)

(*Solution*)
let leap_year year =
  if year mod 4 = 0 then
    if year mod 100 = 0 then
      if year mod 400 = 0 then true
      else false
    else
      true
  else
    false