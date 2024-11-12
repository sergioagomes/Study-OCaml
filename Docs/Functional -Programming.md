## What is Functional Programming ?
  
Is a paradigm that treats computations like an avalation of mathematics functions, avoiding states ou datas mutables.

### Main Concepts:

- **Functions:** In FP is used just fuctions. Functions can be separated into modules according to their responsibilities and semantics, functions are so important that they are had first class, this means that functions are treated as values, as you pass a number or string to a function, you can pass one function as argument.

High-order function is **Map**, used is many functional languages, this functions takes as arguments a lambda expression of one parameter and list

```OCaml
  let add1 x = x + 1
  map add1 [1; 2; 3] = [2; 3 4]
  (*example of High-order function*)
```
- **Declartive Sytle:** on FP the form of programming is declarative.
- **Immutability:** Immutability means that once something is created it cannot be modified.
- **Pure Functions**: A function is considered pure when it always returns the same result, given the same input values ​​and has no side effects.
```OCaml
  let square x = x ** x 
  (* Example of pure function*)
```
- **Types and Structures**: In FP we have typing to handle complex data abstraction, in pure and strongly typed functionality, we are more confident when talking about the robustness of our applications and testability. There is the guarantee of mathematics.