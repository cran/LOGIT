\name{medpar}
\alias{medpar}
\docType{data}
\title{medpar}
\description{
The US national Medicare inpatient hospital database is referred to as the Medpar data,
which is prepared yearly from hospital filing records. Medpar files for each state are also
prepared. The full Medpar data consists of 115 variables. The national Medpar has some
14 million records, with one record for each hospilitiztion. The data in the medpar file comes
from 1991 Medicare files for the state of Arizona. The data are limited to only one diagnostic
group (DRG 112). Patient data have been randomly selected from the original data.
}
\usage{data(medpar)}
\format{
  A data frame with 1495 observations on the following 10 variables.
  \describe{
    \item{\code{los}}{length of hospital stay}
    \item{\code{hmo}}{Patient belongs to a Health Maintenance Organization, binary}
    \item{\code{white}}{Patient identifies themselves as Caucasian, binary}
    \item{\code{died}}{Patient died, binary}
     \item{\code{age}}{Patient age range, categorical}
    \item{\code{age80}}{Patient age 80 and over, binary}
    \item{\code{type}}{Type of admission, categorical}
    \item{\code{type1}}{Elective admission, binary}
    \item{\code{type2}}{Urgent admission,binary}
    \item{\code{type3}}{Elective admission, binary}
    \item{\code{provnum}}{Provider ID}
  }
}
\details{
medpar is saved as a data frame.
Count models use los as response variable. 0 counts are structurally excluded. The
data is also used to predict death as well as to understand the predictors which
bear on the death of a patient while in the hospital following surgery.
}
\source{
1991 National Medpar data, National Health Economics & Research Co.
}
\references{
Hilbe, Joseph M (2015), Practical Guide to Logistic Regression, Chapman & Hall/CRC.

Hilbe, Joseph M (2014), Modeling Count Data, Cambridge University Press.

Hilbe, Joseph M (2007, 2011), Negative Binomial Regression, Cambridge University Press.

Hilbe, Joseph M (2009), Logistic Regression Models, Chapman & Hall/CRC.

first used in Hardin, JW and JM Hilbe (2001, 2007), Generalized Linear Models and Extensions, Stata Press.
}
\examples{
# library(MASS)  if not automatically loaded

# medpar in both LOGIT and COUNT packages
library(LOGIT)
data(medpar)
glmb <- glm( died ~ los + hmo + white + factor(type), family=binomial, data=medpar)
summary(glmb)
toOR(glmb)

library(LOGIT)
data(medpar)
summary(glmpb <- glm( died ~ los + hmo + white + factor(type),
                family=binomial(link=probit), data=medpar))

library(LOGIT)     # or library(COUNT)
data(medpar)
medpar$los<-as.numeric(medpar$los)
glmpb <- glm(los ~ hmo + white + factor(type), family=poisson, data=medpar)
summary(glmpb)
exp(coef(glmpb))
toRR(glmpb)

#library(COUNT)    # nbinomial in both COUNT and msme packages
#data(medpar)
#nb2 <- nbinomial(los ~ hmo + white + factor(type), data=medpar)
#summary(nb2)
#exp(coef(nb2))

#library(LOGIT)    # or library(COUNT)
#data(medpar)
#glmnb <- glm.nb(los ~ hmo + white + factor(type), data=medpar)
#summary(glmnb)
#exp(coef(glmnb))
#toRR(glmnb)

}
\keyword{datasets}
