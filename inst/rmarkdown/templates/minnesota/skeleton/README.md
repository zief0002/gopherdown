# University of Minnesota RMarkdown thesis template

This is the unofficial University of Minnesota RMarkdown thesis template. You 
can find a copy of this template at https://github.com/zief0002/gopherdown.

To install and use `{gopherdown}` and use it for your dissertation/thesis, you will need:

-   [pandoc \>= 2.16.2](http://pandoc.org/)
-   [LaTeX dsitribution](https://yihui.org/tinytex/) specifically XeTeX;
-   [R \>= 3.3.0](https://r-project.org)
-   [RStudio](https://rstudio.org) (optional, but it helps)

Rather than installing a large TeX distribution, I recommend installing
LaTeX via the `install_tinytex()` function from the R package
[`{tinytex}`](https://yihui.org/tinytex/).


To use `{gopherdown}`, either open a new Rmarkdown document from Rstudio
using the University of Minnesota template or run the following command in a clean working directory:

```r
rmarkdown::draft("index.Rmd", template = "minnesota", package = "gopherdown")
```

## Rendering

To render your thesis, you can open `index.Rmd` in RStudio and then hit the
"knit" button. Alternatively, you can use:

```r
rmarkdown::render("index.Rmd")
```

Your thesis will be deposited in the `_book/` directory.

---

## Files and Directories (Edit These)

The following files and directories are the ones I updated, edited, and added content to in order to customize my thesis:

### _bookdown.yml

This is the main configuration file for your thesis. Arrange the order of your chapters in this file and ensure that the names match the names in your folders.

### index.Rmd

This file contains all the meta information (in the YAML) that helps create the thesis. I also included an R code chunk that loads all the packages and sets different global (e.g., scientific notation penalty) and knitr options (e.g., supress messages nd warnings in code chunks).

There are several YAML fields here to edit:

*Required Information*

- `title:` Your thesis title goes here
- `author:` This should be the student's full legal name
- `month:` and `year:` Include the month and year that degree requirements were met 
- `advisor:` Add your advisor here
- `coadvisor:` If you have a coadvisor, uncomment this and add that person's name. This will update the signature page as well.

*Degree*

- `phd: true` If this is a PhD thesis, leave this `true`. If it is an MA thesis of Plan B paper, change it to `false`.
- `plan_b: false` If this is a Plan B paper, change this to `true`.

*Rendering Options*

In general, do not edit things in this section.

- `knit:` The string `"bookdown::render_book"` builds the entire thesis when you click `knit` in the `index.Rmd` file. 
- `output:` These lines use the `thesis_pdf()` function from `{gopherdown}` to render the thesis. The `latex-engine: xelatex` line uses the XeLaTeX engine which allows you to use a wider range of fonts.

*Fonts*

- `mainfont:`, `sansfont:`, and `monofont:` Set the fonts to use in the thesis; the main font, sans-serif font, and mon-spaced (for code) fonts. The UMN Thesis Formatting Guidelines only allow certain fonts.

*Link Highlighting*

- `link-citations: true` Makes the citations in the thesis clickable and links them to the appropriate refere3nce in the *References* section 
- `colored-not-bordered-links: true` Uses colored links.
- `urlcolor-hex:`, `citecolor-hex:`, and `linkcolor-hex:` set the colors for URLs, in document citations, and links to sections in your thesis. Here I set these to `"2C6DAC"`, the HEX code for a nice blue color. If you are printing a physical version of your thesis, you willll want to comment out these three lines.

*Bibliography/References*

- `bibliography:` This gives the pathnames for the BIB files where you have embedded reference information. Here I set this to `["bib/lit-references.bib", "bib/methods-references.bib"]` which calls two BIB files, both located in the `bib/` directory.
- `csl:` This gives the pathname for your CSL file. Here I set this to `"csl/apa.csl"` which calls the APA CSL file located in the `csl/` directory.
- `citation_package:`, `biblatexoptions:`, and `biblio-style:` These are commented out because I am using Pandoc to create the citations and references. If you want to use BibLaTeX instead, you can uncomment these and set any options and style. You will also need to comment out the `csl:` YAML field since the CSL file is only used by Pandoc.
- `nocite:` Thes are citation keys for references I wanted included in the thesis' *References* section, but didn't actually call in the RMD files. This is mainly some references cited in Table 2.1 where I had to use some LaTeX syntax in the `longtable` environment and couldn't use typical RMD citations (e.g., using `[@cite-key]`).

*Create List of tables and Figures*

These are required for the thesis, so do not change these unless you are drafting things and want to speed up renders.

- `lot: true` This adds the *List of Tables* to the front matter of your thesis.
- `lof: true` This adds the *List of Figures* to the front matter of your thesis.

*Add LaTeX Content to the Preamble*

- `header-includes:` This includes LaTeX syntax in the Preamble to the TEX document used to compile your thesis. If you are not adding any additional LaTeX packages or code, this can remain commented out.

*Optional Frontmatter*

- `acknowledgements:` This adds the front matter for your thesis. If you are not including one or more of these sections, the lines appropriate to those sections can be commented out or deleted.


### pre/

This folder contains all of the Rmd files to be included in the pretext of your dissertation (e.g. abstract, acknowledgements, author contributions, etc.). If you are not including one or more of these sections, the file appropriate to those sections can be deleted.

### chapters/

This folder contains the RMD files for each chapter in the dissertation, as well as the appendices. These files contain the main content for the thesis.

### bib/

Store your bibliography as bibtex (.BIB) files here. By default, `{gopherdown}` includes two BIB files, `references.bib` file and `packages.bib`. If you have other .BIB files they can be included in this folder. You would also need to add them to the `bibliography:` YAML field in `index.Rmd`.

### csl/

Specific style files for bibliographies should be stored here. The APA style file is added by default when you create a new document using `{gopherdown}`. If you want to use a different style file grab it from [https://www.zotero.org/styles](https://www.zotero.org/styles) or [https://github.com/citation-style-language/styles](https://github.com/citation-style-language/styles) and add the CSL file to this folder. Then change the `csl:` YAML field in `index.Rmd`.

### figure/

Store figures not created within the RMD files (e.g., figures created in Keynote, PowerPoint). They can then be referenced using `knitr::include_graphics()` in the RMD files.

### data/

Store data sets (e.g., CSV files) used in analyses, etc. here. 

---

## Files and Directories (Do Not Edit)

The `{gopherdown}` package calls the `thesis_pdf()` function to create your thesis. It draws on the `template.tex` and `umnthesis.cls` files in the main directory. (Do not change these unless you know what you are doing!) When the thesis is rendered (clicking the `knit` button in the `index.Rmd` file), the `_book` and `_bookdown_files` directories are populated. 

### _book/

This directory includes your compiled thesis and all the relevant TEX files.

### _bookdown_files

This directory includes things that the `{bookdown}` package creates when the PDF is compiled (e.g., PDF versions of all figures).


**You should not edit these. To edit, change the RMD files or other files in the main directory.**

