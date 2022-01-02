#' Creates an R Markdown PDF Thesis document
#'
#' This is a function called in output in the YAML of the driver Rmd file
#' to specify using the University of Minnesota LaTeX template and cls files.
#'
#' @export
#'
#' @param toc A Boolean (TRUE or FALSE) specifying where table of contents should be created
#' @param toc_depth A positive integer
#' @param ... arguments to be passed to \code{rmarkdown::\link[rmarkdown]{pdf_document}}
#'
#' @return A modified \code{pdf_document} based on the Reed Senior Thesis LaTeX
#'   template
#' @note The arguments highlight, keep_tex, and pandoc_args, are already set.
#' @examples
#' \dontrun{
#'  output: thesisdown::thesis_pdf
#' }
thesis_pdf <- function(toc = TRUE, toc_depth = 3, ...){

  base <- bookdown::pdf_book(
    template = "template.tex",
    toc = toc,
    toc_depth = toc_depth,
    highlight = "pygments",
    keep_tex = TRUE,
    pandoc_args = "--top-level-division=chapter",
    ...)

  # Mostly copied from knitr::render_sweave
  base$knitr$opts_knit$root.dir   <- getwd()
  base$knitr$opts_chunk$comment   <- NA
  base$knitr$opts_chunk$fig.align <- "center"
  base$knitr$opts_knit$fig.ext <- "png"
  base$knitr$opts_knit$fig.path <- "figures/"
  base$knitr$opts_knit$fig.retina <- 3
  base$knitr$opts_chunk$out.width <- "80%"

  # Not sure if needed?
  base$knitr$knit_hooks$plot <- knitr:::hook_plot_tex

  base

}


#' Generate a section for the yaml input
#'
#' @param input a file containing markdown text
#' @param sep a separator for each line. Defaults to "\\n  "
#'
#' @return a string
#' @export
#'
#' @examples
#' f <- file()
#' cat("  this is\nsome text that\nwill be renedered in\na file\n", file = f)
#' cat(inc(f))
#' close(f)
inc <- function(input, sep = "\n  "){
  paste(readLines(input), collapse = sep)
}
