# Code to reproduce models in 'Testing the 'pay-to-stay' hypothesis: The importance of helping behaviour on dispersal in yellow-bellied marmots (*Marmota flaviventer*)'
# By Kira Keith and Julien Martin

library(ybamaRmot)
library(usethis)
library(tidyverse)
library(lme4)
library(performance)
library(car)
library(effects)
library(ggeffects)
library(patchwork)

help <- read_csv("HelpingBehaviours.csv")

# Individual behaviours as additive effects
m1 <- glmer(disp_yn ~ (cdp + allo + ac)*sex + dam_pres + valley + (1|colony) + (1|year) + (1|litter_effect), data = help, family = binomial, control = glmerControl(optimizer = "bobyqa"))
summary(m1)
check_model(m1)

# Index model
m2 <- glmer(disp_yn ~ index*sex + dam_pres + valley + (1|year) + (1|litter_effect) + (1|colony), family = binomial, data = help, control = glmerControl(optimizer = "bobyqa"))
summary(m2)
check_model(m2)

