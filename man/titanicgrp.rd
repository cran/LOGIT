\name{titanicgrp}
\alias{titanicgrp}
\docType{data}
\title{titanicgrp}
\description{
The data is an grouped version of the 1912 Titanic passenger survival
log,
}
\usage{data(titanicgrp)}
\format{
  A data frame with 12 observations on the following 5 variables.
  \describe{
    \item{\code{survive}}{number of passengers who survived}
    \item{\code{cases}}{number of passengers with same pattern of covariates}
    \item{\code{age}}{1=adult; 0=child}
    \item{\code{sex}}{1=male; 0=female}
    \item{\code{class}}{ticket class 1= 1st class; 2= second class; 3= third class}
   }
}
\details{
titanicgrp is saved as a data frame.
Used to assess risk ratios
}
\source{
Found in many other texts
}
\references{
Hilbe, Joseph M (2015), Practical Guide to Logistic Regression, Chapman & Hall/CRC.

Hilbe, Joseph M (2014), Modeling Count Data, Cambridge University Press.

Hilbe, Joseph M (2007, 2011), Negative Binomial Regression, Cambridge University Press.

Hilbe, Joseph M (2009), Logistic Regression Models, Chapman & Hall/CRC.
}
\examples{
library(MASS)   # if not automatically loaded

# LOGISTIC REGRESSION
library(LOGIT)
data(titanicgrp)
tg <- titanicgrp
head(tg)
tg$died <- tg$cases - tg$survive
summary(mylr <- glm( cbind(survive, died) ~ age + sex + factor(class),
                family=binomial, data=tg))
toOR(mylr)
P__disp(mylr)

# SCALED LOGISTIC REGRESSION
summary(myqr <- glm( cbind(survive, died) ~ age + sex + factor(class),
                family=quasibinomial, data=tg))
toOR(myqr)


# POISSON REGRESSION
# library(COUNT)
data(titanicgrp)
titanicgrp$class <-  as.factor(titanicgrp$class)
titanicgrp$logcases <- log(titanicgrp$cases)
glmpr <- glm(survive ~ age + sex + class + offset(logcases), family= poisson, data=titanicgrp)
summary(glmpr)
exp(coef(glmpr))

#lcases <- log(titanicgrp$cases)
#nb2o <- nbinomial(survive ~ age + sex + factor(class),
#                                        formula2 =~ age + sex,
#                                        offset = lcases,
#                                        mean.link="log",
#                                        scale.link="log_s",
#                                        data=titanicgrp)
#summary(nb2o)
#exp(coef(nb2o))

}

\keyword{datasets}
