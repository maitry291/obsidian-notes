
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

Why do we need this? - It is used to execute the async and await function
- It is used in jQuery Library
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

## Array methods
### ForEach method for array, map and set

### Map, filter, reduce, find

map method returns new array by computations provided.

```js
acc.userName = acc.owner
.toLowerCase()
.split(' ')
.map(name => name[0]). //map method returns array of first letter
.join('');
```

filter method makes array by filtering out according to the provided conditions i.e the array returned by filter method only contains elements which satisfies the condition in the function of filter method

```js
const withdrawals = account1.movements.filter(mov => mov < 0);
console.log(withdrawals);  //[-400, -650, -130]
```

reduce method has first parameter accumulator which stores all the results from array according to given statements. In below example `accum` stores the sum of the array elements

```js
const calcBalance = function (movements) {
const balance = account1.movements.reduce((accum, curr) => accum + curr, 0);
labelBalance.textContent=`Rs. ${balance}`;
};
```

find method returns the first element which meets the condition.

```js
currAcc = accounts.find(acc => acc.userName === userName);
```

findindex, some, every methods

```js
const arr = [[1, 2, 3], [4, 5, 6], 7, 8];
console.log(arr.flat());

const arrDeep = [[[1, 2], 3], [4, [5, 6]], 7, 8];
console.log(arrDeep.flat(2));  //depth 2
```

flatmap method only goes to 1 level of depth if we need to go more deep then we still need to use map and then do flat().

```js
// flat
const overalBalance = accounts
.map(acc => acc.movements)
.flat()
.reduce((acc, mov) => acc + mov, 0);

console.log(overalBalance);

// flatMap
const overalBalance2 = accounts
.flatMap(acc => acc.movements)
.reduce((acc, mov) => acc + mov, 0);

console.log(overalBalance2);
```

### sort()
mutates the original array, sorting is based on string data type i.e numbers are also sorted by converting them to strings.

```js
// Sorting Arrays

// Strings
const owners = ['Jonas', 'Zach', 'Adam', 'Martha'];
console.log(owners.sort());
console.log(owners);

// Numbers
console.log(movements);
// return < 0, A, B (keep order)
// return > 0, B, A (switch order)
  
// Ascending
// movements.sort((a, b) => {
// if (a > b) return 1;
// if (a < b) return -1;
// });

movements.sort((a, b) => a - b);
console.log(movements);

// Descending
movements.sort((a, b) => b - a);
console.log(movements);
```

### All Array methods

![[Pasted image 20240113014626.png]]

## Numbers in JS

stored in binary i.e. in 0's and 1's 64-bits

### Conversion

```js
console.log(+'t'); //NaN as Javascript behind the scenes does the type coersion which converts 't' to number as it has operator + before

console.log(+'56.7'); //this works fine-converts string '56.7 to number 56.7
```

### Parsing, isNaN(), isFinite()

```js
//parsing
console.log(Number.parseInt(' 30px ')); //30
console.log(Number.parseInt('e30px')); //NaN
console.log(Number.parseFloat('3.40px')); //3.4

console.log(Number.isNaN(20)); //false
console.log(Number.isNaN(+'2e')); //true - it is NaN

//checking value is a number
console.log(Number.isFinite(2)); //true
console.log(Number.isFinite('2')); //false
```

### Numeric separator __

used between numbers only. string with numeric separator can't be converted to numbers.
use of `_` before and after `.` also not allowed. 
use of `_` in start and end of the numbers also not allowed

### BigInt primitive datatype

### Date formatting



#### Intl - Internationalisation API

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl

## Advanced DOM

Document Object model is an API that allows JavaScript to interact with a web browser.

We can write JavaScript to create, modify and delete HTML elements, set styles, classes and attributes, and listen and respond to events.

DOM tree is generated from an HTML document, which we can then interact with.

![[Pasted image 20240122151248.png]]

DOM is a very complex API that contains lots of methods and properties to interact with the DOM tree.

**The HTML DOM is a standard for how to get, change, add, or delete HTML elements.**

Behind the scenes, DOM creates node-object for every html element. There are already defined html elements and their properties. Inheritance is also used to provide many properties and methods.

Any HTML element will have access to addEventListener (), cloneNode () or closest () methods.

![[Pasted image 20240122152953.png]]

### addEventListener()

```js
Syntax: element.addEventListener(event, function, useCapture);
```

The third parameter is a boolean value specifying whether to use event bubbling or event capturing. This parameter is optional.

When events occur in JavaScript, an object that contains information about that event gets created. This object will then be passed as an argument to the event handler function.

An event can be called by different actions. Examples are clicks, mouse movements, and time intervals.

An event handler is any function or method specifically define to respond to a specific event in JavaScript. It is also responsible for the execution of code when a particular event occurs.

### Event flow in DOM

#### Event Propagation

Event propagation is a way of defining the element order when an event occurs. If you have a  `<p>` element inside a `<div>` element, and the user clicks on the `<p>` element, which element's "click" event should be handled first?

In _bubbling_ the inner most element's event is handled first and then the outer: the `<p>`element's click event is handled first, then the `<div>` element's click event.

In _capturing_ the outer most element's event is handled first and then the inner: the `<div>` element's click event will be handled first, then the `<p>` element's click event.

With the addEventListener() method you can specify the propagation type by using the "useCapture" parameter.

Three Phases - capturing, the target, and the bubbling phase

![[Pasted image 20240131190102.png]]

- bubbling can be stopped using the `stopPropagation()` method on the event object. It's useful when you aim to prevent event handlers from the ancestor elements triggered.

*Event capturing can't happen until the third argument of `addEventListener` is set to the `Boolean` value of true as shown below (default value is false).*

- The default value is false, which will use the bubbling propagation, when the value is set to true, the event uses the capturing propagation.

By default, **all event handlers are registered in the bubbling phase** (from the target element to all its ancestor elements). This default configuration can be modified by adding the `event.stopPropagation` method to the target element.

#### Event delegation

 It makes it easier to manage and handle events on multiple child elements. It takes advantage of the `DOM` (Document Object Model) *bubbling event*. This means setting event listeners on ancestor elements allows you to handle events efficiently.

Unlike setting event listeners on individual elements that trigger the events. Recall that in the bubbling phase, the events on the child element rise to their parent element.
### Intersection Observer API

Intersection Observer API can be used to observe an element. This API takes two inputs:
- A **Callback function:** This function receives a list of entries (elements) that are to be observed by an ancestor or document viewport. This list of entries has the property **isIntersecting** which can be used to determine if the target entry is visible or not. If this property returns true then it means the target is visible else it’s not.
- An object with properties **root, threshold,** and **rootMargin.**
    - **root** property is used to tell the element that is used as the viewport for checking the visibility of the target element and it must be the ancestor of the target element, and if not specified then document viewport is the default value.
    - **threshold** property can be a number or an array of numbers. It is used to tell how much of the target element should be visible when the above callback function gets triggered. For example, if the **threshold** is 0.5, then the callback function will be triggered when half of the target element is visible in the viewport and if the **threshold** is [0.5,0.25] then when the target element’s half and one-fourth part is visible then the callback function will be triggered. The default is 0 which means as soon as the target element is visible the callback function will be triggered.
    - **rootMargin** property is the same as the CSS’s **margin** property which can take either one value(applicable to all four margins) or multiple values for the individual margins. This property can be used to grow or shrink the container viewport. For example, if **rootMargin** is 20px the viewport will be 20px larger so once the target element is 20px from being within the viewport it will be considered intersecting. The default value is 0 for the margins.

This API returns an object which has a property **observe** which can be used to observe our desired target element.

`isIntersecting` parameter tells that the observing element is visible on the viewport/root or not according to the provided threshold value.

### Script loading ways

![[Pasted image 20240202204644.png]]

![[Pasted image 20240202204949.png]]

## Object Oriented Programming

There are no classes in JavaScript. Instead js have *Prototypes* which contains methods.
Objects are linked to a prototype object.
`Prototypal inheritance`: The prototype contains methods (behaviour) that are accessible to all objects linked to that prototype;

### 3 ways of implementing prototypal inheritance in JS

#### 1. Constructor functions

- Technique to create objects from a function.
- This is how built-in objects like Arrays, Maps or Sets are actually implemented.
```js
const Person = function (firstName, birthYear) {
	console.log(this); //prints the newly created empty object {}
	this.firstName = firstName;
	this.birthYear = birthYear;
};

const me = new Person('Maitry', 2003);
console.log(me);
//1. new object{} is created
//2. function is called and this is assigned to newly created object
//3. object{} linked to prototype
//4. function automatically return object/{}

console.log(me instanceof Person); //true

//prototypal inheritance
Person.prototype.calcAge = function () {
	console.log(2024 - this.birthYear);
};
me.calcAge();

Person.prototype.species = 'Homo Sapiens';
console.log(me.__proto__); //{species: 'Homo Sapiens', calcAge: ƒ, constructor: ƒ}
console.log(me.__proto__.__proto__); //object prototype
console.log(me.__proto__.__proto__.__proto__); //null
```

![[Pasted image 20240203161314.png]]

#### 2. ES6 classes
behind the scenes classes are still functions.

- Modern alternative to constructor function syntax.
- "Syntactic sugar": behind the scenes, ES classes work exactly like constructor functions.
- ES6 classes do NOT behave like classes in "classical OOP" (last lecture).
#### 3. Object.create()

- The easiest and most straightforward way of linking an object to a prototype object.