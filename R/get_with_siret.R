#' Get with siret
#'
#' @param siret a siret number
#' @param date the date to start from
#' @param token an api token
#'
#' @importFrom httr GET add_headers
#' @importFrom glue glue
#' @importFrom jsonlite fromJSON
#'
#' @return a list of data.frame
#' @export
#'
#' @examples
#' dontrun{
#' get_with_siret(siret = "810064519",
#'     date = "2017-01-01",
#'     token = token)
#' }
#'

get_with_siret <- function(siret,
                           date = NULL,
                           token) {
  check_internet()
  res_net <- httr::GET(
    glue("{base_url}/siret/{siret}"),
    query = list(date = date),
    add_headers(
      Authorization = glue("Bearer {token}"),
      Accept = "application/json"
    )
  )
  check_status(res_net)
  res <- fromJSON(rawToChar(res_net$content))
  parse_res_siret(res)
}
