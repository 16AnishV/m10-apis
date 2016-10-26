### Exercise 3 ###
library(jsonlite)
library(dplyr)
# Use the `load` function to load in the nelly_tracks file.  That should make the data.frame
# `top_nelly` available to you
load('nelly_tracks.Rdata')

# Use the `flatten` function to flatten the data.frame -- note what differs!
names(top.nelly)  # Before flatten
flattened <- flatten(top.nelly)
names(top.nelly)  # After flatten

# Use your `dplyr` functions to get the number of the songs that appear on each album

num.songs.on.album <- flattened %>% 
                        filter(flattened$album.album_type == "album") %>%
                        select(album.name, track_number)
View(num.songs.on.album)


                

# Bonus: perform both of the steps above in one line (one statement)
num.album <- top.nelly %>%
  flatten %>%
  group_by(album.name) %>%
  summarise(n = n()) %>%
  arrange(-n)