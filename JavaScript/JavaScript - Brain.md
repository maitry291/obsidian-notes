
JavaScript makes web pages doing nothing to user interactive.

Browser APIs - DOM, Canvas, Geolocation, etc
3rd party APIs - Twitter, Google Maps, etc

>When you load a web page in your browser, you are running your code (the HTML, CSS, and JavaScript) inside an execution environment (the browser tab). This is like a factory that takes in raw materials (the code) and outputs a product (the web page).

Each browser tab has its own separate bucket for running code in (these buckets are called "execution environments" in technical terms) — this means that in most cases the code in each tab is run completely separately, and *the code in one tab cannot directly affect the code in another tab* — or on another website. This is a good security measure — if this were not the case, then pirates could start writing code to steal information from other websites, and other such bad things.

JavaScript is a lightweight *interpreted* programming language. The web browser receives the JavaScript code in its original text form and runs the script from that. From a technical standpoint, most modern JavaScript interpreters actually use a technique called **just-in-time compiling** to improve performance of interpreted language; the JavaScript source code gets compiled into a faster, binary format while the script is being used, so that it can be run as quickly as possible. However, *JavaScript is still considered an interpreted language, since the compilation is handled at run time, rather than ahead of time.*


>Variables can contain letters, numbers and underscore(_ ), dollar-$

VALUE - OBJECT OR PRIMITIVE

Object:
let me = {
name: 'Jonas'
}

Primitive:
let firstName = 'Jonas';
let age = 30;

## 7 primitive data types

Number, String, Boolean, Undefined, Null, Symbol, BigInt

Undefined is a data type in JavaScript used to represent a variable that hasn't been assigned any value yet.

In JavaScript, the `undefined` value is reserved as the default value when a variable is declared, while `null` means you intentionally assign an "empty" value for the variable.

>JavaScript treats `undefined` as the "default" empty value and `null` as the "intentional" empty value.

### Types of declaring variable - let, const, var

Var is function scoped. On the other hand let and const are block scoped.

If you can't do as much with `const` as you can with `let`, why would you prefer to use it rather than `let`? In fact `const` is very useful. If you use `const` to name a value, it tells anyone looking at your code that this name will never be assigned to a different value.
### Type coercion

In JavaScript, type coercion is a process where a value of one type is implicitly converted into another type.

This is *automatically done by JavaScript* so that your code won't cause an error. But as you'll see in this section, type coercion can actually cause undesired behaviour in the program.

```js
1 + "1" // "11"
[1 ,2] + "1" // "1,21"
true + "1" // "true1"

true + 1 // 1+1 = 2
false + 1 // 0+1 = 1
[1,2] + 1 // "1,21"
```

But the order of the values matters when you have an object. Writing objects first always returns numeric `1`:

```js
{ a: 1 } + "1" // 1
"1" + { a: 1 } // "1[object Object]"
true + { a: 1 } // "true[object Object]"
{ a: 1 } + 1 // 1
```

Precedence of operators from mdn 

history of javascript

## Behind the scenes of JavaScript

### High-level 

Developer does not have to manage low level things like memory management. It will be done by the language.
### Garbage-collected

Automatically frees up the space by removing unused memory locations.
### Interpreted or just-in-time compiled


### Multi-paradigm

### Prototype-based object-oriented

![[Pasted image 20240103160231.png]]

### First-class functions 
https://developer.mozilla.org/en-US/docs/Glossary/First-class_Function

Functions are treated just as variables. For example, a function can be passed as an argument to other functions, can be returned by another function and can be assigned as a value to a variable.
### Dynamic

datatype of variable is dynamic, we don't manually need to mention the datatype of the variable.
### Single-threaded

JavaScript runs in one single thread i.e., it can do only one task at a time.

concurrency model-
### Non-blocking event loop

Using event loops, can execute long running tasks in background. JavaScript is single-threaded, meaning it can only execute one operation at a time. To handle asynchronous operations, JavaScript uses an event loop. Asynchronous tasks, like fetching data or handling user input, are offloaded to the browser's APIs. When the task is completed, it's placed in the callback queue. The event loop continuously checks the callback queue and, if the call stack is empty, moves tasks from the queue to the call stack for execution.

## JavaScript engine and runtime

JS engine : program that executes javascript code. each browser has its own js engine.
it has *call stack and heap*. Browsers have a JavaScript engine (like V8 in Chrome or SpiderMonkey in Firefox) responsible for interpreting and executing the JavaScript code.

### Modern just in time compilation of JS

![[Pasted image 20240103161322.png]]

#### AST - Abstract Syntax Tree

AST is a tree-like data structure where each node represents an element of the code's syntax. The tree is abstract because it discards certain details present in the actual source code, focusing on the essential structure.

**EXECUTION CONTEXT** - Environment in which a piece of JavaScript is executed. Stores all the necessary information for some code to be executed. It includes variables, functions, and the scope chain.

When JavaScript code is executed, the JavaScript engine creates an execution context for that code. There are two main types of execution contexts:

a. **Global Execution Context:**
- Created for the entire script, representing the global scope.
- It's the default context, and there is only one global execution context in a program.
- Includes global variables and functions.
- Exists as long as the script is running.

b. **Function Execution Context:**
- Created each time a function is called.
- Represents the local scope of the function.
- Includes parameters, local variables, and inner functions.
- Exists as long as the function is being executed.

**Exactly one global execution context (EC)**: Default context, created for code that is not
inside any function (top-level).

**One execution context per function**: For each function call, a new execution context is created.

### Scope Chain

JS has 3 types of scopes - Global, Function and Block scope.

> The order of function calls does not affect the scope chain

![[Pasted image 20240104195021.png]]

Variables are not copied in the lower blocks. lower blocks can search for them in the upper blocks i.e. called variable look-up.

![[Pasted image 20240104195635.png]]

## Hoisting

JavaScript interpreter splits the declaration and assignment of functions and variables: it "hoists" your declarations to the top of their containing scope before execution.

This process is called hoisting, and it allows us to use variables/functions before its declaration.

Variables declared with `let` and `const` are hoisted but not initialised with a default value. Variables declared with `var` are initialised with undefined. Accessing a `let` or `const` variable before it's declared will result in a `ReferenceError` but no error in case of `var`.

```js
//Working of hoisting
 
console.log(me); //Output->undefined
console.log(age); //Output->error not defined
console.log(birthYear); //Output->error not defined

var me = `maitry`;
let age = 20;
const birthYear = 2003;

console.log(dcl()); //Output->works
console.log(expr); //Output->undefined and reference error if const

//if var then just undefined
console.log(arrow()); //Output->undefined and reference error if const
//if var then just undefined

function dcl() {
console.log(`function declaration`);
}

var expr = function () {
console.log(`function expression`);
};  

const arrow = () => {
console.log(`arrow function`);
};
```

### The temporal dead zone

The reason that we get a reference error when we try to access a `let` or `const` variable before its declaration is because of the temporal dead zone (TDZ).

The TDZ starts at the beginning of the variable's enclosing scope and ends when it is declared. Accessing the variable in this TDZ throws a `ReferenceError`.

```js
{
 	// Start of foo's TDZ
  	let bar = 'bar';
	console.log(bar); // "bar"

	console.log(foo); // ReferenceError because we're in the TDZ

	let foo = 'foo';  // End of foo's TDZ
}
```

## This keyword

```js
//This keyword

console.log(this); //Output->window object in browser

const foo = function (a, b) {
console.log(this); //output->undefined
return a + b;
};

//arrow functions do not have this keyword
const arrow = (a, b) => {
console.log(this); //output->window obj i.e this of parent's scope
return a + b;
};

const jonas = {
year: 1991,
calcAge: function () {
console.log(this);  
console.log(2037 - this.year);
},
};

jonas.calcAge(); //output-> jonas object

const matilda = {
year: 2017,
};

matilda.calcAge = jonas.calcAge;
matilda.calcAge(); //output->matilda object

const f = jonas.calcAge;
f(); //output->undefined and error for undfined.year line
```

### Regular functions vs Arrow functions

```js
var firstName='maitry';

//arrow functions do not have this keyword so this will be equal to parent's this
const arrow = (a, b) => {
console.log(this.firstName); //output->maitry
return a + b;
};
```

Read more differences from - https://github.com/jonasschmedtmann/complete-javascript-course/blob/master/08-Behind-the-Scenes/final/script.js#L129C41-L129C41

### Arguments keyword 

```js
// arguments keyword
const addExpr = function (a, b) {
  console.log(arguments);
  return a + b;
};
addExpr(2, 5);
addExpr(2, 5, 8, 12);  //works fine prints the array of args

var addArrow = (a, b) => {
  console.log(arguments);
  return a + b;
};
addArrow(2, 5, 8);  //error: arguments is not defined
```

## Destructuring Arrays and Objects

Came with ES6. we can extract data from arrays and objects and assign them to variables.

```javascript
let person = {name: "Sarah", country: "Nigeria", job: "Developer"}; 
let name, country, job;

{name, country, job} = person;

console.log(name);// Error : "Unexpected token ="
```

The `( )` around the assignment statement is required syntax when using the object literal destructuring assignment without a declaration. This is because the `{}` on the left hand side is considered a block and not an object literal. So here's how to do this the right way:

```javascript
let person = {name: "Sarah", country: "Nigeria", job: "Developer"};
let name, country, job;

({name, country, job} = person);  //semicolon required otherwise it might be used to execute a function from the previous line.

console.log(name);//"Sarah"
console.log(job);//"Developer"
```

Computed property name is another object literal feature that also works for destructuring. You can specify the name of a property via an expression if you put it in square brackets:

```javascript
let prop = "name";

let {[prop] : foo} = {name: "Sarah", country: "Nigeria", job: "Developer"};

console.log(foo);//"Sarah"
```

### Spread operator

Works on all iterables but not on objects

### The Rest pattern and parameters

Rest pattern has same syntax as spread operator but for destruction it is used on the left side of = operator.

Values are copied into a new object

it is used as last argument and there can be only one rest pattern.

### Optional chaining

```javascript
// Optional Chaining
if (restaurant.openingHours && restaurant.openingHours.mon)
  console.log(restaurant.openingHours.mon.open);

// console.log(restaurant.openingHours.mon.open);

// WITH optional chaining
console.log(restaurant.openingHours.mon?.open);
console.log(restaurant.openingHours?.mon?.open);
```

### Nullish Operator

```javascript
// The Nullish Coalescing Operator
restaurant.numGuests = 0;
const guests = restaurant.numGuests || 10;
console.log(guests);

// Nullish: null and undefined (NOT 0 or '')
const guestCorrect = restaurant.numGuests ?? 10;
console.log(guestCorrect);
```

### Enhanced object literals

A set of features that make working with objects in JavaScript *more concise* and expressive.
### String primitives methods

slice() method, split(), join(), pasStart(), padEnd(), replace(), repeat()

## Closer look at functions

JavaScript does not pass by reference.

### First class and higher order functions

A programming language is said to have First-class functions **if functions in that language are treated like other variables**. So the functions can be assigned to any other variable or passed as an argument or can be returned by another function. JavaScript treats function as a first-class citizen.

Higher order functions are **functions that take one or more functions as arguments, or return a function as their result**.

benefit of higher order functions - abstraction

for 
#### call() Method

The call() method *calls the function directly* and sets **this** to the first argument passed to the call method and if any other sequences of arguments preceding the first argument are passed to the call method then they are passed as an argument to the function.

```js
Syntax:

call(objectInstance)
call(objectInstance, arg1, /* …, */ argN)
```
#### apply() Method

The apply() method calls the function directly and sets **this** to the first argument passed to the apply method and if any other arguments provided as an array are passed to the call method then they are passed as an argument to the function.

```js
Syntax:

apply(objectInstance)
apply(objectInstance, argsArray)
```
#### Bind() Method

The bind() method creates a new function and when that new function is called it set **this** keyword to the first argument which is passed to the bind method, and if any other sequences of arguments preceding the first argument are passed to the bind method then they are passed as an argument to the new function when the new function is called.

```js
Syntax:
const newFunction = oldFunction.bind(thisArg, arg1, ag2, ..., argN)

//bind method
const indigo = buyTicket.bind(airline,45,7890,'kio');
indigo(4, 6789, `Jeel Patel`); //this arguments passed are of no meaning as we have already given the values with bind method
```
### Immediately invoked function expression

Functions that are executed as soon as they are mounted, these functions are known as Immediately Invoked Function Expressions or IIFEs.

```js
(function (){ 
// Function Logic Here. 
})();
```

1. IIFEs have their own scope i.e. the variables you declare in the Function Expression will not be available outside the function.
2. Similarly to other functions IIFEs can also be named or anonymous, but even if an IIFE does have a name it is impossible to refer/invoke it.
3. IIFEs can also have parameters.
why do we need this? - It is used to execute the async and await function
- It is used in JQuery Library
- It is used to work with require function
not used much

```js
// Immediately Invoked Function Expressions (IIFE)
const runOnce = function () {
console.log('This will never run again');
};

runOnce();

// IIFE
(function () {
console.log('This will never run again');
const isPrivate = 23;
})();

// console.log(isPrivate);
(() => console.log('This will ALSO never run again'))();
```

### Closures

A function always has access to the variables environment of the execution context in which it was created even after the execution context of the outer function is popped out from the stack.

Closure: Variable environment attached to the function, exactly as it was at the time and place the function was created.
A closure makes sure that a function doesn't loose connection to variables that existed at the function's birth place.

JavaScript automatically does closure, we don't have to do anything explicitly.