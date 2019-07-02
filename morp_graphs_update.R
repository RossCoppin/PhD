library(tidyverse)
library(ggpubr)
library(magrittr)

# Morphologies
# L. pallida

# load data
lam <- read.csv("data/Laminaria_morphometrics.csv", sep = ",")

# remove unnecessary columns
lam <- subset(lam, select = -c(1,2,4))

# alter dataframe for more friendly plotting
lam_gather <- gather(lam, "Morphology", "Measurement", 2:10, na.rm = TRUE)

# Replace morphology names
lam_gather <- lam_gather %>%
  mutate(Morphology = replace(Morphology, 
                              Morphology == "digits", "Number of digits")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "laminaLength", "Lamina length (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "laminaThickness", "Lamina thickness (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "laminaWeight", "Lamina weight (g)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "stipeDiameter", "Stipe diameter (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "stipeLength", "Stipe Length (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "stipeMass", "Stipe mass (g)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "thallusMass", "Thallus mass (g)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "totalLength", "Total length (mm)"))
# Order site names by location west to east
positionsLam <- c("Betty's Bay", "Roman Rock","A-Frame", "Miller's Point", "Baboon Rock", 
                  "Batsata Rock", "Buffels Bay","Bordjies North","Olifantsbos", "Kommetjie", "Sea Point")

# Visualize: Specify the comparisons you want
my_comparisons <- list( c("Sea Point", "Kommetjie"), c("Kommetjie", "Olifantsbos"), c("Olifantsbos", "Bordjies North"),c("Bordjies North", "Buffels Bay"), c("Buffels Bay", "Batsata Rock"), c("Batsata Rock", "Baboon Rock"), c("Baboon Rock", "Miller's Point"), c("Miller's Point", "A-Frame"), c("A-Frame", "Roman Rock"), c("Roman Rock", "Betty's Bay"))

# Create list for significance symbols
symnum_args <- list(cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 1), symbols = c("****", "***", "**", "*", "ns"))

# Script to create boxplots for each morphological characteristic seperatley for L. pallida
morph_lam_LW <- ggboxplot(lam, x = "site", y = "laminaWeight",
          palette = "jco", xlab = FALSE, ylab = "Lamina Weight (g)", order = positionsLam, notch = TRUE) +
  stat_compare_means(comparisons = my_comparisons, paired = FALSE, symnum.args = symnum_args, hide.ns = TRUE) + 
  stat_compare_means(label.y = 50) 
morph_lam_LW <- ggpar(morph_lam_LW, ylim = c(0, 5), x.text.angle = 90)
morph_lam_LW
  
# Script to create boxplots for all morpholgical characteristics at once for L. pallida
morph_lam <- ggboxplot(lam_gather, x = "site", y = "Measurement", notch = TRUE, order = positionsLam) + 
  stat_compare_means(comparisons = my_comparisons, symnum.args = symnum_args, hide.ns = TRUE)
morph_lam <- ggpar(morph_lam, x.text.angle = 90)
morph_lam <- facet(morph_lam, facet.by = "Morphology", scales = "free_y")
morph_lam

# E. maxima 

# load data
eck <- read.csv("data/Ecklonia_morphometrics.csv", sep = ",")

# remove unnecessary columns
eck <- subset(eck, select = -c(1,2,3,5,7,8))

# alter dataframe for more friendly plotting
eck_gather <- gather(eck, "Morphology", "Measurement", 2:12, na.rm = TRUE)

# Replace morphology names
eck_gather <- eck_gather %>%
  mutate(Morphology = replace(Morphology, 
                              Morphology == "depth", "Depth (m)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "epiLength", "Epiphyte length (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "frondLength", "Frond length (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "frondMass", "Frond mass (g)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "primaryLength", "Primary length (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "primaryWidth", "Primary width (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "stipeCirc", "Stipe circumference (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "stipeLength", "Stipe length (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "stipeMass", "Stipe mass (g)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "totalLength", "Total length (mm)")) %>% 
  mutate(Morphology = replace(Morphology, 
                              Morphology == "tufts", "Number of tufts"))


positionsEck <- c("Betty's Bay", "Kalk Bay", "A-Frame",  "Miller's Point", "Baboon Rock", "Batsata Rock", "Buffels Bay", "Scarborough", "Soetwater","Kommetjie","Hout Bay", "Oudekraal", "St. Helena Bay")

# Visualize: Specify the comparisons you want
my_comparisons <- list( c("St. Helena Bay", "Oudekraal"), c("Oudekraal", "Hout Bay"), c("Hout Bay", "Kommetjie"),c("Kommetjie", "Soetwater"), c("Soetwater", "Scarborough"), c("Scarborough", "Buffels Bay"), c("Buffels Bay", "Batsata Rock"), c("Batsata Rock", "Baboon Rock"), c("Baboon Rock", "Miller's Point"), c("Miller's Point", "A-Frame"), c("A-Frame", "Kalk Bay"), c("Kalk Bay", "Betty's Bay"))

# Script to create boxplots for all morpholgical characteristics at once for E. maxima
morph_eck <- ggboxplot(eck_gather, x = "site", y = "Measurement", notch = TRUE, order = positionsEck) + 
  stat_compare_means(comparisons = my_comparisons, symnum.args = symnum_args, hide.ns = TRUE)
morph_eck <- ggpar(morph_eck, x.text.angle = 90)
morph_eck <- facet(morph_eck, facet.by = "Morphology", scales = "free_y")
morph_eck


