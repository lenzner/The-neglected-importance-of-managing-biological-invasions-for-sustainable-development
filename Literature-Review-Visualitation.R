#=======================================================================================#
# The neglected importance of managing biological invasions for sustainable development #
# Visualization of the literature review in Web of Science                              #
# Bernd Lenzner                                                                         #
# bernd.lenzner@univie.ac.at                                                            #
#=======================================================================================#

# Documentation
## Literature search in Web of Science for alien species related literature
### Keywords used
### ecological invasion* OR biological invasion* invasion* biology OR invasion* ecology OR invasive species OR alien species OR nonnative species OR non-native species OR nonindigenous species OR non-indigenous species OR allochthonous species OR exotic species OR invader* OR introduced species
### Search date: 2023-09-21
datum = Sys.Date() # Set date ----

#==============================================================================#
# Packages ----
library(tidyverse)

#==============================================================================#
# Dataset ----
path <- "" # Set directory path
data <- read.csv(paste0(path,"2023-10-03-WOS-SDG-Invasives.csv"),
                 sep = ",",
                 header = T,
                 stringsAsFactors = F)
head(data)

#==============================================================================#
# Data preparation ----
# Define colors for the different SDGs ----
sdg.col <- c("#e5243b", # color SDG 1
             "#DDA63A", # color SDG 2
             "#4C9F38", # color SDG 3
             "#C5192D", # color SDG 4
             "#FF3A21", # color SDG 5
             "#26BDE2", # color SDG 6
             "#FCC30B", # color SDG 7
             "#A21942", # color SDG 8
             "#FD6925", # color SDG 9
             "#DD1367", # color SDG 10
             "#FD9D24", # color SDG 11
             "#BF8B2E", # color SDG 12
             "#3F7E44", # color SDG 13
             "#0A97D9", # color SDG 14
             "#56C02B", # color SDG 15
             "#00689D")


dat.indiv <- data %>%
  filter(from == to) %>%
  mutate(mycolors = sdg.col)

dat.connect <- data %>%
  mutate(mycolors = c(rep("#e5243b",16), # color SDG 1
                       rep("#DDA63A",16), # color SDG 2
                       rep("#4C9F38",16), # color SDG 3
                       rep("#C5192D",16), # color SDG 4
                       rep("#FF3A21",16), # color SDG 5
                       rep("#26BDE2",16), # color SDG 6
                       rep("#FCC30B",16), # color SDG 7
                       rep("#A21942",16), # color SDG 8
                       rep("#FD6925",16), # color SDG 9
                       rep("#DD1367",16), # color SDG 10
                       rep("#FD9D24",16), # color SDG 11
                       rep("#BF8B2E",16), # color SDG 12
                       rep("#3F7E44",16), # color SDG 13
                       rep("#0A97D9",16), # color SDG 14
                       rep("#56C02B",16), # color SDG 15
                       rep("#00689D",16)), # color SDG 16
          mycolors2 = rep(sdg.col, 16)
         )



# Barplot with proportion of considered other targets ----
dat.connect$fromSDG <- as.character(gsub("[^0-9.-]", "", dat.connect$from))

x11()
ggplot(dat.connect, aes(fill=to, y=n, x=fromSDG)) + 
  geom_bar(position="stack", stat="identity") +
  scale_fill_manual(values = dat.connect$mycolors2) +
  #scale_fill_viridis(discrete = T) +
  #ggtitle("Studying 4 species..") +
  theme_bw() +
  #theme(legend.position = "none")
  xlab("Sustainable Development Goals") +
  ylab("")



