# uniform distribution# Ppot
 
 require(tidyverse)                   # I live in the tidy verse.
 require(cowplot)                     # For publishable graphics
 require( here )                      # To get project location in file system.
 
 
 a <- 10                                     # Assign parameter values.
 b <- 90
 
 reps <-                                     # Set the number of replications.
   10000
 
 x <- seq( from = 0,                         # Define random variable values.
           to   = 100,
           by   = 0.5 )
 
 density <-                                  # Compute probability density 
   ifelse( x < a, 0,                         # function.
           ifelse( x <= b, 1/(b-a), 0 ))
 
 this_tibble <-                              # Create tibble for plotting.
   tibble( x, density )
 
 figure_01 <-
   ggplot( this_tibble,                      # plot graph.
           aes( x = x, 
                y = density )) +
   geom_line() +
   geom_hline(yintercept = 0) +
   xlab( "X" ) +
   ylab( "Probability density" ) +
   ggtitle( 
     paste( "Figure 1: Probability of continuous uniform density with\n",
            "parameters a = 10, b = 90 " )) +
   theme_cowplot()
 
 figure_01                                # Display plot.
 
 ggsave( "figure_01.png",
         plot = figure_01,
         path 
          = file.path( here(),
                      "plots" ))
 
 ```