\name{badhealth}
\alias{badhealth}
\docType{data}
\title{badhealth}
\description{A study of 1127 patients in which only three variables have been
selected. The data may be evaluated as a logistic or other binary response model
with the binary variable "badh" as the response. It may also be modeled as a count
model with "numvisit" (number of visits to a physician during the year) as the
response. "age" is an adjustor, and should be centered or standardized when
used in the model.

}
\usage{data(badhealth)}
\format{
  A data frame with 1127 observations with 3 variables.
  \describe{
    \item{\code{numvisit}}{Number of visits to a physician during the year: 0 - 40}
    \item{\code{badh}}{0=patient evaluates self as in good health; 1=patient in bad health}
    \item{\code{age}}{patient age: 20 - 60}
    }
}
\details{
badhealth is saved as a data frame.
}
\source{
Hilbe, Practical Guide to Logistic Regression, Chapman & Hall/CRC
}
\references{
Hilbe, Joseph M (2015), Practical Guide to Logistic Regression, Chapman & Hall/CRC
}
\examples{
library(LOGIT)
data(badhealth)
age.std <- scale(badhealth$age)
summary(myhealth<- glm(badh ~  numvisit + age.std, family=binomial, data=badhealth))
toOR(myhealth)

% if LOGIT package not available
%load("c://GUIDE-LOGISTIC-REGRESSION/Data/badhealth.rdata")
%bh <- badhealth
%head(bh)
%age.std <- scale(bh$age)
%summary(issick<- glm(badh ~  numvisit + age.std, family=binomial, #data=bh))
%source("c://GUIDE-LOGISTIC-REGRESSION/Functions/toOR.r")
%toOR(issick)
}
\keyword{datasets}




