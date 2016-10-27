### Exercise 5 ###
library(jsonlite)
library(dplyr)

# Write a function that allows you to specify a movie, then does the following:
  getMovieReview <- function(movie) {
    
  # Replace all of the spaces in your movie title with plus signs (+)
    movie.no.spaces <- gsub(" ", "+", movie)
  
  # Construct a search query using YOUR api key
  # The base URL is https://api.nytimes.com/svc/movies/v2/reviews/search.json?
  # See the interactive console for more detail:https://developer.nytimes.com/movie_reviews_v2.json#/Console/GET/reviews/search.json
    base <- "https://api.nytimes.com/svc/movies/v2/reviews/search.json?"
    api.key <- 'd98ecc44b9304f2d865500b834648c15'
    request <- paste0(base, 'query=', movie.no.spaces, '&api-key=', api.key)
  
  # Request data using your search query
    data <- fromJSON(request)
    
  
  # What type of variable does this return?
    # This request returns a row of a dataframe with the information about the review
    # of the movie.
  
  # Flatten the data stored in the `$results` key of the data returned to you
  flatten(data$results)
  }
  # From the most recent review, store the headline, short summary, and link to full article each in their own variables
  getMovieReview("Limitless")
  
  # Return an list of the three pieces of information from above
  

# Test that your function works with a movie of your choice

