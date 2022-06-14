library(shiny) # Start script by loading the Shiny package with the command
library(car)

# Define UI for app that draws a histogram
ui <- fluidPage(
  titlePanel("Sampling Distribution of Wait Time"), # App title
  sidebarLayout( # Begin Sidebar layout 
    sidebarPanel(  # Sidebar panel for inputs
      sliderInput(inputId = "nsamp", # Create Input Object: Number in each sample
                  label = "Size of Sample", 
                  min = 1,
                  max = 50,
                  value = 4) # Initial value of slider
     ),
    mainPanel( # Begin main panel for displaying outputs
      plotOutput(outputId = "distPlot") # Output: Histogram
    )
  )
)


# Server function
server <- function(input, output) {
  # creates an empty vector to store results
  wait.mean <- numeric(200) 
  
output$distPlot <- renderPlot({
  par(mfrow = c(1, 2))
 
  # A for loop that generates 1000 random samples 
  # Each size n=4, and calculates the sample mean.
  for (i in 1:200)
  {
    wait.sample <- rexp(input$nsamp, 1/40) #Randomly picks 4 values from Exp(1/40)
    wait.mean[i] <- mean(wait.sample)
  }
  
  
  par(mfrow = c(1, 2))
  qqPlot(wait.mean) # uses car library 
#  qqnorm(wait.mean, ylab = "Residuals")
 # qqline(wait.mean)
  
  # Plot the sampling distribution
  hist(wait.mean, xlim = c(0, 100), 
       xlab = "Mean Wait Time of Sample (in min)",
       main = "Sampling Distribution of Mean Wait Time",
       xaxt='n')
  axis(1, at=seq(0, 100, 10), pos=0)
  abline(v = 40, col = "red", lwd = 2, lty = 2)
  
  #print("The center of the sampling distribution is", round(mean(bmi.mean),2),
  #      "\n \n The standard error is", round(sd(bmi.mean),4))
  }) # End renderPlot

} #End server

shinyApp(ui = ui, server = server) # End with a call to `shinyApp`