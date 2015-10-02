\name{R84}
\alias{R84}
\docType{data}
\title{R84}
\description{
German health reform data for the year 1984. Subset of a multiyear
registry evaluating differences in physician provider utilization
prior to and after health reform legislation in the late 1980s.
R84 is identical to rwn1984.
}
\usage{data(R84)}
\format{
  A data frame with 3,874 observations on the following 15 variables.
  \describe{
   \item{\code{outwork}}{out of work=1; 0=working}
   \item{\code{docvis}}{number of visits to doctor during year (0-121)}
   \item{\code{hospvis}}{number of days in hospital during year (0-51)}
   \item{\code{edlevel}}{educational level (categorical: 1-4)}
   \item{\code{age}}{age: 25-64}
   \item{\code{female}}{female=1; 0=male}
   \item{\code{married}}{married=1; 0=not married}
   \item{\code{kids}}{have children=1; no children=0}
   \item{\code{hhninc}}{household yearly income in marks (in Marks)}
   \item{\code{educ}}{years of formal education (7-18)}
   \item{\code{self}}{self-employed=1; not self employed=0}
   \item{\code{edlevel1}}{(1/0) not high school graduate}
   \item{\code{edlevel2}}{(1/0) high school graduate}
   \item{\code{edlevel3}}{(1/0) university/college}
   \item{\code{edlevel4}}{(1/0) graduate school}
  }
}
\details{
R84 is saved as a data frame. The data is typically used to model
docvis, which is a count variable. It also may be used to model "outwork",
a variable indicating if a patient is out-of-work. "outwork" is a binary
variable which can be used as the response of a logistic or other binary
response model. R84 is identical to rwm1984.
}
\source{
German Health Reform Registry for the year 1984, in Hilbe and Greene (2007)
}
\references{
Hilbe, Joseph M (2009), Logistic Regression Models, Chapman & Hall/CRC.

Hilbe, Joseph M (2015), Practical Guide to Logistic Regression, Chapman & Hall/CRC.

Hilbe, Joseph M (2011), Negative Binomial Regression, 2nd ed., Cambridge University Press.

Hilbe, Joseph M (2014), Modeling Count Data, Cambridge University Press.

Hardin & Hilbe  (2013), Generalized Linear Models & Extensions, 3rd ed, Stata Press.
}
\examples{
# library(MASS)   if not automatically loaded
library(LOGIT)
# library(COUNT)  R84 also in COUNT pacakge, but not toOR or P_disp
data(R84)
# center both docvis and age
R84$cage <- R84$age - mean(R84$age)
R84$cdoc <- R84$docvis - mean(R84$docvis)
glmrp <- glm(outwork ~ cdoc + female + kids + cage + factor(edlevel),
             family=binomial, data=R84)
summary(glmrp)
exp(coef(glmrp))
toOR(glmrp)
}
\keyword{datasets}
