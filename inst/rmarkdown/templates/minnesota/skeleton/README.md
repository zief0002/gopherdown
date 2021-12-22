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

## Components

The following components are ones you should edit to customize your thesis:

### _bookdown.yml

This is the main configuration file for your thesis. Arrange the order of your
chapters in this file and ensure that the names match the names in your folders.

### index.Rmd

This file contains all the meta information that goes at the beginning of your
document. Currently, we have the introduction in there, but you can leave that
part blank if you wish. 

### pre/

This folder contains all of the Rmd files to be included in the pretext of your
dissertation (e.g. abstract, acknowledgements, author contributions, etc.).

There is a slight caveat to all of these files: the very first line must be 
plain text or the rendering will be screwed up.

### chapters/

This folder contains the Rmd files for each chapter in your dissertation. Modify
as you will.

### bib/

Store your bibliography (as bibtex files) here.

### csl/

Specific style files for bibliographies should be stored here. A good source for
citation styles is https://github.com/citation-style-language/styles#readme

### figure/ and data/

These should be self explanatory. Store your figures and data here and reference
them in your document. 


