test_that("a connection can be made", {
  con <- djpr_connect()
  expect_s4_class(con, 'PqConnection')
  DBI::dbDisconnect(con)
})

test_that('a config file can be used', {
  con <- djpr_connect(config = TRUE, file = 'config.yml')
  expect_s4_class(con, 'PqConnection')
  DBI::dbDisconnect(con)
})
