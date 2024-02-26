

#' get_data_moda
#' @description
#' This function allows users to download data from Moda
#'
#'
#' @param form_id ID of users
#' @param Token Token of users
#'
#' @return dataframe
#' @export
#'
#' @examples\dontrun{get_data_moda(56597, "9096b0028c4e68aa7a97122b889f3afe923b367b")}
get_data_moda <- function(form_id, Token){

  url = paste0("https://api.moda.wfp.org/api/v1/data/",form_id,".csv")

  # url = paste0("https://api.wfp.org/moda/1.4.0",form_id,".csv")
  # fsms <- "fsms.sav"
  result<- httr::GET(url,httr::add_headers(Authorization = paste0("Token ", Token)))
  # Token de
  # d_content <- read_csv(content(result,"raw"))
  # d_content <- read_sav(content(result,"raw"))
  d_content <- readr::read_csv(httr::content(result,"raw"))


  return (d_content)

}
