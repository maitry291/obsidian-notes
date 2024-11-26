In the react structure, the html file doesn't have any script tag because the react js code first gets transformed via some build tools as unprocessed react code has JSX which is not a default JS feature.

- **Named exports** can be imported by their exact names, using {}.
-  **Default exports** can be imported without {}, and you can name them anything.
- You can combine named and default imports, or import everything using *.

By using **import** and **export**, you can make your JavaScript code modular, more maintainable, and reusable across different files and applications. Import and export require type="module" in script tag in html file.

A file can only contain one default and an unlimited amount of named exports. You can also mix the one default with any amount of named exports in one and the same file.

When importing **named exports**, you can also import all named exports at once with the following syntax:

`import * as upToYou from './path/to/file.js';`

`upToYou`  is - well - up to you and simply bundles all exported variables/functions in one JavaScript object. For example, if you `export const someData = ...`  (`/path/to/file.js` ) you can access it on `upToYou`  like this: `upToYou.someData`
### Arrow function

 number => { age: number }; // trying to return an object

This code would be invalid because JavaScript treats the curly braces as **function body wrappers** (not as code that creates a JS object).

To _"tell"_ JavaScript that an object should be created (and returned) instead, the code would need to be adjusted like this:

1. number => ({ age: number }); // wrapping the object in extra parentheses

By wrapping the object and its curly braces with an **extra pair of parentheses**, JavaScript understands that the curly braces are not there to define a function body but instead to create an object. Hence that object then gets returned.