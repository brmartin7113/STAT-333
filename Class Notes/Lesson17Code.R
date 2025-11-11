library(faraway)
data(wcgs)
wcgs%>%group_by(chd)%>%
  summarize(counts=n(), avg_age=mean(age),
            avg_weight=mean(weight),
            avg_cigs=mean(cigs))

wcgs%>%
  ggplot(aes(x=weight,y=height))+
  geom_point(alpha=0.2, position=position_jitter())+
  facet_grid(~chd)

oneGLM <- glm(chd~cigs+weight, family=binomial(link="logit"), data=wcgs)
summary(oneGLM)
nullGLM <- glm(chd~1, family=binomial(link="logit"), data=wcgs)
summary(nullGLM)
deviance(nullGLM)-deviance(oneGLM)
anova(nullGLM, oneGLM, test="Chi")
1+pchisq(deviance(nullGLM)-deviance(oneGLM), length(wcgs$age)-3)
