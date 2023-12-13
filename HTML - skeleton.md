
HyperText Markup Language - it's not a programming language.. it is a **markup language** i.e it refers to the process of adding special notations or tags to a document to indicate the structure and formatting of the content.

**HyperText** (Linking between multiple pages of website) - refers to text that contains links or references to other pieces of text, often allowing users to navigate to related information by clicking on these links.

>HTML documents use markup (tags) to define the content's structure, and they can include hyperlinks to enable navigation between documents or sections.

## HTML Boilerplate

```html
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">      <title>Document</title> 
</head> 
<body> 

</body> 
</html>
```

`<!DOCTYPE html>` : It tells the browser that this document is written in HTML5 so that browser can render the document correctly.

`<html lang="en">`: Root element of HTML document.  The `lang="en"` specifies that document's primary language is English.

`<head>`: Contains meta-information about the HTML document.

`<meta charset="UTF-8">`: This meta tag sets the character encoding for the document to UTF-8. 

`<meta name="viewport" content="width=device-width, initial-scale=1.0">`: This meta tag is used for responsive web design. It sets the viewport width to the device width and establishes an initial zoom level of 1.0. 

## HTML Elements

HTML (HyperText Markup Language) elements are the building blocks of web pages. They define the structure and content of a document by using a set of tags that enclose the different parts of the content. 

### Basic Structure of an HTML Element:

An HTML element is typically composed of a **opening tag, content, and an closing tag**. 

```html
<tagname>Content goes here</tagname>
```

### Types of HTML Elements:

1. **Block-Level Elements:**
    - Start on a new line and take up the full width available.
    - Examples: `<div>`, `<p>`, `<h1>` to `<h6>`, `<ul>`, `<ol>`, `<li>`, etc.
2. **Inline Elements:**
    - Do not start on a new line and only take up as much width as necessary.
    - Examples: `<span>`, `<a>`, `<strong>`, `<em>`, `<img>`, etc.
3. **Text-Level Elements:**
    - Affect the styling of the text without changing the document structure.
    - Examples: `<strong>`, `<em>`, `<mark>`, `<del>`, `<ins>`, etc.
4. **Form Elements:**
    - Used to create interactive forms.
    - Examples: `<form>`, `<input>`, `<select>`, `<button>`, etc.
5. **Media Elements:**
    - Used for embedding multimedia content.
    - Examples: `<img>`, `<audio>`, `<video>`, etc.
6. **Table Elements:**
    - Used for creating tables.
    - Examples: `<table>`, `<tr>`, `<td>`, `<th>`, etc.
7. **Document Structure Elements:**
    - Used for specifying the overall document structure.
    - Examples: `<html>`, `<head>`, `<body>`, `<title>`, etc.

### Attributes:

HTML elements can also have attributes that provide additional information about the element. Attributes are added to the start tag and are typically name-value pairs.

```html
<tagname attribute="value">Content</tagname>
```

### Self-Closing Elements:

Some elements don't have a closing tag and are self-closing. They end with a forward slash before the closing angle bracket.

```html
<img src="image.jpg" alt="An example image">
```


## HTML Entities

HTML entities are special codes or sequences of characters used to represent reserved characters, special symbols, and characters with special meanings in HTML documents. Since HTML uses certain characters for its own syntax (like `<`, `>`, `&`, etc.), these characters need to be represented in a way that doesn't interfere with the HTML markup. HTML entities provide a standardised method for including special characters in HTML documents.

1. **Character Entities:**
    - `&lt;` represents the less-than sign `<`.
    - `&gt;` represents the greater-than sign `>`.
    - `&amp;` represents the ampersand `&`.
    - `&quot;` represents the double quotation mark `"`.
    
    Example:
   ```html
    <p>This is an example of &lt;p&gt; tag.</p>
   ```
    
2. **Special Characters:**
    - `&copy;` represents the copyright symbol ©.
    - `&reg;` represents the registered trademark symbol ®.
    - `&trade;` represents the trademark symbol ™.
    
    Example:
    ```html
    <p> &copy; 2023 My Company. All rights reserved.</p>
    ```
    
3. **Accented Characters:**
    - `&eacute;` represents the lowercase é.
    - `&Agrave;` represents the uppercase À.

4. **Mathematical Symbols:**
    - `&times;` represents the multiplication symbol ×.
    - `&divide;` represents the division symbol ÷.
    
    Example:
    ```html
    <p>5 &times; 3 = 15</p>
    ```
5. **Currency Symbols:**
    - `&euro;` represents the Euro symbol €.
    - `&dollar;` represents the dollar symbol $.

## HTML Semantics

HTML semantics refers to the meaningful use and interpretation of HTML elements to convey the structure and meaning of the content within a web page. Semantic HTML uses tags that carry inherent meaning about the type of content they contain, making the structure of the document more understandable for both developers and browsers. 

1. **Semantic Elements:**
    
    - Semantic elements are tags that carry meaning about the structure of the content they enclose. Examples include `<header>`, `<nav>`, `<main>`, `<article>`, `<section>`, `<aside>`, `<footer>`, `<figure>`, `<figcaption>`, `<mark>`, `<time>`, etc.
    - These elements convey specific roles or meanings to both developers and browsers, making it clear how different sections of the content are intended to be used.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Semantic HTML Example</title>
</head>
<body>

    <header>
        <h1>Website Title</h1>
        <nav>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <article>
            <h2>Article Title</h2>
            <p>This is the content of the article.</p>
        </article>
    </main>

    <aside>
        <h3>Related Links</h3>
        <ul>
            <li><a href="#">Link 1</a></li>
            <li><a href="#">Link 2</a></li>
            <li><a href="#">Link 3</a></li>
        </ul>
    </aside>

    <footer>
        <p>&copy; 2023 Website Name. All rights reserved.</p>
    </footer>

</body>
</html>

```
In this example, semantic elements like `<header>`, `<nav>`, `<main>`, `<article>`, `<aside>`, and `<footer>` are used to define the structure of the document and provide semantic meaning to different sections. This makes the code more readable and helps convey the intended purpose of each part of the webpage.

## HTML Form

HTML forms are a crucial part of web development, allowing users to interact with a webpage by submitting data to a server. Forms are used for various purposes, such as user authentication, data input, searches, and more. HTML provides a set of elements that allow you to create different types of form controls.

Here are the key components and attributes used in HTML forms:

1. **`<form>` Element: **
    - The `<form>` element is used to create an HTML form.
    - It can contain various form controls, such as text fields, checkboxes, radio buttons, buttons, and more.
    - The `action` attribute specifies the URL to which the form data will be submitted, and the `method` attribute defines the HTTP method (usually "GET" or "POST").
  ```html
  <form action="/submit" method="post">     
        <!-- Form controls go here -->    
  </form>
  ```
    
    
2. **Input Elements:**
    - The `<input>` element is used to create various types of form controls, such as text fields, checkboxes, radio buttons, and more.
    - The `type` attribute specifies the type of input control.
    
```html
<!-- Text Input -->
<input type="text" name="username" placeholder="Enter your username">

<!-- Checkbox -->
<input type="checkbox" name="subscribe" id="subscribe">
<label for="subscribe">Subscribe to newsletter</label>

<!-- Radio Buttons -->
<input type="radio" name="gender" value="male" id="male">
<label for="male">Male</label>
<input type="radio" name="gender" value="female" id="female">
<label for="female">Female</label>

 ```
    
3. **`<select>` Element:**
    - The `<select>` element is used to create a *dropdown list*.
    - It can contain one or more `<option>` elements to define the available options.
    
```html
   <select name="country">
    <option value="us">United States</option>
    <option value="ca">Canada</option>
    <option value="uk">United Kingdom</option>
</select>

```
    
4. **`<textarea>` Element:**
    
    - The `<textarea>` element is used to create a multiline text input.
```html
    <textarea name="message" rows="4" cols="50" placeholder="Enter your message">
    </textarea>
```
    
5. **Submit Button:**
    - The `<input>` element with `type="submit"` is used to create a submit button.
    - When clicked, it submits the form data to the specified URL.
```html
<input type="submit" value="Submit">
```
6. **Reset Button:**
    - The `<input>` element with `type="reset"` is used to create a reset button.
    - When clicked, it resets the form controls to their default values.
    
```html
<input type="reset" value="Reset">
```
    
7. **Form Attributes:**
    - The `action` attribute specifies the URL to which the form data will be submitted.
    - The `method` attribute defines the HTTP method used for the form submission (e.g., "GET" or "POST").
    - Other attributes include `enctype` (for specifying the content type of the form data), `target` (for specifying where to open the response after form submission), and more.
 ```html
 <form action="/submit" method="post" enctype="multipart/form-data" target="_blank">
    <!-- Form controls go here -->
</form>
```
    
8. **Form Control Attributes:**
    - Form controls can have various attributes like `name` (used to identify the form control in the submitted data), `value` (default value for the control), `placeholder` (text to display in the control when it's empty), and more.
    
```html
<input type="text" name="username" value="" placeholder="Enter your username">
```

>When a user submits a form, the data is typically sent to a server for processing. The server-side script (e.g., in PHP, Python, or Node.js) can then handle the form data and respond accordingly. Form validation can also be implemented using JavaScript or server-side scripts to ensure that the submitted data is accurate and secure.

## Tables

```html
<table>
    <!-- Table title -->
    <caption>Table Caption</caption>
    <thead>
        <tr>
            <th>Header 1</th>
            <th>Header 2</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Data 1</td>
            <td>Data 2</td>
        </tr>
        <!-- Additional rows go here -->
    </tbody>
</table>
```

To style tables using css:

```html
<style>
    table {
        border: 1px solid #ddd; /* Border around the table */
        border-collapse: collapse; /* Collapse borders into a single border */
        width: 100%; /* Set table width to 100% of its container */
    }
    th, td {
        border: 1px solid #ddd; /* Border for table cells */
        padding: 8px; /* Padding inside cells */
        text-align: left; /* Text alignment inside cells */
    }
</style>
```

### rowspan and colspan

To merge rows or columns this attributes are used in td or th tag.

The `rowspan` attribute determines the number of rows a cell should span vertically. It is used when a cell needs to cover more than one row.

The `colspan` attribute specifies the number of columns a cell should span horizontally. It is used when a cell needs to cover more than one column.

The `<colgroup>` element in HTML is used to group a set of `<col>` elements within a table. It allows you to apply common styling or attributes to multiple columns in a more organised and concise way. The `<colgroup>` element is often used in conjunction with the `<col>` element.

### `<colgroup>` Element:

- The `<colgroup>` element is a container for one or more `<col>` elements.
- It is typically placed inside the `<table>` element, before the `<thead>`, `<tbody>`, `<tfoot>`, and `<tr>` elements.

```html
<table>
  <colgroup>
    <col span="2" style="background-color: lightblue;">
    <col style="background-color: lightgreen;">
  </colgroup>
  <thead>
    <!-- Table headers go here -->
  </thead>
  <tbody>
    <!-- Table data rows go here -->
  </tbody>
</table>
```

### `<col>` Element:

- The `<col>` element defines the properties for one or more columns within a `<colgroup>`.
- It can be used to set styling or attributes that apply to all cells in a specific column.
### Note:

- `<col>` elements can be used without a `<colgroup>`, but using them within a `<colgroup>` provides a more organised structure.
- The `span` attribute of `<col>` specifies the number of columns that the `<col>` element should span.
