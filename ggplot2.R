
library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("fc4d95a6-591f-411f-af17-327e6c5d03c7")
package

# get all resources for this package
resources <- list_package_resources("fc4d95a6-591f-411f-af17-327e6c5d03c7")

# identify datastore resources; by default, Toronto Open Data sets datastore 
#resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()

data2 <- data %>%
  select(Neighbourhood,Assault_AVG,
         AutoTheft_AVG,
         BreakandEnter_AVG,
         Homicide_AVG,
         Robbery_AVG,
         TheftOver_AVG)

data.frame(data2)


library(ggplot2)

ggplot(data2, aes(x=Neighbourhood, y=Assault_AVG)) + 
  geom_bar(stat='identity')
  
ggplot(data2, aes(x=Neighbourhood, y=AutoTheft_AVG)) + 
  geom_bar(stat='identity')

ggplot(data2, aes(x=Neighbourhood, y= BreakandEnter_AVG)) + 
  geom_bar(stat='identity')


ggplot(data2, aes(x=Neighbourhood, y=Homicide_AVG)) + 
  geom_bar(stat='identity')

ggplot(data2, aes(x=Neighbourhood, y=Robbery_AVG)) + 
  geom_bar(stat='identity')

ggplot(data2, aes(x=Neighbourhood, y=TheftOver_AVG)) + 
  geom_bar(stat='identity')


group_by(data2,Neighbourhood)%>%
  summarise(max(Assault_AVG))



