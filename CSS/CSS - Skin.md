*Cascading Style Sheets* - does the job of how the website will look like -> styling or presentation

Acting as the stylistic layer of the web, CSS empowers developers to control the layout, presentation, and design of HTML elements. Through a system of selectors, properties, and values, CSS enables the separation of content and presentation, providing a modular and maintainable approach to crafting engaging user interfaces. From responsive design principles to advanced layout models like Flex-box and Grid, CSS offers a versatile toolkit for creating visually appealing, responsive, and interactive web pages.

## Box Model

In CSS, the terms "intrinsic size" and "extrinsic size" refer to the sizing of elements in relation to their content, container, or other external factors.

### Intrinsic Size

**Definition:** The intrinsic size of an element is *determined by its content*, and it is inherent to the nature of the element itself.

**Example:** For an image, the intrinsic size is its natural width and height in pixels, which is based on the image file's dimensions. For a block of text, the intrinsic size is influenced by the amount of text content and the font size.

### Extrinsic Size

**Definition:** The extrinsic size of an element is determined by factors external to the element, such as its container or parent context.

**Example:** A container div might have an extrinsic size set by its parent or by specific width and height properties. The size of a child element can be extrinsic if it's specified in percentage units or in relation to the dimensions of its containing block.

![[Pasted image 20231214181409.png]]

It visualizes each HTML element as a rectangular box with content, padding, border, and margin areas.

When you set the `width` and `height` properties of an element, *they apply to the content area*. The total space occupied by the element, including padding, border, and margin, is calculated as follows:

```
Total width = width + padding-left + padding-right + border-left + border-right + margin-left + margin-right 

Total height = height + padding-top + padding-bottom + border-top + border-bottom + margin-top + margin-bottom
```

It is important to note that the box model can be influenced by the **`box-sizing`** property, which determines whether the `width` and `height` properties include or exclude padding and border. The default value is `box-sizing: content-box`, where only the content size is considered. An alternative is `box-sizing: border-box`, where padding and border are included in the specified width and height.

Example of `box-sizing`:

```css
/* Apply border-box to include padding and border in the total width and height */ 
.element {     
	box-sizing: border-box;     
	width: 100px; /* This includes padding and border */     
	padding: 10px;
	border: 2px solid #000; 
}
```

## Selectors

Selectors in CSS are patterns used to select and style HTML elements. They define which elements in an HTML document should be styled by the associated rules. Selectors can target elements based on various criteria, such as element type, class, ID, attributes, and their relationship with other elements.

![[Pasted image 20231214202324.png]]

### Universal selector

A [universal selector](https://developer.mozilla.org/docs/Web/CSS/Universal_selectors)—also known as a wildcard—matches any element.

```
* {  color: hotpink;}
```

This rule causes every HTML element on the page to have hotpink text.

### Type Selector

    - Selects all instances of a specific HTML element type.
    - Example: Select all `<p>` (paragraph) elements.
```css
    p {     
	    /* Styles for paragraphs */ 
    }
```
        
### Class Selector

    - Selects elements based on their class attribute.
    - Example: Select all elements with the class "example."
```css
.example {     
	/* Styles for elements with the class "example" */
}
```
        
### ID Selector

    - Selects a single element based on its ID attribute.
    - Note: While IDs are unique, using classes is often more flexible and encouraged for styling.
    - Example: Select the element with the ID "header."
```css
#header {    
	/* Styles for the element with the ID "header" */ 
}
```

### Descendant Selector

    - Selects an element that is a descendant of another specified element.
    - Example: Select all `<a>` (anchor) elements that are descendants of `<li>` (list item) elements.
```css
li a {    
	/* Styles for anchor elements inside list items */ 
}
```

### Child Selector

    - Selects an element that is a direct child of another specified element.
    - Example: Select all `<span>` elements that are direct children of `<div>` elements.
```css
div > span {     
	/* Styles for span elements that are direct children of div elements */ 
}
```
        
### Adjacent Sibling Selector

    - Selects an element that is an immediate sibling of another specified element.
    - Example: Select all `<p>` elements that are immediately followed by an `<h2>` element.
```css
p + h2 {    
	/* Styles for h2 elements that are immediately preceded by p elements */ 
} 
```
        
### Attribute Selector

    - Selects elements based on the presence or value of their attributes.
    - Example: Select all `<input>` elements with a "type" attribute of "text."
```css
input[type="text"] {     
	/* Styles for text input elements */ 
}
```
        
### Pseudo-Classes

    - Selects elements based on their state or position.
    - Example: Select the first child of a `<ul>` element.
```css
ul li:first-child {     
	 /* Styles for the first li element within a ul */ 
}
```

### Pseudo-Elements

    - Selects a specific part of an element, such as the first line or first letter.
    - Example: Style the first line of a paragraph.
```css
p::first-line {     
	/* Styles for the first line of paragraphs */ 
}
```

### Compound selectors

You can combine selectors to increase specificity and readability. For example, to target `<a>` elements, that also have a class of `.my-class`, write the following:

```
a.my-class {  color: red;}
```

This wouldn't apply a red color to all links and it would also only apply the red color to `.my-class` **if** it was on an `<a>` element.

## Specificity

Specificity in CSS is a mechanism that determines which styles should be applied to an element when multiple conflicting style rules exist. It defines the weight or importance of a style rule and helps the browser decide which styles to prioritise when rendering a web page.

### Specificity Hierarchy

The specificity of a selector is represented by a four-part value:

1. **Inline Styles:**
    - Inline styles are styles applied directly to an HTML element using the `style` attribute. They have the highest specificity.
    - Example: `<div style="color: red;">...</div>`
2. **ID Selectors:**
    - Selectors with an ID have higher specificity than other types of selectors.
    - Example: `#header { color: blue; }`
3. **Class Selectors, Attribute Selectors, and Pseudo-Classes:**
    - Class selectors, attribute selectors, and pseudo-classes have the same specificity.
    - Example: `.container { background: gray; }`, `[type="submit"] { font-weight: bold; }`, `:hover { text-decoration: underline; }`
4. **Type Selectors and Pseudo-Elements:**
    - Type selectors (element names) and pseudo-elements have the lowest specificity.
    - Example: `p { font-size: 16px; }`, `::before { content: "Before"; }`

### Specificity Calculation:

- `a, b, c, d` represent the four components of specificity: inline styles, ID selectors, class/attribute/pseudo-class selectors, and type/pseudo-element selectors.
- The specificity value is expressed as a four-digit number, for example, `0010` or `0123`.
- The higher the number, the higher the specificity.

### Examples:

1. **Inline Style vs. ID Selector:**
```css
#header { color: blue; } /* Specificity: 0100 */ 

<div style="color: red;">...</div> <!-- Specificity: 1000 (Inline style) -->
```
    
 The inline style takes precedence because its specificity is higher.
    
2. **ID Selector vs. Class Selector:**
    
```css
#header { color: blue; } /* Specificity: 0100 */ 
.header { color: red; } /* Specificity: 0010 */ 

<div class="header">...</div> <!-- Specificity: 0010 (Class selector) -->
```
    
The ID selector takes precedence due to its higher specificity.

### Important Considerations:

- Specificity is cumulative. If two selectors have equal specificity, the one declared later in the stylesheet takes precedence due to the cascade.
- Avoid relying on high specificity for styling. Instead, prefer using well-structured, readable, and maintainable CSS.
- Overusing `!important` can lead to specificity issues and make debugging challenging.

## Styling Types

In HTML, there are several ways to apply CSS styling to elements. 
### Inline Styles

- Apply styles directly to individual HTML elements using the `style` attribute.
```html
<p style="color: blue; font-size: 16px;">This is a blue paragraph.</p>
```
### Internal Styles (Embedded Styles)

- Include styles within the `<style>` element in the document's `<head>` section.
```html
<!DOCTYPE html> 
<html lang="en"> 
<head>     
	<meta charset="UTF-8">     
	<meta name="viewport" content="width=device-width, initial-scale=1.0">     <style>        
		p {             
		color: green;             
		font-size: 18px;         
		}
	</style>     
	<title>Internal Styles Example</title> 
</head> 
<body>
	<p>This is a green paragraph.</p> 
</body> 
</html>
```
        
### External Styles (Linked Styles)

- Link to an external CSS file using the `<link>` element in the `<head>` section.
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>External Styles Example</title>
</head>
<body>
    <p class="styled-paragraph">This paragraph is styled externally.</p>
</body>
</html>
```

*In style.css*

```css
.styled-paragraph {
    color: purple;
    font-size: 20px;
}
```

## Colors

In CSS, colors can be specified using various formats to define the visual appearance of elements. 

1. **Keyword Colors:**
- CSS supports a set of predefined color keywords, such as `red`, `blue`, `green`, `yellow`, etc.
```css
p {
    color: red;
    background-color: lightblue;
}
```


## Position Property

In CSS, the `position` property is used to control the positioning of an element within its containing element. It works in conjunction with other properties like `top`, `right`, `bottom`, and `left` to precisely place an element on the page. 

1. **`static`:**
    - This is the default value. An element with `position: static;` is positioned according to the normal flow of the document.
    - The `top`, `right`, `bottom`, and `left` properties *have no effect* on a statically positioned element.
    `.static-example {     position: static; }`
2. **`relative`:**
    - An element with `position: relative;` is positioned *relative to its normal position* in the document flow.
    - Using `top`, `right`, `bottom`, or `left` will shift the element from its normal position, but the space it originally occupied is still reserved.
    `.relative-example {     position: relative;     top: 10px;     left: 20px; }`
3. **`absolute`:**
    - An element with `position: absolute;` is positioned *relative to the nearest positioned (not static) ancestor*.
    - If there is no such ancestor, it's positioned relative to the initial containing block (usually the `<body>` element).
    - Absolute positioning takes the element out of the normal document flow.
    `.absolute-example {     position: absolute;     top: 50px;     left: 30px; }`
4. **`fixed`:**
    - An element with `position: fixed;` is positioned relative to the browser window, and it stays in the same place even when the page is scrolled.
    - Fixed positioning also takes the element out of the normal document flow.

    `.fixed-example {     position: fixed;     top: 10px;     right: 10px; }`
5. **`sticky`:**
    - An element with `position: sticky;` is a hybrid of `relative` and `fixed`. It is treated as `relative` positioned until it crosses a specified point during scrolling, after which it is treated as `fixed`.
    - The `top`, `right`, `bottom`, or `left` values are used to determine when the element becomes "sticky."
    `.sticky-example {     position: sticky;     top: 20px; }`
### When to Use

- **Relative Positioning:**
    - Use `position: relative;` when you want to move an element from its normal position but still want it to affect the layout of surrounding elements.
- **Absolute Positioning:**
    - Use `position: absolute;` when you want to take an element out of the normal document flow and position it precisely relative to its containing block.

## CSS- transform

CSS transforms provide a way to manipulate the position, size, and orientation of elements in the document. *Transforms do not affect the layout of the document flow*; instead, they alter the visual rendering of elements. 
### Transform Functions

1. **`translate()` Function:**
    
    - Moves an element from its current position in the horizontal and/or vertical direction.
    - Example: `transform: translate(20px, 30px);`
2. **`rotate()` Function:**
    
    - Rotates an element by a specified angle.
    - Example: `transform: rotate(45deg);`
3. **`scale()` Function:**
    
    - Changes the size of an element by a specified scale factor.
    - Example: `transform: scale(1.5);`
4. **`skew()` Function:**
    
    - Skews an element by a specified angle in the horizontal and/or vertical direction.
    - Example: `transform: skew(30deg, 0);`
5. **`matrix()` Function:**
    
    - Allows combining multiple transformations into a single function using a 6-value matrix.
    - Example: `transform: matrix(1, 0.5, -0.5, 1, 0, 0);`

### Transform Properties

1. **`transform-origin` Property:**
    
    - Specifies the point around which a transformation is applied. It defines the origin of the transformation.
    - Example: `transform-origin: 50% 50%;`
2. **`transform-style` Property:**
    
    - Defines how nested elements are rendered in 3D space. It can be set to `flat` (the default) or `preserve-3d`.
    - Example: `transform-style: preserve-3d;`

### 3D Transforms

CSS transforms can also be applied in 3D space, allowing for more complex visual effects. This involves using functions like `translate3d()`, `rotate3d()`, and `matrix3d()`.

`.three-d-transform-example {     transform: perspective(500px) rotateX(45deg) rotateY(45deg); }`

## FlexBox

Flex box, or the Flexible Box Layout, is a powerful layout model in CSS that allows you to design complex and flexible layouts with ease. Here are the main properties associated with Flex-box, categorised by whether they apply to the container (parent) or the items (children).

### Properties for the Container (Parent)

1. **`display` (Container):**
    - **Value:** `flex` or `inline-flex`
    - **Description:** Defines a flex container. The `flex` value establishes a block-level flex container, while `inline-flex` establishes an inline-level flex container.
    `.flex-container {     display: flex; }`
    
1. **`flex-direction`:**
    - **Values:** `row`, `row-reverse`, `column`, `column-reverse`
    - **Description:** Specifies the direction of the main axis, determining the direction in which the flex items are placed.
    `.flex-container {     flex-direction: row; }`
    
3. **`flex-wrap`:**
    - **Values:** `nowrap`, `wrap`, `wrap-reverse`
    - **Description:** Controls whether the flex container is a single-line or multi-line layout.
    `.flex-container {     flex-wrap: wrap; }`
    
4. **`flex-flow`:**
    - **Values:** Combination of `flex-direction` and `flex-wrap`
    - **Description:** Shorthand for setting both `flex-direction` and `flex-wrap` in a single property.
    `.flex-container {     flex-flow: row wrap; }`
    
5. **`justify-content`:**
    - **Values:** `flex-start`, `flex-end`, `center`, `space-between`, `space-around`, `space-evenly`
    - **Description:** Aligns flex items along the main axis of the flex container.
    `.flex-container {     justify-content: center; }`
    
6. **`align-items`:**
    - **Values:** `flex-start`, `flex-end`, `center`, `baseline`, `stretch`
    - **Description:** Aligns flex items along the cross axis of the flex container.
    `.flex-container {     align-items: center; }`
    
7. **`align-content`:**
    - **Values:** `flex-start`, `flex-end`, `center`, `space-between`, `space-around`, `stretch`
    - **Description:** Aligns a flex container's lines within the flex container when there is extra space in the cross axis.
    `.flex-container {     align-content: space-between; }`

### Properties for the Items (Children)

1. **`order`:**
    - **Value:** Integer
    - **Description:** Specifies the order in which a flex item appears within the flex container. Lower values come first.
    `.flex-item {     order: 2; }`
    
2. **`flex`:**
    - **Value:** Combination of `flex-grow`, `flex-shrink`, and `flex-basis`
    - **Description:** Shorthand for setting all three `flex` properties in a single property.
    `.flex-item {     flex: 1 0 auto; }`
    
3. **`flex-grow`:**
    - **Value:** Number
    - **Description:** Specifies the ability of a flex item to grow if necessary.
    `.flex-item {     flex-grow: 2; }`
    
4. **`flex-shrink`:**
    - **Value:** Number
    - **Description:** Specifies the ability of a flex item to shrink if necessary.
    `.flex-item {     flex-shrink: 1; }`
    
5. **`flex-basis`:**
    - **Value:** Length, percentage, or `auto`
    - **Description:** Specifies the initial size of a flex item before any remaining space is distributed.
    `.flex-item {     flex-basis: 50%; }`
    
6. **`align-self`:**
    - **Values:** `auto`, `flex-start`, `flex-end`, `center`, `baseline`, `stretch`
    - **Description:** Allows the default alignment to be overridden for a specific flex item.
    `.flex-item {     align-self: flex-end; }`

## Grid


## Note

>In CSS, `::before` and `::after` are pseudo-elements that allow developers to insert content before or after the content of an element, *without the need for additional HTML* markup. These pseudo-elements are powerful tools for adding decorative elements, icons, or other styling to web page elements.
>
>The `content` property is crucial for `::before` and `::after` to generate content. It can take various values like text, images, or counters.



