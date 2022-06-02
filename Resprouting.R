## set up packages

library(lme4)
library(ggplot2)
library(dplyr)

## set up data
gipdata <- read.csv("~/Documents/MacBook/Masters/Project/R/ResproutingEDA/gippsland_partial_dataset.csv")


## filter out individuals that did not resprout epicormically
gipepicormics <- gipdata %>%
  filter(gipdata$Epicormic.resprouting == 1)

gipresp <- gipepicormics %>%
  mutate(respprop = (gipepicormics$MaxR..m. - gipepicormics$MinR1..m.)/ gipepicormics$Height..m....Nikon.forestry)

ggplot(gipresp , aes(x = gipresp$DBH..cm., y = gipresp$respprop , colour = Species)) +
  geom_point(alpha=0.8) +
  theme_bw() +
  facet_wrap(~Species) +
  scale_x_continuous(expand = c(0,0)) +
  xlab("Diameter at Breast Height (cm)") +
  ylab("Proportion of trunk covered by epicormic resprouting")

ggplot(gipresp , aes( x = gipresp$Height..m....Nikon.forestry , colour = Species)) +
  geom_linerange(aes(ymin = gipresp$MinR1..m. , ymax = gipresp$MaxR..m. )) +
  theme_bw() +
  facet_wrap(~Species) +
  scale_x_continuous(expand = c(0,0)) +
  geom_abline(intercept = 0 , slope = 1)

ggplot(gipresp , aes( x = gipresp$Height..m....Nikon.forestry , colour = Species)) +
  geom_linerange(aes(ymin = gipresp$MinR1..m. , ymax = gipresp$MaxR..m. )) +
  theme_bw() +
  scale_x_continuous(expand = c(0,0)) +
  geom_abline(intercept = 0 , slope = 1)



ggplot(gipnew , aes(x = gipnew$DBH..cm., y = gipnew$Resprouting.proportion , colour = Species)) +
  geom_point(alpha=0.8) +
  theme_bw() +
  facet_wrap(~Species) +
  scale_x_continuous(expand = c(0,0)) +
  xlab("Diameter at Breast Height (cm)") +
  ylab("Proportion of trunk obscured by greenness")

