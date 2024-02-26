

#' get_user_moda
#' @description
#' This function gives the list of users
#'
#'
#' @param form_id ID of users
#' @param Token Token of users
#'
#' @return dataframe
#' @export
#'
#' @examples\dontrun{get_user_moda(56597, "9096b0028c4e68aa7a97122b889f3afe923b367b")}
get_user_moda <- function(form_id, Token){

  # url = paste0("https://api.moda.wfp.org/api/v1/form/",form_id,".csv")
  url <- paste0("https://api.moda.wfp.org/api/v1/forms/",form_id)

  # url = paste0("https://api.wfp.org/moda/1.4.0",form_id,".csv")
  result<- httr::GET(url,httr::add_headers(Authorization = paste0("Token ", Token)))
  # Token de
  # d_content <- read_xlsx(content(result,"raw"))
  # d_content <- read_sav(content(result,"raw"))
  # d_content <- read_csv(content(result,"raw"))
  d_content <- jsonlite::fromJSON(rawToChar(result$content), flatten = TRUE,simplifyDataFrame = TRUE)

  test_user <- d_content[["users"]]
  test_user <- test_user[,c("first_name","last_name","user","role")]

  return (test_user)

}
