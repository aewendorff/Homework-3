################
###HOMEWORK 3###
################

# PART 1 -------------------------------------------------------------------------

#NUMBER 1#---
temp_C <- 18.5 
  #question 1, create vector for Celcius temp


#NUMBER 2#---
temp_F <- temp_C * 9/5 + 32  
  #question 2, convert to Fahrenheit


#NUMBER 3#---
print(paste0("The water temperature is ", temp_C, "°C", " (", temp_F, "°F)"))
  #paste0 separates elements with NO space as the default separation
  #you must add in spaces where you want them
  


# PART 2 ------------------------------------------------------------------

#NUMBER 1#---
species_counts <- c(Bluegill = 12, Bass = 7, Sunfish = 21, Carp = 3)
  #create vector with species count data


#NUMBER 2#---
sum(species_counts)
names(which.max(species_counts))
  #which.max() finds the position of max # in species_count
  #names() returns the name of the element associated with that position


#NUMBER 3#---
chla = matrix(c(50, 45, 48,  20, 25, 30,  1, 3, 5), 
       nrow = 3,
       ncol = 3,
       byrow = TRUE)
  #byrow in combination with rows of 3 means that r is reading in groups of 3
  #I added extra spaces to show what groupings of data will be in each row

rownames(chla) = c("Surface", "Mid", "Bottom")
  #add row name

colnames(chla) = c("Day 1", "Day 2", "Day 3")
  #add column name


#NUMBER 4#---
rowMeans(chla)
  #finds the mean of the rows
  #use colMeans() to find column means



# PART 3 ------------------------------------------------------------------

#NUMBER 1#---
lakes <- data.frame(lake = c("Mendota", "Wingra", "Monona", "Waubesa", "Kegonsa"),
                   temp_lake = c(22.4, 25.1, 23.7, 24.6, 26.0),
                   DO_mgL = c(8.3, 6.7, 7.5, 7.9, 6.2)
                   )


#NUMBER 2#---
mean(lakes[["temp_lake"]])
  #start with data.frame name
  #add [[]] around specific column name to extract the mean of just this element

mean(lakes[["DO_mgL"]])
  #OR
colMeans(lakes[,c(2,3)])
  #2 and 3 indicate what columns you want to average
  #must have [, at the start


#NUMBER 3#---
library(tidyverse)
lakes <- mutate(lakes, temp_lake_F = temp_lake * 9/5 + 32)
  #temp_lake_F is the new column mutate() creates in lakes
  #mutate() uses data from temp_lake to complete the function



# PART 4 ------------------------------------------------------------------

#NUMBER 1#---
number <- c(1:10)
for (x in number) {
  print(sqrt(x))
  }
  #square root every value ("x") in the number vector


#NUMBER 2#---
N0 <- 10
r <- 0.3
t <- c(1:10)
pop <- numeric(length(t))
  #create vectors for exp. growth equation (N0, r, t)
  #create empty vector "pop" to store information from for loop

for (time in t) {
  pop[time] <- (N0 * exp(r*time))
  }
  #specify pop[time], so that the answer for each time is added to the vector
  #Without this, only t = 9 will be saved


#NUMBER 3#---
phosphorus <- list(lake1 = c(5, 7, 10, 11),
                   lake2 = c(20, 26, 33, 30), 
                   lake3 = c(50, 50, 40, 42, 45), 
                   lake4 = c(15, 29, 19, 18, 10),
                   lake5 = c(37, 40, 44, 39, 36)
                   )
          
    
#NUMBER 4#---
lake_means <- numeric(length(phosphorus)) 
  #make empty vector that is the length of the phosphorus list (5)

for (i in seq_along(phosphorus)) {
  lake_means[i] <- mean(phosphorus[[i]])
  lake_name <- names(phosphorus)[i]
  print(paste0(lake_name, " mean phosphorus = ", lake_means[i], " μg/L"))
  }
  #line 1: seq_along() helps run for loops with lists more smoothly
       #it generates a seq of integars the length of phosphorus
       #must use it with "i"
  #line 2: find the mean for every i (index = lake) in phosphorus list
  #line 3: finds name of each i in phosphorus (each lake)
  #line 4: lake_means[i] tells r to take the value from each i not ALL the i's


#NUMBER 5#---
print(lake_means)



# PART 5 ------------------------------------------------------------------

#NUMBER 1#---
print(apply(chla, 1, mean))
  #the 1 specifies we are applying this function row-wise

print(apply(chla, 2, mean))
  #the 2 specifies we are applying this function column-wise


#NUMBER 2#---
print(apply(lakes, 2, range))


#NUMBER 3#---
pop_app <- lapply(t, function(time) {
  N0 * exp(r * time)
  })
  #lapply() makes a list
  #{} specify function
  #() after lapply specifies what vector is being used in the function

  #I felt the lapply code was easier to write and interpret (especially after revisiting it), but I like the look of the for loop results more (not a fan of the list). However, with lapply, it is quicker to find what mean came from which time point, so I can see the advantage in that.  