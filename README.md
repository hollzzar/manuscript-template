# Reproducible scientific manuscripts with R Markdown

There are many great resources for creating reproducible scientific manuscripts in R Markdown. 
Two packages in particular stand out: [`bookdown`](https://github.com/rstudio/bookdown) and [`papaja`](https://github.com/crsh/papaja).
`bookdown` is a flexible tool not only for creating books, but also documents of any kind that include cross-referencing.
`papaja` is specifically designed for APA formatting, which is used in my field.

I wanted to combine the strengths of both packages into a flexible template.
In particular, I wanted to create Microsoft Word documents with the content and formatting I needed without a lot of post-output effort.
While many journals accept LaTeX submissions, my collaborators rely on a Word-based workflow, and converting existing templates from tex to Word produced less than satisfactory results.

This repository contains a template for creating manuscripts that takes advantage of R Markdown's reproducibility, Word's ease of collaboration, and `bookdown`'s cross-referencing capabilities.

There are two main limitations. One is that, to my knowledge, there is no way to include line numbers or update headers automatically.
This will need to be done in the Word document output.
More importantly, there is currently no way easy way to incorporate track-changes from collaborators.
I recommend using Git to compare your document to your collaborators' or using the *combine documents* functionality in Word.
Unfortunately, neither of these solutions updates your actual R Markdown documents.
This will need to be done by hand.
