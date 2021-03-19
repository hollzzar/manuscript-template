# Reproducible scientific manuscripts with R Markdown

## Introduction

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

## Template organization

The R Markdown files and R scripts are organized in a very hierarchical fashion.
This structure keeps the information tidy and concise at each stage, from data wrangling, analysis, and visualization to presentation.

The main R Markdown file is *manuscript_template.Rmd*. 
This file includes the YAML header for the whole document, which references the Microsoft Word reference document for formatting, updated Citation Style Language (csl) file for APA references, pandoc filter for handling references, and placeholder bibliography (bib) file that you can update/substitute for your own.
Each section is created in a separate R Markdown file that is included as a `child` document in the main file.
If you do not need one of the sections, you can either set the `child` chunk in the main file to `eval = FALSE` or delete the chunk entirely.

Each section's R Markdown file can be found in the *sections* folder.
These files are as follows:

- Title page
- Abstract
- Introduction
- Methods
- Results
- Conclusion/discussion
- Acknowledgements/funding

References appear after the Acknowledgements/funding section.
Each file includes placeholder text and instructions for particular features, like cross-referencing in `bookdown`.

Within the *sections* folder is the *code* folder, which contains the *scripts* folder.
The R Markdown documents in the *code* folder draw on the R script in the *scripts* folder for data analysis and formatting.
I encourage you to open all of these documents to understand where the code references in the sections are coming from.
The *source_script.R* file includes helper functions I created for APA number formatting.
