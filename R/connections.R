


#' @title DJPR PostgreSQL Database Connections
#'
#' @param db
#' @param user
#'
#' @import DBI
#' @import glue
#' @importFrom assertthat assert_that
#' @importFrom RPostgres Postgres
#'
#' @return
#' @export
#'
#' @examples
djpr_connect <- function(db = c("opendata", "official_sensitive"), user = c('open','super')){

  db <- match.arg(db)
  user <- match.arg(user)

  if (db == "official_sensitive") assertthat::assert_that(user == 'super', mgs = 'You must use super user credientials to access the {db} database')

  if (user == 'open') {
    USER_ENV <- 'PG_READ_OPEN_USER'
    PW_ENV <- 'PG_READ_OPEN_PW'
  } else if (user == 'super') {
    USER_ENV <- 'PG_SUSER'
    PW_ENV <- 'PG_SUSER_PW'
  }

  # check env exists
  assertthat::assert_that(USER_ENV %in% names(Sys.getenv()),
                          msg = glue::glue('User not found, use usethis::edit_r_environ() to add a {USER_ENV} environment variable'))
  assertthat::assert_that(PW_ENV %in% names(Sys.getenv()),
                          msg = glue::glue('Password not found, use usethis::edit_r_environ() to add a {PW_ENV} environment variable'))

  DBI::dbConnect(
    drv = RPostgres::Postgres(),
    host = '10.210.1.26',
    dbname = db,
    user = Sys.getenv(USER_ENV),
    password = Sys.getenv(PW_ENV),
    port = 443
  )

}
