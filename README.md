# Reproducible scientific manuscripts with R Markdown

There are many great resources for creating reproducible scientific manuscripts in R Markdown. 
These include the extensive documentation for the `html_document2` and `pdf_document2` templates in the `bookdown` package, as well as specialized packages for APA like `papaja`. 

I found myself looking for a way to create crisp, specialized Word documents that went beyond these existing resources.
Regarding `bookdown`, its functionality is more extensive for HTML/PDF than for Word output.
However, many collaborators still rely on a Word-based workflow rather than HTML or PDF documents with Git-based version control.
Regarding `papaja`, this package does output to Word, but (a) uses package-specific output functions and (b) controls customization under-the-hood.
While the point of `papaja` is to take the burden of customization off the user, it's difficult to transition code and text to different documents, outputs, or projects.
