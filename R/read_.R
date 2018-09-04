#' Import spss .sav data from Online Surveys (BOS)
#'
#'
#'
#' @param filename path to SPSS .sav file from BOS
#' @param sep separator for question code and question text
#' @param pad number of digits to pad question codes with
#' @return Returns a tibble with URN and column per question
#' @details Imports an SPSS .sav file saved from Online Surveys (BOS) then
#' extracts meta data and joins it to create tibble with long form question
#' names as headers and explicit data in cells.
#' @export
#' @examples
#' \donttest{test_sav <- bossier_example("bossier_example.sav")}
#' \donttest{dat <- read_bos(file, sep = "---", pad = 3)}
#' \donttest{head(dat)}


read_bos <- function(filename,
                     sep = "---",
                     pad = 3) {
  assertthat::assert_that(assertthat::is.string(filename),
    msg = "filename must be a single character string"
  )

  surv_data <- haven::read_sav(filename)

  surv_meta <- tidymetadata::create_metadata(surv_data)

  surv_data <- map(names(surv_data),
                   ~label_if_labelled(surv_data, .x, surv_meta))

  surv_data
}

#' Pad SPSS .sav question codes
#'
#'
#' @param text the question name
#' @param pad number of zeros to pad at start of question number
#' @return Returns a zero padded question id

pad_q_num <- function(text, pad) {
  quest <- stringr::str_extract(text, "(?<=^Q)\\d+")
  text <- stringr::str_replace(
    text, "(?<=^Q)\\d+",
    stringr::str_pad(quest, pad, "left", 0)
  )
  text
}


#' Get path to example data
#'
#' bossier has example data in `inst/extdata`
#' directory. This function eases access (from jennybc - readxl)
#'
#' @param path Name of file. If `NULL`, the example files will be listed.
#' @export
#' @examples
#' bossier_example()
#' bossier_example("bossier_example.sav")
bossier_example <- function(path = NULL) {
  if (is.null(path)) {
    dir(system.file("extdata", package = "bossier"))
  } else {
    system.file("extdata", path, package = "bossier", mustWork = TRUE)
  }
}

#' Label column if labelled!
#'
#'
#' @param data The dataset
#' @param variable The variable to consider
#' @param meta The metadata to use if needed
#' @export

label_if_labelled <- function(data, variable, meta){
  if(labelled::is.labelled(data[[variable]])){
    tidymetadata::label_data(data, variable, variable, meta)
  }else{
    data[[variable]]
  }
}
