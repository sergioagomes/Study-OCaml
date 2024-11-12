## Church Enconding
  `Represeting data and operators in the lambda calculus`  

## Church Enumerals
`Church numerals are the representations of natural numbers under Church encoding`
```rs
     0 =  λf. λx. x
     1 =  λf. λx. f x
     2 =  λf. λx. f (f x)
     3 =  λf. λx. f (f(f x))  
     4 =  λf. λx. f (f(f (fx)))  
     ....
```
**Successor Function**

```rs
    succ = λn. λf. λx . f(n f x)
    0 = λf. λx. x
    succ 0
      - (λn. λf. λx . f(n f x))0
      - λf. λx . f(0 f x)
      - λf. λx . f((λf. λx. x) f x)
      - λf. λx . f x
    1 = λf. λx . f x
    succ 0 = 1

    succ 1
      - (λn. λf. λx . f(n f x))1
      - λf. λx . f(1 f x)
      - λf. λx . f(1 f x)
      - λf. λx . f((λf. λx . f x)f x)
      - λf. λx . f (f x)
    2 =  λf. λx. f (f x)
    succ 1 = 2
    succ n = n +1
```

**Addition**

```rs   
    add 0 1 = 1
    add 1 2 = 3

    add = λn . λm. λf. λx. n f(m f x)
    add 0 1
      - (λn . λm. λf. λx. n f(m f x)) 0 1
      - (λm. λf. λx. 0 f(m f x))1
      - λf. λx. 0 f(1 f x)
      - λf. λx. 0 f(f x)
      - λf. λx. f x

    add 1 2
        - λn . λm. λf. λx. n f(m f x)1 2
        - (λm. λf. λx. 1 f(m f x))2
        - λf. λx. 1 f(2 f x)
        - λf. λx. 1 f(f(f x))
        - λf. λx. (f(f(fx)))
        - 3
```

**Multiplication**
```rs
    mult 0 1 = 0 
    mult 1 2 = 2
    mult 2 3 = 6 

    mult = [λn. λm. m (add n)0] n m

    mult 0 1 
      - (λn. λm. m (add n)0)0 1
      - (λm. m (add 0)0) 1
      - 1 (add 0) 0
      - add 0 0
      - 0

    mult 1 2  
      - (λn. λm. m (add n)0)1 2
      - (λm. m (add 1)0) 2
      - 2 (add 1)0
      - (add 1)((add 1)0)
      - (add 1)(add 1 0)
      - (add 1)(1)
      - (add 1 1)
      - 2 

    mult 2 3
     - (λn. λm. m (add n)0)2 3
     - (λm. m (add 2)0) 3
     - 3 (add 2) 0 
     - (add 2)(add 2)((add 2)0)
     - (add 2)((add 2)(2))
     - (add 2)(4)
     - 6
```

## Church Booleans 
 `Is a function of two argumetns: true is "select first" false is "select second".`

```rs
     True = (λx.λy.x)
     False = (λx.λy.y)
    
    T = (λx.λy.x) a b
    T = ((λy.x)[x-> a])b
    T = (λy.a)b
    T = a [b -> b]
    T = a

    F = (λx.λy.y) a b
    F = ((λy.y)[x -> a])b
    F = (λy.y)b
    F = b


AND = (λa. λb. a b F)


    T T = (λa. λb. a b (λx. λy. y))(λx.λy.x)(λx.λy.y)
          (λb. a b (λx. λy. y))[a ->(λx.λy.x)](λx.λy.y)
          (λb. (λx .λy. x)b(λx .λy. y))(λx .λy. x)   
          ((λx .λy. x)b(λx .λy. y))[b ->(λx .λy. x)]
          (λx .λy. x)(λx .λy. x)(λx .λy. y)
          (λy. x)[x -> (λx .λy. x)](λx .λy. y)
          (λy.(λx .λy. x))(λx .λy. y)
          (λx .λy. x)[ y -> (λx .λy. y)]
          (λx .λy. x) 
          T

    T F = (λa. λb. a b F) T F
          (λb. a b F)[a -> T]F
          (λb. T b F)F
          (T b F)[b -> F]
          (T F F)
          (λx. λy. x) F F
          (λy. x)[x -> F]F
          (λy. F)F
          F [y ->]
          F
          
    F T = (λa. λb. a b F) F T
           F T F 
           F 
    
    F F =  (λa. λb. a b F) F F
           F F F
           F

NOT = (λa. a F T)

    NOT T = (λa. a F T )T
            T F T
            F
    NOT F = (λa. a F T )F
            F F T
            T 

OR =   λx.λy.λt.λf.x t (y t f)
```

**IF Branches**
```rs
  
  if c then
    a
  else
    b

 - if c a b
 - if T a b = a
 - if F a b = b

Examples:
    - if T a b
      - (λa. a) T a b
      - T a b
      - a

    - if F a b
      - (λa. a) F a b
      - F a b
      - F 
```
