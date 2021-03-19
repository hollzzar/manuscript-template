# Reproducible scientific manuscripts with R Markdown

There are many great resources for creating reproducible scientific manuscripts in R Markdown. 
These include the extensive documentation for the `html_document2` and `pdf_document2` templates in the `bookdown` package, as well as specialized packages for APA like `papaja`. 

I found myself looking for a way to create specialized Word documents that went beyond these existing resources.
Regarding `bookdown`, its functionality is more extensive for HTML/PDF than for Word output.
However, many collaborators still rely on a Word-based workflow rather than HTML- or PDF-based workflows that use Git for version control.
Regarding `papaja`, this package does output to Word, but (a) uses package-specific output functions and (b) controls customization under-the-hood.
While the point of `papaja` is to take the burden of customization off the user, it's difficult to transition code and text to different documents, outputs, or projects.

This repository contains a template for creating manuscripts that takes advantage of R Markdown's reproducibility, Word's ease of collaboration, and `bookdown`'s cross-referencing capabilities.

There are two main limitations. One is that, to my knowledge, there is no way to include line numbers or update headers automatically.
This will need to be done in the Word document output.
More importantly, there is currently no way easy way to incorporate track-changes from collaborators.
I recommend using Git to compare your document to your collaborators' or using the *combine documents* functionality in Word.
Unfortunately, neither of these solutions updates your actual R Markdown documents.
This will need to be done by hand.
