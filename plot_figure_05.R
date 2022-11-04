# plot_sampleing with n = 4

require(tidyverse)                   # I live in the tidy verse.
require(cowplot)                     # For publishable graphics
require( here )                      # To get project location in file system.


source("D:/R-Projects/RStatistics/plot_distribution.R")
source("D:/R-Projects/RStatistics/plot_qq_norm.R")


set.seed( 11235 )                    #  For reproducability of results.
reps <- 10000                        # Number of replications

J <- 3                               # Use third sample size.

a <- 10                              # Set uniform parameters
b <- 90

n <- c( 1,                           # Set  various sample sizes.
        2,
        4,
        8,
        16,
        32,
        64,
        128 )

cols <- length(n)                   # Get matrix dimensions.
rows <- reps 


means <-                            # Create matrix to hold means 
  rep( NA, cols * rows )
means <-                            # Columns represent different sample sizes
  matrix( means,                    # and rows represent different samples.
          ncol = cols) 



for( j in 1:cols ){            # Loop through sample sizes
              
  for( i in 1:rows ){               # Loop through samples.
    
    our_sample <-                   # Sample uniform distribution
      runif( n[j], 
             min = a, 
             max = b )              
    
    means[i,j] <-                   # Compute sample means.
      mean( our_sample )
  }
}

distribution <- means[,J]           # Get distribution

figure_04 <-
  plot_distribution( 
    distribution,
    expression(bar(X)),
    paste("Figure", 
          J+1,
          " Sampling distribution of the mean with n = ",
          n[J]))

    figure_04                                   # Display plot.
                              

ggsave( "figure_04.png",                        # Save plot.            
        plot = figure_04,
        path = 
          file.path( 
            here(),
            "plots" ))

figure_04qq <-                                 # Assess normality of the
  plot_qq_norm(                                # sampling distribution.
    variable = distribution,
    R = 100,
    variable_name = "Sample means",
    plot_title = "Normal QQ plot of sampling distribution with n = 1" )

figure_04qq

ggsave( "figure_04qq.png",                # Save plot.            
        plot = figure_03qq,
        path = 
          file.path( 
            here(),
            "plots" ))

