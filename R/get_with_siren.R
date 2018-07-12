#' Get with siren number
#'
#' @param siren a SIREN Number
#' @param date the date to start from
#' @param token your API token
#'
#' @return a list of data.frame
#' @export
#'
#' @importFrom httr GET add_headers
#' @importFrom glue glue
#' @importFrom jsonlite fromJSON
#'
#' @examples
#' dontrun{
#' get_with_siren(siren = "810064519",
#'     date = "2017-01-01",
#'     token = token)
#' }
#'
get_with_siren <- function(siren,
                 date = NULL,
                 token) {
  check_internet()
  res_net <- httr::GET(
    glue("{base_url}/siren/{siren}"),
    query = list(date = date),
    add_headers(
      Authorization = glue("Bearer {token}"),
      Accept = "application/json"
    )
  )
  check_status(res_net)
  res <- fromJSON(rawToChar(res_net$content))
  parse_res_siren(res)
}
