# Reproducible scientific manuscripts with R Markdown

There are many great resources for creating reproducible scientific manuscripts in R Markdown. 
These include the extensive documentation for the `html_document2` and `pdf_document2` templates in the `bookdown` package, as well as specialized packages for APA like `papaja`. 
On the one hand, the `bookdown` documentation focuses on HTML/PDF output.
Many collaborators still rely on a Microsoft Word-based workflow rather than HTML or PDF documents with Git-based version control.
On the other hand, `papaja` outputs to Word but (a) uses package-specific output functions that don't transfer to other documents and (b) controls customization under-the-hood.
While the point of `papaja` is to take the burden of customization off the user, it's difficult to transition code and text to different documents/projects.
