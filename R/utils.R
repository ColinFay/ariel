#' @importFrom attempt stop_if_not
#' @importFrom curl has_internet
check_internet <- function(){
  stop_if_not(.x = has_internet(), msg = "Please check your internet connexion")
}

#' @importFrom httr status_code
#' @importFrom attempt stop_if_not
check_status <- function(res){
  stop_if_not(.x = status_code(res),
              .p = ~ .x == 200,
              msg = "The API returned an error")
}

base_url <- "https://api.insee.fr/entreprises/sirene/V3"

na_if_null <- function(x){
    if(is.null(x)) NA else x
}

parse_res_siren <- function(res){
  ul <- res$uniteLegale
  ul$periodesUniteLegale <- NULL
  ul <- lapply(ul, na_if_null)
  list(
    info = as.data.frame(ul),
    periodesUniteLegale = res$uniteLegale$periodesUniteLegale
  )
}

parse_res_siret <- function(res){
  ul <- res$etablissement
  ul$uniteLegale <- NULL
  ul$adresseEtablissement <- NULL
  ul$periodesEtablissement <- NULL
  ul <- lapply(ul,na_if_null)
  res$etablissement$uniteLegale <- lapply(res$etablissement$uniteLegale, na_if_null)
  res$etablissement$adresseEtablissement <- lapply(res$etablissement$adresseEtablissement, na_if_null)

  list(
    info = as.data.frame(ul),
    unite_legale = as.data.frame(res$etablissement$uniteLegale),
    adresse_etablissement = as.data.frame(res$etablissement$adresseEtablissement),
    periodesEtablissement = res$etablissement$periodesEtablissement
  )
}
