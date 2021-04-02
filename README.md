# Reproducible scientific manuscripts with R Markdown

## Introduction

This repository contains a template for creating manuscripts that takes advantage of R Markdown's reproducibility, Word's ease of collaboration, and `bookdown`'s cross-referencing capabilities. You can also use formatting functions from `papaja` if desired (though I personally prefer `kable` tables and `ggplot` graphs).
In order to use this template, you will need to:

- Install the `bookdown` package
- [Locate the ampersand replacement lua file](https://cran.rstudio.com/web/packages/rmdfiltr/vignettes/replace_ampersands.html) and update the path I included in the YAML header, or remove the whole pandoc argument if not needed for your citation style
- Update the root directory path in the set-up chunk in the main R Markdown file (as described in the chunk comments)

If you aren't super familiar with R Markdown, you can check out my [R Markdown Guide for Psychology Graduate Students](https://www.hzaharchuk.com/rmarkdown-guide/).

## Template organization

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
- Acknowledgments/funding

References appear after the Acknowledgments/funding section.
Each file includes placeholder text and instructions for particular features, like cross-referencing in `bookdown`.

Within the *sections* folder is the *code* folder.
These R Markdown documents draw on the R script included in the *scripts* subfolder for data analysis and formatting.
I encourage you to open all of these documents to understand where the code references in the sections are coming from.
The *source_script.R* file also includes helper functions I created for APA number formatting.
