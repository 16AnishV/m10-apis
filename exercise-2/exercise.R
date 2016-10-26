### Exercise 2 ###

# As you noticed, it often takes multiple queries to retrieve the desired information.
# This is a perfect situation in which writing a function will allow you to better structure your
# code, and give a name to a repeated task.
library(jsonlite)
setwd('~/Documents/info-201/m10-apis/exercise-2/')


# Write a function that allows you to specify an artist, and returns the top 10 tracks of that artist

base <- 'https://api.spotify.com/v1/'

artist <- 'Drake'

artist.query <- paste0(base, 'search?', 'q=', artist, '&type=artist')

artist.info <- fromJSON(artist.query)

# > names(artist.info)
#     [1] "artists"
# > names(artist.info$artists)
#     [1] "href"     "items"    "limit"    "next"     "offset"   "previous" "total"   
# > names(artist.info$artists$items)
#     [1] "external_urls" "followers"     "genres"        "href"          "id"           
#     [6] "images"        "name"          "popularity"    "type"          "uri"
# > artist.info$artists$items$id
#     [1] "3TVXtAsR1Inumwj472S9r4" "6mHYnQ5E6ATfZ1a3nFGYrA" "29ijED2bnnprp2TciAK1aO"
#     [4] "5c3GLXai8YOMid29ZEuR9y" "03ilIKH0i08IxmjKcn63ne" "2y7pPMQioLwMFUKhK9Pyow"
#     [7] "3KLA7mvD10XxcjRbo3uTdB" "0Jm1S6ygzF2F9XYWJCf6Hu" "3uCTdq9rOnPCAlJMc4OzGn"
#     [10] "5wzXzlWJdkALT4P8pywiau" "1xDIDfyzRo8HNGsLp4JfzO" "1t2vamW3e4TNHlKeDMmaUA"
#     [13] "1789Un2gEvELbBTnHoS9Rl" "4W9G3Vnt9eXWTo4VeOQkSa" "63sCgPkafGOs5UYQiX11py"
#     [16] "5QDvl1vOkRT0hL6eFmCN9q" "5R5ihvAzdzIqGWvaCc9EBU" "7DDaQqjdIkLxhp1jQyxLux"
#     [19] "7rvB7ONJSqlmaCrcbhelir" "2m5ti7YuYYCVs8xfZgnVkx"
# > artist.info$artists$items$id[1]                       *****THIS IS WHAT WE WANT*****
#     [1] "3TVXtAsR1Inumwj472S9r4"                        *****THIS IS WHAT WE WANT*****

artist.id <- artist.info$artists$items$id[1]


tracks <- paste0(base, 'artists/', artist.id, '/top-tracks?country=US')

View(fromJSON(tracks))


TopTrackSearch <- function(artist) {
  ## Do all of the things written above.
  base <- 'https://api.spotify.com/v1/'
  
  artist.query <- paste0(base, 'search?', 'q=', artist, '&type=artist')
  
  artist.info <- fromJSON(artist.query)
  
  artist.id <- artist.info$artists$items$id[1]
  
  tracks.query <- paste0(base, 'artists/', artist.id, '/top-tracks?country=US')
  
  tracks <- fromJSON(tracks.query)
  return(tracks)
}

# What are the top 10 tracks by Nelly?
TopTrackSearch("Nelly")



### Bonus ### 
# Write a function that allows you to specify a search type (artist, album, etc.), and a string, 
# that returns the album/artist/etc. page of interest


# Search albums with the word "Sermon"

