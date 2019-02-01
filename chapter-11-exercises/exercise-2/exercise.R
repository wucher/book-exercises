# Exercise 2: working with `dplyr`
# Note that this exercise repeats the analysis from Exercise 1, but should be
# performed using `dplyr` (do not directly access or manipulate the data frames)

# Install and load the "fueleconomy" package
# install.packages("devtools")
# devtools::install_github("hadley/fueleconomy")
library(fueleconomy)

# Install and load the "dplyr" library
install.packages("dplyr")
library("dplyr")

# Select the different manufacturers (makes) of the cars in this data set. 
# Save this vector in a variable
makes <- vehicles %>% 
  select(make)

# Use the `distinct()` function to determine how many different car manufacturers
# are represented by the data set
nrow(distinct(vehicles, make))

# Filter the data set for vehicles manufactured in 1997
vehicles_1997 <- vehicles %>%
  filter(year == "1997")


# Arrange the 1997 cars by highway (`hwy`) gas milage
# Hint: use the `order()` function to get a vector of indices in order by value
# See also:
# https://www.r-bloggers.com/r-sorting-a-data-frame-by-the-contents-of-a-column/


# Mutate the 1997 cars data frame to add a column `average` that has the average
# gas milage (between city and highway mpg) for each car
vehicles_updated <- vehicles_1997 %>% 
  mutate(
    average = cty + hwy / 2
  )
# Filter the whole vehicles data set for 2-Wheel Drive vehicles that get more
# than 20 miles/gallon in the city. 
# Save this new data frame in a variable.
more_than_20 <- vehicles %>%
  filter(drive == "2-Wheel Drive" & cty > 20)

# Of the above vehicles, what is the vehicle ID of the vehicle with the worst 
# hwy mpg?
# Hint: filter for the worst vehicle, then select its ID.
worst_vehicle <- more_than_20 %>%
  filter(hwy == min(hwy)) %>% 
  select(id)

# Write a function that takes a `year_choice` and a `make_choice` as parameters, 
# and returns the vehicle model that gets the most hwy miles/gallon of vehicles 
# of that make in that year.
# You'll need to filter more (and do some selecting)!
most_hwy_mpg <- function(year_choice, make_choice) {
  vehicles %>% 
  filter(year_choice == year & make_choice == make) %>% 
  filter(hwy == max(hwy)) %>% 
  select(model)
}

  
  
# What was the most efficient Honda model of 1995?
most_hwy_mpg("1995", "Honda")
