# Reproducible scientific manuscripts with R Markdown

There are many great resources for creating reproducible scientific manuscripts in R Markdown. 
Two packages in particular stand out: [`bookdown`](https://github.com/rstudio/bookdown) and [`papaja`](https://github.com/crsh/papaja).
`bookdown` is a flexible tool not only for creating books, but also documents of any kind that include cross-referencing.
`papaja` is specifically designed for APA formatting, which is used in my field.

I wanted to combine the strengths of both packages into a flexible template.
In particular, I wanted to create Microsoft Word documents with the content and formatting I needed without a lot of post-output effort.
While many journals accept LaTeX submissions, my collaborators rely on a Word-based workflow, and converting existing templates from tex to Word produced less than satisfactory results.
Existing templates for Word output were also not formatted for my needs and were not easily customized.

This repository contains a template for creating manuscripts that takes advantage of R Markdown's reproducibility, Word's ease of collaboration, and `bookdown`'s cross-referencing capabilities. You can also use formatting functions from `papaja` if desired (though I personally prefer `kable` tables and `ggplot` graphs).
In order to use this template, you will need to:

- Install the `bookdown` package
- [Locate the ampersand replacement lua file](https://cran.rstudio.com/web/packages/rmdfiltr/vignettes/replace_ampersands.html) and update the path I included in the YAML header, or remove the whole pandoc argument if not needed for your citation style
- Update the root directory path in the set-up chunk in the main R Markdown file (as described in the chunk comments)

There are two main limitations to using Word outputs. 
One is that, to my knowledge, there is no way to include line numbers or update headers automatically.
This will need to be done in the Word document output.
More importantly, there is currently no way easy way to incorporate track-changes from collaborators.
I recommend using Git to compare your document to your collaborators' or using the *combine documents* functionality in Word.
Unfortunately, neither of these solutions updates your actual R Markdown documents.
This will need to be done by hand.
