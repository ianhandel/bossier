#' Import spss .sav data from Online Surveys (BOS)
#'
#'
#'
#' @param filename path to SPSS .sav file from BOS
#' @param headers Choice of "label", "code" or "both"
#' @param sep separator for question code and question text
#' @param pad number of digits to pad question codes with
#' @return Returns a tibble with URN and column per question
#' @details Imports an SPSS .sav file saved from Online Surveys (BOS) then
#' extracts meta data and joins it to create tibble with long form question
#' names as headers and explicit data in cells. headers argument allows choice
#' original column codes ('code') padded with leading zeros,
#' text label ('label') or both ('both')
#' separated by separator text ('sep').
#' @export
#' @examples
#' \donttest{file <- bossier_example("bossier_example.sav")}
#'
#' \donttest{dat <- read_bos(file, sep = "---", pad = 3)}
#' \donttest{head(dat)}
#'
#' \donttest{dat <- read_bos(file, headers = "code", pad = 3)}
#' \donttest{head(dat)}
#'
#' \donttest{dat <- read_bos(file, headers = "label")}
#' \donttest{head(dat)}


read_bos <- function(filename,
                     headers = 'both',
                     sep = "---",
                     pad = 3) {

  # to survive CRAN global var checks
  `URN---Unique Response Number` <- NULL

    assertthat::assert_that(assertthat::is.string(filename),
    msg = "filename must be a single character string"
  )

  surv_data <- haven::read_sav(filename)

  labels <- sjlabelled::get_label(surv_data)
  codes <- pad_q_num(names(surv_data), pad)
  both <- paste0(codes, sep, labels)

  assertthat::assert_that(all(table(labels) == 1 | headers != "label"),
                          msg = "All labels must be unique to use headers = 'labels',
                          try heades = 'both' or headers = 'code'")

  headers <- switch(headers,
                    label = labels,
                    code = codes,
                    both = both)

  surv_data <- purrr::map(surv_data, sjlabelled::as_label)
  surv_data <- tibble::as_tibble(surv_data)
  surv_data <- sjlabelled::remove_all_labels(surv_data)
  purrr::set_names(surv_data, headers)
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
