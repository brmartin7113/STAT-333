#install.packages("tidyverse")
#install.packages("palmerpenguins")
#install.packages("ggthemes")

library(tidyverse)
library(palmerpenguins)
library(ggthemes)

#A dataframe
data(penguins)
penguins

#Plotting penguins
penguins %>% 
  ggplot() #What happens?
#Nothing happens because we did not define a plot structure
penguins %>% 
  ggplot(aes(x=flipper_length_mm,y=body_mass_g)) #Closer!
#We have a graph and labels, but no data is being represented on this graph
penguins %>% 
  ggplot(aes(x=flipper_length_mm,y=body_mass_g)) + 
  geom_point()
#Now we have data being represented on the graph via the geom_point()
#color by species

penguins %>% 
  ggplot(aes(x=flipper_length_mm,y=body_mass_g,color=species)) + 
  geom_point()

#Relationships

penguins %>% 
  ggplot(aes(x=flipper_length_mm,y=body_mass_g,color=species)) + 
  geom_point() + 
  geom_smooth(method="lm",se=F)

#Cleaner
penguins %>% 
  ggplot(aes(x=flipper_length_mm,y=body_mass_g)) + 
  geom_point(aes(color=species,shape=species)) + 
  geom_smooth(method="lm",se=F) + 
  labs(title="Body mass and flipper length",
       x = "Flipper length (mm)",
       y="Body mass (g)",
       color="Species",
       shape="Species") + 
  scale_color_colorblind() + 
  theme_bw()


#R is a giant calculator
2+3^2.5

#Can do operations on vectors
primes <- c(2,3,5,7,11,13)
primes *2
primes-1

#functions in R

seq(from = 1, to = 10)


#Errors
x<-"hello"


#Operations on dataframes
#install.packages("nycflights13")
library(nycflights13)
data(flights)
glimpse(flights)

flights %>%
  filter(dest == "IAH")

flights %>% 
  filter(dest == "IAH") %>%
  group_by(year,month,day)


flights %>% 
  filter(dest == "IAH") %>%
  group_by(year,month,day) %>%
  summarize(arr_delay=mean(arr_delay))

flights %>% 
  filter(dest == "IAH") %>%
  group_by(year,month,day) %>%
  summarize(arr_delay=mean(arr_delay,na.rm = T))

#error


flights %>% 
  filter(dest = "IAH") %>%
  group_by(year,month,day) %>%
  summarize(arr_delay=mean(arr_delay,na.rm = T))


#Define new dataframe

delays <- 
  flights %>% 
  filter(dest == "IAH") %>%
  group_by(year,month,day) %>%
  summarize(arr_delay=mean(arr_delay,na.rm = T))



#mutate

flights_mut <- flights %>%
  mutate(gain = dep_delay-arr_delay,
         .before = 1)

flights_mut


#Reading data from other sources

auto_bi <- read_csv("https://instruction.bus.wisc.edu/jfrees/jfreesbooks/Regression%20Modeling/BookWebDec2010/CSVData/AUTOBIsim.csv")


auto_bi <- read_csv("AUTOBIsim.numbers")


