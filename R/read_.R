#' Import spss .sav data from Online Surveys (BOS)
#'
#'
#'
#' @param filename path to SPSS .sav file from BOS
#' @param sep separator for question code and question text
#' @return Returns a tibble.
#' @export
#' @examples

read_bos <- function(filename, sep = "---"){
  assertthat::assert_that(assertthat::is.string(filename),
                          msg = "filename must be a single character string")

  dat <- haven::read_sav(filename)
}