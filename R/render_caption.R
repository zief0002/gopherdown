#' Render LaTeX captions
#'
#' Captions are not rendered to latex by default. To aid in writing these, This
#' function will take in your markdown-formatted caption, and give you a latex
#' formatted caption.
#'
#' @param caption the markdown-formatted text you want to render as a figure
#'   caption.
#' @param figname the name of the figure (as to not crowd the )
#'
#' @return a figure caption rendered in LaTeX
#' @export
#' @details This works by utilizing the \pkg{knitr} function
#'   \code{\link[knitr]{pandoc}}. It allows you to include references in your
#'   captions, which are not automatically rendered.
#'
#' @seealso \code{\link{process_citations}}
#'
#' @examples
#'
#' # Setup for the example
#' # Note that this will already be set for you when you run the document
#' rootdir <- find.package("beaverdown")
#' rootdir <- paste0(rootdir, "/rmarkdown/templates/oregonstate/skeleton/")
#' knitr::opts_knit$set(root.dir = rootdir)
#'
#'
#' caption <- "This is some *text* to use as a caption [@angel2000]!"
#' # Make sure to set your index to whatever your project is called!
#' render_caption(caption, index = "skeleton.Rmd")
#'
#' @importFrom yaml yaml.load
render_caption <- function(caption, figname = "fig1", index = "index.Rmd", to = "latex"){
  the_root  <- knitr::opts_knit$get("root.dir")
  yml       <- readLines(file.path(the_root, index))
  yml_lines <- which(yml == "---")[1:2]
  yml_lines <- expand_range(yml_lines, 1)
  yml       <- yaml::yaml.load(paste(yml[yml_lines], collapse = "\n"))
  bib       <- file.path(the_root, yml$bibliography)
  yml$bibliography <- paste(bib, collapse = "\n    ")
  yml$csl          <- file.path(the_root, yml$csl)
  return(process_citations(caption, yml, figname, to))
}

#' Process citations in a text formatted with markdown
#'
#' @param caption text formatted with markdown
#' @param yml a list of yaml metadata
#' @param figname the name of the output file
#' @param to the output format. Defaults to "latex". Could also be "html".
#'   "markdown" does nothing useful.
#'
#' @return formatted text with rendered citations
#' @export
#'
#' @seealso \code{\link{render_caption}}
#'
#' @examples
#' # Setup for the example
#' # Note that this will already be set for you when you run the document
#' rootdir <- find.package("beaverdown")
#' rootdir <- paste0(rootdir, "/rmarkdown/templates/oregonstate/skeleton/")
#' bib <- file.path(rootdir, c("bib/references.bib", "bib/thesis.bib"))
#' bib <- paste(bib, collapse = "\n    ")
#' csl <- file.path(rootdir, "csl/apa.csl")
#' txt <- "**Hey!** This is a citation from @angel2000."
#' yml <- list(bibliography = bib, csl = csl, `link-citations` = TRUE)
#' process_citations(txt, yml)
process_citations <- function(caption, yml, figname = "fig1", to = "latex"){
  tmpdir <- tempdir()
  to     <- match.arg(to, c("latex", "markdown", "html"))
  out    <- switch(to,
                   latex = ".tex",
                   markdown = ".md",
                   html = ".html")
  linkcite <- if (yml$`link-citations`) "true" else "false"
  txt <- paste0("<!--pandoc
t: ", to,"\n",
"s:
mathjax:
number-sections:
bibliography: ", yml$bibliography, "\n",
"csl: ", yml$csl, "\n",
"metadata: link-citations=", linkcite, "\n",
"o: ", paste0(tmpdir, "/", figname, out), "\n",
"-->

CUT=======

", caption,"

CUT=======
")

  intmp <- paste0(tmpdir, "/", figname, ".Rmd")
  cat(txt, file = intmp)

  outfile <- knitr::pandoc(intmp)
  tmptxt  <- readLines(outfile)
  cuttext <- if (out == ".html") "<p>CUT=======</p>" else "CUT======="
  trim    <- if (out == ".html") 1 else 2
  outinds <- which(tmptxt == cuttext)
  inds    <- expand_range(outinds, trim)
  if (out == ".html"){
    tmptxt <- paste(tmptxt[inds], collapse = "\n")
    return(substr(tmptxt, 4, nchar(tmptxt) - 4))
  } else {
    return(paste(tmptxt[inds], collapse = "\n"))
  }

}

#' Expand the range of a vector of two integers and trim by a certain amount
#'
#' @param therange a vector with two elements
#' @param trim an integer specifying how much to cut off either end.
#'
#' @details this is a solution to the problem where you have a pair of indices
#' that you need to use to grab a range of indices. Sure, you could do the ever
#' ungraceful \code{x[1]:x[2]}, but that sucks. This is better
#'
#' @return a vector
#'
#' @noRd
#'
#' @examples
#' x <- c(1, 10)
#' expand_range(x, trim = 1)
#' 2:9
expand_range <- function(therange = c(1, 10), trim = 1){
  seq(from = therange[1] + trim, to = therange[2] - trim, by = 1)
}
