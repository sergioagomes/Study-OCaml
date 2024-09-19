## What is Lambda Calculus ?

Lambda Calculus(λ-calculus) is a formal system in mathematical logic for expressing computation based on fuction abstraction and application using variable bindin and substitution.

```rs
    // λ-Calculus Syntax

    expression ::= variable        //identifier
        | expression expression    // application
        | λvariable.expression     // abstraction
        | (expression)             // grouping  

```

The classes of expression are defined as:

- **Variable ID** is  a expression itself
```
    variable = expression
```
- If ID is a **Variable** and E is a expression, so λID.E is an **Abstraction** 
```
    E -> λID.E
    abstraction = λ(variable).(expression)
```
- If ID is a expression and E is a expression, so (EE) is a application
```
    E -> E E
    application = (expression)(expression)
```

## Details

**Variable**: a character or string representing a parameter or mathematical/logical value.

**Abstraction**: In λ-calculus, the functions are defined using λ(lambda) and not are nominated, an anonymous function has  it's own abstraction as it's only indenty. 
```rs
    λx.a
    λx.x      -> (λx.a(λx.x b))
    λx.b   

   // it is observed the pair (M N) represents an application of M to N, in this case M= λx.a and N = λx.x em b, where N is a pair (M N)
   // that means (λx.a(λx.x b)) is a abstraction of lambda type (M(M N))          
      
```
Abstraction of lambda type can be "free" or bound, this concept refers to the connection of X in M, where abstraction is type : λx.M
```rs 
  λx.x       // x is bound, both in x and in M
  λx.y       // x is bound, y is free

```
**Application**: Function can be apllied on expressions, so (A B) applying a function A to an argument B, both are lambda terms.
```rs
    // in λ             
    (λa.a * a * a)b  ->  (λ(a)a * a * a)(3) = 27
```
------------------------
**Currying**: technique to translate the evaluation of a function that takes multiple arguments into a sequence of functions that each take a single argument 
```rs
    // Define adding two parameters together with functions that only take one parameter

    - λx.λy.((+x)y)
    - (λx.λy.((+x)y))1
        λy.((+1)y)
        
    -(λx.λy.((+x)y)) 10 20
       (λy.((+10)y)) 20
       ((+10)20)) = 30 
```
**Free Variables**: A variable is free if it does not appear within the body of an abstractic with metavariable of the same name
```rs
   x is free in E if:
   - E = x
   - E = λy. E1, where y != x and x is free in E1
   - E = E1 E2, where x is free in E1

```
## Bound Variable 

- If a varibale is not free, it`s a bound
- Bound by what abstraction ?
    - What is the scope of a metavariable ?

- Rules
    - If an occurrence of x is free in E, then it`s a bound by λx. in λx.E
    - If an occcurence of x is a bound by a particular λx. in E, then x is a bound by the same λx. in λz.E
        - Even if z == x
        - λx.λx.x
            - Which Lambda expression binds x ?
    - If an occurence of x is a bound by a particular λx. in E1, then that occurence in E1 is tied by the same abstraction λx. in E1 E2 and E2 E1
```rs

    -(λx.x(λy.xzy)x)xy
        - (λx.x(λy.x'z'y)x)'x''y'  - > '' are free variable
    -(λx.λy.xy)(λz.'x'z) - x is free in λz
    -(λx.xλx.'z'x) -> z is free 

```
## Equivalence 
    - What does it mean for two functions to be equivalent?
      λy.y = λx.x ? --> same function
    - λx.xy = λy.yx? --> different function
    - λx.x =  λx.x?  --> same function

- **a-equivalence** is when two functions vary only by the name of the bound variables
  - E1 = a E2

- Need a way to rename variable in an expression
    - Simple find and replace?
    - λx.xλy.xyz
        - Can we rename x to foo?
        - Can we rename y to bar?
        - Can we rename y to x? 
        - Can we rename x to z?

- For all expression E and all variables y that do not occur in E
    - λx.E = αλy .(E{y/x})

- λy.y = λx.x ? -> same function
- ((λx.x(λy.xyzy)x)xy) =
  ((λy.y(λx.yzwz)y)yx) ?  -> different function


## Renaming Operation
    - E {y/x}
       - x {y/x} = y
       - z {y/x} = z, if x != z
       - (E1 E2){y/x} = (E1 {y/x})(E2 {y/x})
       - (λx.E){y/x}= (λy.E {y/x})
       - (λz.E){y/x}= (λz.E {y/x}), if x != z
Examples:
```rs
- (λx.x){foo/x}
    - (λfoo.(x)){foo/x}
    - (λfoo.(foo))

-((λx.x(λy.xyzy)x)xy){bar/x}
 -(λx.x(λy.xyzy)x){bar/x}(x){bar/x}(y){bar/x}
 -(λx.x(λy.xyzy)x){bar/x}(x){bar/x}(y)
 -(λx.x(λy.xyzy)x){bar/x}(x)bar y
 -(λbar.bar((λy.xyzy){bar/x}bar))bar y
 -(λbar.bar((λy.(xyzy)){bar/x}bar))bar y
 -(λbar.bar((λy.(baryzy))bar))bar y     

```
## Substitution
-  Renaming allows us to replace one variable
name with another
- However, our goal is to reduce (λx. + x 1)2 to (+ 1 2), which replaces x with the expression 2
- We neeed another operator, called substitution, to replace a variable by a lambda expression
- E[x->N], where E and N are lambda expressions and x is a name 

```rs
    (λx. + x 1) 2
    (λx. + x 1) [x→2]
    (+ 2 1)
```
Example:
```rs
        λx. λy. + y (+ x 1)

        (λx. λy. + y (+ x 1)) 4  // apply substitution of x by 4
        (λx. λy. + y (+ 4 1)) [x → 4]
        (λy. + y (+ 4 1))

        (λy. + y (+ 4 1)) 2  // now we apply substitution of y by 2
        (λy. + y (+ 4 1)) [y→2]
        (+ 2 (+ 4 1)) [y→2]

```

But like **renaming** we can't substitute free variables in lambda expression.

Example:
```rs
     // here we can substitute x, `cause if we applied something to expression x would be replaced:   
        (λx. + x (+ y 1)) 2
        (λx. + x (+ y 1)) [x→2]
        (+ 2 (+ y 1))

    //But if we tried replace y, nothin would happen,'cause y is a free variable
```
## Reduction Operations
**A-Conversion**:his operation is used to remove variable name conflicts.  It says that two abstractions are equivalent
```rs
     ( λx . M[x] ) -> ( λy . M[y] )
      λx. (+ x 3)  -> λy.(+ y 3)         
```
**B-Reduction**Replace the bound variable with the argumet expressiob  in the body of the abstraction
```rs

   (λx.xy)z
    = (xy)[x :=z]   -- the substitution ocurr inside []
    = (zy)
    = zy
    
   (λx.(+ x 5)3) -> (+ 3 5) // these is a good b-reduction ?

    (λx.λy.(+ x y (λy.(+ z 1))3))2 5
    (λx.(λy.(+ x y (λy.(+ z 1))3))2)5
        (λy.(+ 3 y (λy.(+ z 1)))2)5       
        (+ 3 2 (λy.(+ z 1)))5
              = 11      //need verify 
```
- **Execution**
    - Execution will be a sequence of terms, resulting from calling/invoking functions
    - Each step in the sequence is called a **b-reduction**
        - We can only **b-reduce** a **b-redux**(expressions in the application form)
        -(λx.E)N
    
    - B-reduction is defined as:
        -  (λx.E)N b-reduces to
        - E [x->N]

    - b-redux is an expression in the application form, that means an expression in which you are applying a value to a function.
 Examples:
```rs 
    (λx. x) y - Applying y to λx. x
    (λx. λy. y) z - Applying z to λx. λy. y
    (λx. y) (λx. + x 1) - Applying λx. + x 1 to λx. y      
        
```
```rs
        (λx.λy.(+ x y (λy.(+ z 1))3))2 5
        (λx.(λy.(+ x y (λy.(+ z 1))3))2)5
        (λy.(+ 3 y (λy.(+ z 1)))2)5       
        (+ 3 2 (λy.(+ z 1)))5
              = 11      
   //we can say that an expression is in the b-normal form when there   are no more B-reduxes letf, or,  in simple way, when there are no more applications to be done.

```
## Combinators

- Expression is a combinator if  it does not have any free variables
```rs

    λx. λy. x y x  -> is a combinator
    λx. x -> is a combinator
    λz. λx. xy z -> is not a combinator because z is a free variable

```

## Y Combinator

```rs
    - Y = (λx. λy. y (x x y))(λx. λy. y(x x y))


    - Y foo
      - (λx. λy. y (x x y))(λx. λy. y(x x y))foo
      - (λy. y ((λx. λ.y y(x x y))(λx. λy. y(x x y))y))foo
      - foo ((λx. λ.y y(x x y))(λx. λy. y(x x y))foo)
      - foo (Y foo)
      - foo (foo(Y foo))
      - foo (foo(foo(Y foo)))
```