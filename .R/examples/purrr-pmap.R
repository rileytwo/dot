library(dplyr)
library(purrr)

tbdf <- tibble(
  cyl = c(4, 6, 8),
  mpg = c(30, 25, 20)) %>% mutate(
    x = pmap(
      .l = list(cc = cyl, mm = mpg),
      function(cc, mm) {
        filter(mtcars, cyl == cc, mpg < mm)
      }
    )
  )


