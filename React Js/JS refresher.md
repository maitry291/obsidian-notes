In the react structure, the html file doesn't have any script tag because the react js code first gets transformed via some build tools as unprocessed react code has JSX which is not a default JS feature.

- **Named exports** can be imported by their exact names, using {}.
-  **Default exports** can be imported without {}, and you can name them anything.
- You can combine named and default imports, or import everything using *.

By using **import** and **export**, you can make your JavaScript code modular, more maintainable, and reusable across different files and applications. Import and export require type="module" in script tag in html file.