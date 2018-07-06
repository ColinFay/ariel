colin::fill_desc(
  name = "ariel",
  Title = "Access the SIRENE API from R",
  Description = "Access the SIRENE API from R.",
  repo = "ariel"
  )

colin::init_docs()

library(usethis)
use_package("attempt")
use_package("curl")
use_package("jsonlite")
use_package("httr")
use_package("glue")

library(attempt)
library(curl)
library(jsonlite)
library(httr)
library(glue)
