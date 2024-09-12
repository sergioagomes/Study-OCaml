# Tests

Tests are important to your application, because we knowing with more precision which parts of our system are in trouble, also we ensuring a smaller number of errors and problems in production.


## Unit Tests


### what is unit tests

Unit tests are tests that cover short pieces of our code called units (usually a unit is a function). The main purpose of unit testing is to ensure the correct functioning of each function of our isolated way system

Also unit tests are used like regression tests, so always are executed before the system goes to production or after some changes, to ensure that all functions are covered to test still working. 

### How can I do unit tests

Unit tests should verify of isolated way fuctioning of each function, a productive way to do unit test is using libraries or frameworks of tests, that help us, in OCaml we have 

- **Alcotest**: Framework to do test in projects using OCaml


## Triple A Pattern

- **Arrange**: part where our code is organized and prepared to scenario of test.

- **Act**: Where we execute our codes that are execute actions we do, using all possible inputs expected  of function

- **Assert**: Here is a  final part of our test, where we compare result of test with  the expected values of input.


## Porperty Testing

Property testing (property testing) is an approach to testing software programs, where program-specific properties are defined and tested in a wide variety of test cases. Rather than focusing on individual test cases, the purpose of property testing is to verify that properties or invariances hold for a broad set of inputs.

```OCaml

let prop_reverse_reversed l =
  let reversed = List.rev l in
  List.rev reversed = l

let () =
  QCheck_runner.run_tests [
    QCheck_ounit.to_ounit_test ~verbose:true (QCheck.Test.make ~name:"prop_reverse_reversed" prop_reverse_reversed)
  ]
```
1 - Here I defined a prop that verify if the function List.rev return a reverse list
2 - Here the execution of code is diferrent the librabrie of test generate multiple ramdom entries based on type of parameters and try invalidate the property