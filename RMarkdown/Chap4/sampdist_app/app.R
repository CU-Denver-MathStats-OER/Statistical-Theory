library(shiny) # Start script by loading the Shiny package with the command

# Define UI for app that draws a histogram
ui <- fluidPage(
  titlePanel("Sampling Distribution of Mean BMI "), # App title
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
  bmi.mean <- numeric(200) 
  
output$distPlot <- renderPlot({
 
  # A for loop that generates 1000 random samples 
  # Each size nsamp, and calculates the sample mean.
  for (i in 1:200)
  {
    bmi.sample <- rnorm(input$nsamp, 26, 4) #Randomly picks n values from N(26,4)
    bmi.mean[i] <- mean(bmi.sample)
  }
  
 # xdown <- 26 - floor(min(bmi.mean))
#  xup <- ceiling(max(bmi.mean)) - 26
#  xdiff <- max(xdown, xup)
#  xjump <- round(xdiff/3,0)
#  xmin <- 26 - xdiff
#  xmax <- 26 + xdiff
  
  # Plot the sampling distribution
  par(mfrow = c(1, 2))
  qqnorm(bmi.mean, ylab = "Residuals")
  qqline(bmi.mean)
  
  hist(bmi.mean, xlim = c(14, 38), 
       xlab = "Mean BMI of Sample",
       main = "Sampling Distribution of Mean BMI for n=??",
       breaks = 10,
       xaxt='n')
  axis(1, at=seq(14, 38, 4), pos=0)
  abline(v = 26, col = "red", lwd = 2, lty = 2)
  par(mfrow = c(1, 1))
  
  #print("The center of the sampling distribution is", round(mean(bmi.mean),2),
  #      "\n \n The standard error is", round(sd(bmi.mean),4))
  }) # End renderPlot

} #End server

shinyApp(ui = ui, server = server) # End with a call to `shinyApp`