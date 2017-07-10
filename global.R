library(DT)
library(dplyr)
library(shiny)
library(shinyjs)

fieldsMandatory <- c("name", "favourite_pkg")

labelMandatory <- function(label) {
        tagList(
                label,
                span("*", class = "mandatory_star")
        )
}

appCSS <- ".mandatory_star { color: red; }
           #error { color: red; }"

fieldsAll <- c("name", "favourite_pkg", "used_shiny", "r_num_years", "os_type")
responsesDir <- file.path("responses")
epochTime <- function() {
        as.integer(Sys.time())
        
        
}

saveData <- function(data) {
        fileName <- sprintf("%s_%s.csv",
                            humanTime(),
                            digest::digest(data))
        
        write.csv(x = data, file = file.path(responsesDir, fileName),
                  row.names = FALSE, quote = TRUE)
}


humanTime <- function() format(Sys.time(), "%Y%m%d-%H%M%OS")


loadData <- function() {
        files <- list.files(file.path(responsesDir), full.names = TRUE)
        data <- lapply(files, read.csv, stringsAsFactors = FALSE)
        data <- dplyr::bind_rows(data)
        data
}