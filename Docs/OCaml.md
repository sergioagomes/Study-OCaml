# OCaml

OCaml is a multi-paradigm programming language, has support for first-class for functional programming and OO, is a language statically and strongly typed.

OBS: this file contains some annatations  and examle saw in OCaml4noobs

## Why OCaml ?

- Type Inference - Hindley-Milner (It's a type system used in functional programmin languages, that allows for automatic type inferece.)
- Algebraic data types
- Parametric polymorphism

## Type Inference

Type Inference is a proper of a **Type System** that allows the compiler infer the type of variable from your expression or value

```OCaml

Let sum_two x = x + 2
(*val sum_two : int -> int = <fun>*)
```

So for example above i don`t need informate that x is a parameter of intenger type and that function sum_two return a INT
```bash
    val sum_two : int -> int = <fun>
```
Above is a signature of the method inferred , so these means that compiler know exactly which are types of variables and type of return function

## Immutability

Immutability is a concept in programming that refers to the property of an object or value that cannot be changed after it has been created. In other words, if an object or value is immutable, it stays the same throughout its lifetime.

Immutability is an important feature in functional programming, where the goal is to avoid side effects and make the code more predictable and secure. By using immutable objects, you can avoid common problems like concurrency bugs, hard-to-track bugs, and unexpected side effects.

## Functions

A function is a set of instructions or operations that can be performed in a program to accomplish a specific task. It can take one or more arguments as input, process them according to a given algorithm, and return a result as output.

```
(*In OCaml the most important proper of a function is your purity*)

x = input
f = function

x -> f -> f(x)

```

```OCaml
(* let function_name arg1 arg 2 == body a function that takes a single argument 

in OCaml definition of functions started with word LET
*)
let add x = x + 1

(* a function uses the built-in [^] operator to concatenate two strings
*)
let str_append a b = a ^ b

(* We can annotate a function definition with types as well. *)
let add1_int (arg : int) : int = arg +. 1.

```

- **function Signature**
```OCaml

(*Function*)
(* *)
let add x = x + 1

(*Signature*)
val add : int -> int = <fun>

(*is a function that receives a int and returns a int  *)

```

### Apply Functions

Function application is a process that occurs when a function is called in a program with one or more arguments passed as input. When a function is applied, the code within the function is executed with the given argument values, and the result (or return value) is returned to the function call.

Function application is one of the fundamental concepts of functional programming, which focuses on using functions to model program logic. By using functions as basic building blocks, programmers can create simpler, more flexible programs that are easier to understand and modify.


- **Functions with Arguments**
 
 - **1 argument**
```OCaml 

let double x = x * 2

double 5
(* - : int = 10 *)

```
   - **2 arguments**
```OCaml 

let sum x y = x + y

let result = sum 1 2
```
  - **Many arguments**
```OCaml 

let average x y = (x + y) / 2

let result = average 4 6

```


### High-Order Functions

Higher-order functions are functions that take other functions as arguments and/or return other functions as a result. In OCaml, as in other functional programming languages, it is possible to define higher-order functions.

```OCaml
let  list = [1; 2; 3; 4; 5]

let new_list = List.map (fun x -> x + 2) list

(*In these example I defined a list with values, and after that i defined a new list, using the function List.map to apply a function that sum the number of each element to 2*)

```

### Currying

Currying is a functional programming technique in which a function that takes several arguments is transformed into a sequence of functions that take only one argument each.

Instead of a single function that takes, say, two arguments, we can create two functions, one that takes the first argument and returns a new function that takes the second argument. This new function can then be called with the second argument to get the final result.

```OCaml
let add x y = x + y

let curry_add = fun x -> (fun y -> x + y)

let add2 = curry_add 2

let result = add2 3

(*In these example I defined the funcition add that recevie two args and return the sum, next I used currying to create a new function "curry_add" that recive an arg and return a new function that recevies other args
   
and the function add2 is a partial fuction application of "curry_add"  with value 2 *)

```

### Lambda Functions

Functions declared without identifiyer are lambda functions, is used when we need a function for a once.
```OCaml
List.map (fun x -> x * x )[1; 2; 3;]
(*To use a lambda function we start the expression with the reserved word "fun" following of args and one arrow  -> twhich separates the function body args and the function declaration *)

(*lambda with multiple args*)

(fun x y -> x - y |> abs) 20 35
(* - : int = 15*)

```

### Recursion

Recursion is a programming technique that involves defining a function in terms of itself. In functional programming, recursion is widely used to iterate over a data structure, usually a list, tree, or graph, and perform an operation on each element.

```OCaml

(*In OCaml we use the word "rec" to compile of OCaml knows that`s a recursive function*)
let rec factorial n = 
    if n < 2 then 
      1
    else 
      n * factorial (n -1)

```

### Composition of Functions

Function composition is a functional programming technique in which two or more functions are combined to form a new function. This new function performs the operation of the outer function against the output of the inner function.

Function composition is a useful technique as it allows you to write programs in a more concise and readable way, breaking a complex task into smaller, more manageable steps. It's also useful for reusing existing functions in new contexts, without having to rewrite all the code again.

```OCaml
(*Composition*)
let (<<) f g x = f(g(x));;

(*functions*)
let mult x y = x * y 
let min = x - y |> abs

(*partial application*)
let  mult2 = (mult) 2
let  min1 = min 1

(*applying composition?*)
let min1_so_mult2 = mult2 << min1

(*so here we pass 9 as value and do min1, and after that we do mult2*)
min1_so_mult2 9
(* - : int = 16*)
```

### Piping
Pipin is used to pass a value or function in first
```OCaml

10. |> sin
(* |> is a piping operator*)

```
Is useful  in many situations like
- simplify  call of functions
- is useful to make a sequence call of functions one after another, received the output value of the previous one
- Remove parentheses of a operation

Also we can use backwards pipe operator, it`s pass the value to a function declared before
```OCaml

(* @@ is a backwards pipe operator*)
 sin @@ 2. + 1 
```

## Datas

A important pillar in OCaml is Datas like:

1 - int
2 - float
3 - chat 
4 - string
5 - bool
6 - unit
7 - 'a list 
8 - 'a array
9 - tuple
10 - records
11 - union


- **Unit**
```OCaml
(*Is used to represents values without useful content*)
let hello () = Printf.printf "Hello"
```
- **List**
Is a collection of  immutable elements of same type.
```OCaml

(*some examples*)
[]
(*- : 'a list = []* -- here 'a is Generic for any type*)

(*list of int*)
let lst_of_int = [1; 2; 3]

1 :: lst_of_int;;

```
A list is an immutable data structure, that is, once a list is created, it cannot be changed. However, it is possible to create a new list from the original list by adding, removing or modifying elements..
```OCaml

let lst = [2; 3; 4]

let new_lst = 1 :: lst
(*here we use :: to add a new element to beggining of list*)
```
**combining lists**
To combine two list we can use the function **List.append** is like **@** that receives two list and return to us a new list with elements of first united with elements of second list
```OCaml

List.append [a;b;c][d:e:f]
(* - : char list = [a; b; c; d; e; f]*)

[a;b] @ [c;d]
(*- : char list = [a; b; c; d]*)
```
- **Arrays**
An array is a mutable data structure that stores a collection of elements of the same type. Unlike a list, an array is a contiguous in-memory data structure, which means that all elements are stored in consecutive memory locations.
```OCaml

(*The syntax is the same as list, but we have pipes "|" to delimit the items of array*)
let nums = [|1; 2; 3; 4|]

```

- **Tuplas**
A tuple is a data type that can store several values of different types, like a list, but with a fixed length. For example, a tuple can store a string and a number, or two integers and a Boolean value. Tuples are defined in OCaml using parentheses and commas to separate values
```OCaml

(*simple tupla*)
("Felipe",1.85, true)
(*- : string * float * bool = ("Felipe", 1.85, true)*)

```
in tuplas, we do not have indexes, so we can`t acess their values from a given position,  in a tupla with two elements we can use **fst** to acess the fisrt element or **snd** to acess the second, tuplas with more elements we can use **Pattern Matching**.
```OCaml

fst ("Felipe",1.85)
(*- : string = "Felipe"*)

snd ("Felipe",1.85)
(*- : float = 1.85*)

(*When we try use this function with a tuple that has more than 2 elements*)

fst ("Felipe",1.85, true)

(*Error: This expression has type 'a * 'b * 'c
but an expression was expected of type 'd * 'e*)

```

- **Records**
Record is a data type that allows you to define a data structure that contains a set of named fields, where each field has an associated type.
```OCaml
(*Sintax*)
type <name record> =
  {
    <field> : <type>;
  }


(*Example*)
(*All the field of a record should start with lower case*)
type person = {
    name : string;
    age  : int
}

(*we can define values that have record  type person *)
{ name = "Joel"; age = 23}
(*- : person = {name = "Joel"; age = 22}*)

let joel = {name = "Joel"; age = 23}
joel.age ;;
(* - : int = 23*)
(*That way we can acess the a value of a record*)

```
  - **Mutable Values**
Records are immutable for default, but we can create records that could have mutable fields, using the word **mutable** to indicate that field needs be mutable.
```OCaml

type car = {
    model : string;
    year: int;
    mutable odometer: int;
}

(*type car = { model : string; year : int; mutable odometer : int; }*)

let car_one = {
  model = "Mustang"; 
  year = 1987; 
  odometer = 3123212
}
(*val car_one : car = {model = "Mustang"; year = 1987; odometer = 3123212}*)

car_one.odometer <- car_one.odometer + 2
(*- : unit = ()*)
```
- **Copy and Change Values**
To change the value is necessary use function **with** that a new record with values of fields returns that we specified changed
```OCaml

type person = {
    name : string;
    age  : int
}
(*type person = { name : string; age : int; }*)

let joel = { name = "Joel"; age = 22}
(*val joel : person = {name = "Joel"; age = 22}
*)

{joel with age = 23}
(*- : person = {name = "Joel"; age = 23}*)
```
We also can use **with** to create a new value of a record with updated values
```OCaml

let felipe = { joel with name = "Felipe"}
(* val felipe : person = {name = "Felipe", age = 23}*)

```
Also we can create a function to return a record with updated values like:
```OCaml
type person = {
  name: string;
  age: int;
}

let add_age (person : person) = {person with age = persob.age + 1}

let joel = { name = "Joel"; age = 22}

add_age joel;;
(* - person = {name = "Joel", age = 23} *)

```

- **Discriminated Union**
A data type that lets you define a set of possible values, each with a name and an associated data structure.
```OCaml

  (*example*)
 type days = Monday
          | Tuesday
          | Wednesday
          | Thursday
          | Friday
          | Saturday
          | Sunday

```
Discriminated Unions can have additional data to the values themselves, the type of this data can be any other type from int, float, tuple... to records and other discriminated unions.
```OCaml

type colors = Red
          | Green 
          | Yellow
          | Blue 

type favorite_color = Blank | Color of int * colors
(*type favorite_color = Color of int * colors*)

Color(1, Red)
(*- :   favorite_color = Color (1, Red)*)

Blank
(* - favorite_color = Blank *)

```

- **Structural Equality**
In OCaml, structural equality refers to how data values are compared for equality.

Structural equality compares data values in terms of their structure, i.e., if two values have the same structure and all of their fields have equal values, then they are considered equal.
```OCaml

[1; 2; 3;] = [1; 2; 3;]
(* - : bool = true *)
```

- **Generics**
Generics is a feature that allows us to program by reducing the amount of casting and redundant code. Generic types are declared using ' in front of their label, usually as 'a or 'b. Generic types are also known as polymorphic types.
```OCaml

type 'a em = {name: string; value: 'a}

{name = "bool"; value = true}
(*- : bool em = {name = "bool"; value = true}*)
```

## Organization


- **Main function:** In OCaml, there is no "main" function where programs start executing. When an OCaml program is run, all its instructions are evaluated during execution. In most of the scripts and programs we create, the **let () =** statement plays the role of the main function. However, it's important to note that the entire file is evaluated during execution, so in a way, all files in OCaml act as one big "main" function.


- **Modules and Signatures:** Modules in OCaml are like mini-files. They can aggregate various definitions such as types, values, constants, other modules, and all other declarations that can be made in a file.
In OCaml, each file is compiled into a module with the same name as the file, capitalized with its initial letter in uppercase. For example, a file named "ocaml.ml" will be compiled into a module called "Ocaml." This module can be accessed by other files in the program. Module contents can be accessed using the dot notation (.), similar to accessing properties of a record. This feature allows for modular organization and easy access to definitions across files in OCaml programs.

- **Interfaces and Signatures:**
If I want the programmer using my class witouh know  how it implemented  I can  use **.mli** that defined interfaces.

To make these we need define a interface of a module, that will act like a mask about  the implementation. To define a interface of a module like **example.ml** we should create a file **example.mli** in the same folder, the compiler always search a file .mli with the same name as the file they are compiling and if they cannot find it, they will infer the interface for the module.

for example:
```OCaml
(*We can define a file message.ml*)

let menssage = "I'm glad see you here"

let show_message = print_endline_menssage
```
So I decided that I don't want that modules will acess have acess of my declaration (mensage), 'cause they only need acess my function "show_message", so for these I create a file .mli with the same name **message.mli**
```OCaml
val show_message : unit -> unit
```
we can show wich value or function using the word **val** followed by your signature, so when someone open it and try acess, will just have acess to show_messagel.


- **Types Abstracts:** an abstract type is an encapsulation technique that allows you to hide the internal details of a data type and restrict direct access to it. It is a way of implementing the principle of "information hiding" in programming, which helps to promote greater modularity and code security.
```OCaml
(*example.ml*)
type person = {name: string; age: int}
let new_person  name age = {name = name; age = age;}
```
For example here  we tranform type in abstract.
```OCaml
(* example.mli*)
type person

val new_person : string -> int -> person = <fun>
```
So we can manipulate expression of type data, but without acess the fields of these record, so I need use the function new_person to create a new value of person.

- **Submodules:** Submodule is a module inside of a module also know as nested modules, when we declare a module on a file, this in turn automatically becomes a submodule of it.
```OCaml
(* Basic Sintax*)

module name_of_module = struct 
    (*value and expressions*)
end
```
For Example, a file calls "ocaml.ml":
```OCaml
module Sergio = struct
    let link = "https://github.com/sergioagomes/OCaml-Studies"
    let show () = Print.printf "You can see my studies about OCaml on %s \n" link
end

let link_ocaml4noobs () = Print.printf "You can see my studies about OCaml on %s" "https://github.com/Camilotk/ocaml4noobs/tree/master"  

let list_of_links () = 
    Sergio.show ();
    link_ocaml4noobs ()
```
If we try acess these declarations in other module, we'll 2 levels of module, like these:
```OCaml
let ()
    Ocaml.Sergio.show ();
    Ocaml.link_ocaml4noobs ()
```
We can restrict the interface of a determined declared submodule in our file, it`s call **module type**, base is struct is:
```OCaml
module Name = sig
    (*the assings goes here*)
end
= 
struct
    (*values here*)
end
```
In our example "ocaml.ml"
```OCaml

module Sergio = sig
    val show : unit -> unit
end
= 
struct
  let link = "https://github.com/sergioagomes/OCaml-Studies"
  let show () = Print.printf "You can see my studies about OCaml on %s \n" link
end  

let link_ocaml4noobs () = Print.printf "You can see my studies about OCaml on %s" "https://github.com/Camilotk/ocaml4noobs/tree/master"  

let list_of_links () = 
    Sergio.show ();
    link_ocaml4noobs ()
```
Definition of module Sergio is equivalent to a pair of files "sergio.ml" and "sergio.mli", also is possible writer assign and definitions in separated blocks
```OCaml
module type Type_sergio = sig
    val show : unit -> unit
end

module Sergio : Type_sergio = struct
    (*---------*)
end
```
The advantage of using separate blocks to declare our interfaces is that they can be reused in more than one module.


- **Open Modules:**
A construct that lets you access a module's values, types, functions, and other definitions directly without using the module name as a prefix. This avoids having to repeat the module name multiple times, making the code more concise and readable.

To open a module, we use the keyword **open** followed by the name of the module we want to open. From that point in the code, all module definitions become visible without needing to use the module name as a prefix.

for example a file with math functions:
**math.ml**
```OCaml

let add x y = x + y
let sub x y = x - y
let mult x y = x * y

```
If I want call these in my main **main.ml** I can use qualify acess
```OCaml

let () = 
    let result = Math.add 5 10 in
    print_endline (string_of_int result);

```
Or I can open the module to use all definitions in **math.ml** without use qualification.
```OCaml
open Math

let () =
  let result = add 2 3 in
  print_endline(string_of_int result);
```
- **Extend Modules and Assigns**
Working with modules,we can create new modules that extend the preexisting ones, that is, they receive all the characteristics declared in the other module plus those that the user defines, this is close to the concept of "inheritance" or "mixin" in other languages.

So if we using a module present on ambient default of OCaml List, but what we want is create a new function that make part of List, to do this we create a new file **extension.ml**, where we use the reseverd word **include** to include a definition of List module in our new module List, and declared our function:
```OCaml

module List = struct
  include List
  let rec optmap f = function
     | [] -> []
     | hd :: tl ->
        match f hd with
          | None -> optmap f tl
          | Some x -> x :: optmap f tl
  end;;

```
> The use of include is discouraged as it generates code duplication like copy-paste at a compilation level.

So this will create a module **Extension.List** that have a module that contains all what have in base module List and the function optmap, so we can open the module Extension and use the new function.
```OCaml
open Extensions

List.optmap ...
```
As like we used the word include for extend modules, also we can extended signatures
```ocaml
module type Person = sig
    val name : string
    val username: string
end

module type Person_with_age = sig
    include A
    val  age : int 
end
```

#### Common Erros with Modules
Most common erros in OCaml:
  - **Type Mismatch**: Happens when some signature on .mli file not match with implementation declared on file .ml
  - **Missing Definition**: Happens when we compiled both files .mli and .ml, but miss a defined implementation on signatures of file .mli in file .ml
  - **Type Definition Mismatch**: The declared Types it not match with types of implemetation on file .ml.
  - **Cyclic Dependencies**: OCaml does not allow cycle dependencies (when two definitions are mutually dependent on each other).If there is a cyclic dependency between two modules this will cause an errors


### Designing Modules
The modules system is one of principal parts of architecture of any program in OCaml, that`s why is necessary that be projected of a efficient way, to do these we have some concepts to help us to project a program using modules system

### Rarely exposed concrete types
When we structuring a file **.mli**, one of choices that we need do is exposed or not the correct definition of types in our module or expose them as abstract types, in most of situations, abstract types is the correct choice, 'cause:
  1 - Abstract Types increases the flexibility of our code.
  2 - Abstract Types allow enforce how the types should be used.

In summary, abstraction in code increases flexibility by limiting how module users interact with types, thus reducing potential dependencies on the implementation details. By explicitly exposing types, users can access all the exposed details, which can lead to unintended dependencies. However, by abstractly exposing types and only providing specific operations, you create a safe boundary that allows you to change the implementation without affecting the client code, as long as the exposed operations remain unchanged. This approach promotes a more maintainable and adaptable codebase.

### Design for those who are calling
In summary, when designing an interface, it is essential to prioritize clarity and ease of understanding for those who will interact with it. By using descriptive names for functions, variant types, and records, you can make the API more obvious to consumers. Shorter names are suitable for functions with a smaller scope, while longer and more explicit names are beneficial for global functions. Additionally, less frequently used values can benefit from being named explicitly and verbosely. Prioritizing clarity and simplicity in the interface will facilitate the consumption and modification of code for those using the API.

### Create Uniforms Interfaces
When developing an interface, we should not think of it in isolation. Typically, our interfaces represent values that interact with the code and other interfaces, and they should work together seamlessly. This task becomes easier when we use conventions or interface patterns, making consumption and work with them more straightforward.

Two commonly used conventions are:

  - One module for each type in the application. Typically, we create a module for each defined type in the application and export the primary type of the module with the name t.

  - Always place t first. If our hypothetical module named M, where the primary type is M.t, has functions that use values of type M.t, we always put those values as the first argument.

for example:
```ocaml
(* a .mli file with module M and type t'*)
module type M = sig
  type t
  val create : int -> t
  val add : t -> int -> t
  val get_value : t -> int
end

(* M file .ml*)
module M : M = struct
  type t = int
  let create x = x
  let add x y = x + y
  let get_value x = x
end
```

### Interfaces Before implementation
OCaml is a very concise language with great flexibility in types and code design. One of the key tasks in writing a well-written OCaml program is to use types correctly and safely. Therefore, it is essential to carefully consider the types our program uses.

A good approach to achieving this is to write type definitions before implementing the logic. This includes writing the signatures first when working with submodules and creating our .mli files before the corresponding .ml files.

By doing so, we establish a clear understanding of the types involved, which helps ensure that our code is robust and less prone to errors during the implementation process. Separating the type definitions from the implementation also promotes code readability and maintainability, making it easier for other developers to comprehend and use our code effectively.


### Functors
In OCaml, functors are parameterized modules that allow you to create generic and reusable modules. They are an advanced and powerful concept of the language that makes it possible to create modules that depend on other modules to function, allowing greater flexibility in writing code.

The principal difference that have our functions is that these functions receive modules as parameters and also return modules. Functors allow us create parameterized modules  and provide a module to anothe that receives the implementation

For example we have the signature of a module **Stringable** defined, being this signature define the exposition of a abstract type **t'** and one function **toString** that receive a value **t'** and return a string:
```ocaml
module type Stringable = sig
  type t
  val toString : t -> string
end 
```
So if I want create a functor that will receive these signature and use the types defined in this interface, to declare two parameterized functions that will use the types of the interface.
```ocaml
module Printer (Item:Stringable) = struct
    let print (t: Item.t) = print_endline (Item.toString t)
    let printList (list : Item.t list) =
    ((list |> (List.map Item.toString)) |>
      (String.concat ((", "))))
      |> print_endline
end
```
Now I can defined these functor passing a module that implements this interface as parameter and passing the concrete implementations of this type:
```ocaml
module IntPrinter = Printer(struct 
    type t = int 
    let toString = string_of_int end)
)
```
Functor will returned a concrete implementation of a module that will be assigned to the module **IntPrinter** which in addition to containing the types of module passing as parameter to the functor also will containg the functions that was declared parametrically in its definition
```ocaml
IntPrinter.printList [1; 2; 3]
(*1, 2, 3 - : unit = () *)

```
Functors help us parameterized our applications and model better modules,in addition to allowing for a great deal of code reuse, using them correctly can be helpful in solving many code structure issues, including:

- **Dependence of Injection**Because they make the implementation of some components changeable. This is particularly useful when the intent is to prototype parts of the system for testing and simulation.
- **Auto Extension Modules**Functors provide us with a way to extend our modules with new functionality in a standardized way. Functors allow us to write logic just once and reapply it and as we saw earlier we can use include to do this, but certainly functors can provide us with this in a more organized and efficient way.
- **Instantiate stateful modules**Modules can contain mutable states, this means that it can sometimes be useful to have multiple instances of a particular module, each with its own individual state. Functors allow us to automate the construction of these modules
      


### First-class modules
> OCaml provides a way around this stratification in the form of first-class modules. First-class modules are ordinary values that can be created from and converted back to regular modules.  
First-class modules are a sophisticated technique, and you’ll need to get comfortable with some advanced aspects of the language to use them effectively. But it’s worth learning, because letting modules into the core language is quite powerful, increasing the range of what you can express and making it easier to build flexible and  modular systems.
      (Real World OCaml)

### Building First-class modules

So If I have a signature of a module that have a int type:
```ocaml
module type IntValue = sig
      val value : int 
end
```
I can create a module that implements this signature:
```ocaml
module Tree : IntValue = struct
      let value = 3
end
```
To build a first-class module should package the module and its signature. This is done using the module keyword in this structure
```ocaml
(*sintax*)
(module <Name> : <Type>)
```
For Example:
```ocaml
let tree = (module Tree : IntValue)
(* val tree : (module IntValue) = <module>*)
```
the type of module is optional in the build of a first class module when it could be infer by content
```ocaml
module Four = struct
  let value = 4
end
(*module Four : sig val value : int end*)
```
When we packaged modules, can used as values, for example in Lists:
```ocaml
let numbers = [tree; (module Four)]
(* val numbers: (module IntValue) list = [<module>; <module>] *)
```
Also we could use **anonymous modules** to create first class modules, could define a anonymous module using this stucture:
```ocaml
(module struct <let ...> end)
```
for example:
```ocaml

let numbers = [tree; (module struct let value = 5 end)];;
(* val numbers: (module IntValue) list[<module> <module>] *)
```


### Acessing First-class modules

I can acess the content of first class module when we unpack in normal modules, to do this we use the reserved word **val** with structure:
```ocaml
  (val <Module> : <Type of Module> )
```
for example:
```ocaml
module Other_tree = (val tree : IntValue)
(*module Other_tree : IntValue*)

Other_tree.value
(* - : int = 3 *)

```
I also can write functions that consume and produce first-class modules
```ocaml
let to_int input_module = 
    let module M = (val input_module : IntValue) in
    M.value
(* val to_int : (module IntValue) -> int = <fun>*)


let sum first_module second_module =
    (module struct
        let value = to_int first_module + to_int second_module 
    end : IntValuet)
(*val sum : (module IntValue) -> (module IntValue)-> (module IntValue) = <fun>*)
```
Now I can acess and use these functions to workin in define new modules
```ocaml
let six = sum tree tree
(*val six : (module IntValue) = <module>*) 
```
we can see that when we unpack our module, it's value becomes the one returned by our function

> First-class Modules is a advanced concept of language and it serves as a shortcut and a way to facilitate the solution of specific problems. 
But it's important for you to know that everything that can be done using first-class modules can be done without using first-class modules.

## Pattern Matching

OCaml allows us to use pattern match to capture values through the pattern that can be inferred by the structural equality 
of the data. We can use pattern match in almost any 
structure of the language:

- constants
- Tuples
- Records
- Discriminated Unions
- Lists
- Arrays
- Types
- null

Simple Pattern Match:
```ocaml
let (a,b) = (1,2)
(* val a : int = 1 *)
(* val b : int = 2 *)
```
These Pattern Match is called destructuring, the unstructured structure in
left is infered the values of right strucuture, so the value 1 is identified by a, and
value 2 is identified by b.

In functions is also possible, so he have a function that receive a value
of type tuple, the first item of tuple receive the name of parameter f and the 
second recevie s, so the function add the two values
```ocaml
let pair (f, s) =
  f + s ;;
(*val pair : int * int -> int = <fun> *)
```
Below we have another example using pattern match with same tuple:
```ocaml
let pair p =
    match p with
    |(f,0) -> f
    |(0,s) -> s
    |(f,s) -> f + s

(*val pair : int * int -> int = <fun> *)
```
In these case we use reserved word **match** to do the pattern match
of our values and this allow us especify multiples values that these parameter
could contain and impute a return of accordingly with receive parameter, so in
these case the first pattern found that is possible infer the input will be the return of
expression it take.


#### Treat Errors
So in OCaml how we use functional programming , we seek to work building functions that could
receive any input to defined type as input on signature of function and also that function could
return any valid value inside of declared type in our function and these is a problem when we had expections

Because functions are defined by our inputs and outputs, so this is important
'cause when we working of functional way we used composition of functions to create
programs that solved complex problems.

If **f** and **g** are functions,  so the output of **f** is compatible with the input of
**g** we can compose then in one function **f.g**, these allow us build  complexy functionalities
for the combination, and also allow reuse of these code.

But to do these works the functions should be without side effetcs, that means
functions can not throw exceptions or produce any effect other thant it's output
value.

For this to be possible is necessary with us put these side effect in output of function
for example, if we don't want throw a expection  when an error is found, so our function
need return a type that is capable of representing a mistake or a sucess. In OCaml we used
the tyoe **Option** and the type **Result**.


##### Option

Is used to handle values that can be absent. It is particulary useful for avoiding null 
references erros and enabling safer handling of potentially missing values.

to create a value Option we used one of our constructors:
1 - **Some** to create an instance of Option with a value.
2 - **None** to create an instance of Option without value


Option is a Discriminated Union and all what applies in Unions also apply
in Option, so i a form to use Pattern Match that is used to determined if 
a value exist to destructuring this value.

if we want define a Descriminated Union to represent an option we could write:
```ocaml
(*declare options' as ' because option already exist *)
type 'a option' =
    | Some of 'a
    | None;;

Some "a"

```

#### Result 

Result is a Type to represent a computation taht result an sucess or error. Result is 
a variant|sum type | union that contains two constructors being then **Ok** that represent
sucess and **Error** that represents erro and we used theses types to return values that could result
an error.

if we want write our own result, we could do like that:
```
type ('a, 'b) result = 
    | Ok of 'a
    | Error of 'b

```

Ok value means that the function was executed without error and have x and a value Error e means that happened
an error and that error have  a menssage e. We used Pattern Match to do the treating and  extract information
in both cases, the advantage to use this kind of approach is that they encapsulate the error in the return type
withou breaking the type contract.

Example of how use Result.
```ocaml
type request = 
    { name: string;;
      email: string  };;

let validate_name request =
    match request.name with
    | "" -> Error "Name can not be void"
    | "Z111Kaaaaaa$$$" -> Error "what fuck is that ? there is now way to valide this"
    | _ -> OK request;;


validate_name { name = "Z111Kaaaaaa$$$"; email = ziiika2014@foda.com};;

validate_name { name = "felipe"; email = "felipe@gmail.com"}

```
so we can use result to replace exepctions to treating erros.

so if we want validate de full request:
```ocaml
let validate_email request
    match request.email with
    | "" -> Error "Email is void"
    | _ -> Ok request

let validate_request result =
    Result.(bind (Result.bind result validate_name) validate_email);;
```
now we create a request to do pattern match in result:
```ocaml
let first_request = { name = "felipe"; email = "felipe@gmail.com"};;

let response = validate_request (OK first_request)

match response with
| OK request -> Printf.sprintf "Valid! the name is %s and email %s" request.name request.email
| Error e -> Prinf.sprintf "Erro %s" e;;
```
These works if we has an error
```ocaml
let second_request = {name = "Z111Kaaaaaa$$$"; email = ziiika2014@foda.com}

let second_response = validate_request (OK second_request);;

match second_request with 
| OK request -> Printf.sprintf "Valid! the name is %s and email %s" request.name request.email
| Error e -> Printf.sprintf "Erro %s" e ;;
```
So if result is easy to chain functions, these allow us work with small functions that are combined in bigger
functions and more complexy.

## Sequence 

Sequence is a type of abstract collection, is similar a List, but the difference is that Sequence works with
Lazy Evaluation that which guarantees that it can contain more than a million elements, but computing only 
those that are necessary which guarantees us an efficient and economical use of memory and 
computational resources.

to create a Sequence we can use present function on librarie default, usually use function **List.to_seq**
```ocaml
let sequence = List.to_seq [1;2;3]

```
We have the fucntion **to_seq** that create Sequence of List, also we have function **of_seq** that allow
us convert Sequence to List:
```ocaml
let list = sequence
  |> Seq.map (fun x -> x + 1)
  |> Seq.map (fun x -> x * 3)
  |> List.of_seq;;
```