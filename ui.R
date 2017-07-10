ui = fluidPage(
        
        shinyjs::useShinyjs(),
        shinyjs::inlineCSS(appCSS),
        DT::dataTableOutput("responsesTable"),
        downloadButton("downloadBtn", "Download responses"),
        
        titlePanel("Mimicking a Google Form with a Shiny app"),
        div(
                id = "form",
                
                textInput("name", labelMandatory("Name"), ""),
                textInput("favourite_pkg", labelMandatory("Favourite R package")),
                checkboxInput("used_shiny", "I've built a Shiny app in R before", FALSE),
                sliderInput("r_num_years", "Number of years using R", 0, 25, 2, ticks = FALSE),
                selectInput("os_type", "Operating system used most frequently",
                            c("",  "Windows", "Mac", "Linux")),
                actionButton("submit", "Submit", class = "btn-primary"),
                shinyjs::hidden(
                        span(id = "submit_msg", "Submitting..."),
                        div(id = "error",
                            div(br(), tags$b("Error: "), span(id = "error_msg"))
                        )
                        
                        )
                ),
        
        shinyjs::hidden(
                div(
                        id = "thankyou_msg",
                        h3("Thanks, your response was submitted successfully!"),
                        actionLink("submit_another", "Submit another response")
                )
        )
)
