\name{azheart}
\alias{azheart}
\docType{data}
\title{azheart}
\description{
Random subset of 34 patients from the 1991 Arizona Medicare data for patients
hospitalized subsequent to undergoing a CABG (DRGs 106, 107) or PTCA (DRG 112)
cardiovascular procedure.
}
\usage{data(azheart)}
\format{
  A data frame with 34 observations on the following 6 variables.
  \describe{
    \item{\code{died}}{1=died as a result of surgery; 0=not died}
    \item{\code{procedure}}{1=CABG; 0=PTCA}
    \item{\code{age}}{age of subject}
    \item{\code{gender}}{1=Male; 0=Female}
    \item{\code{los}}{hospital length of stay}
    \item{\code{type}}{1=emerg/urgent admission; 0=elective admission}
    }
}
\details{
azheart is saved as a data frame.
}
\source{
Hilbe, Practical Guide to Logistic Regression, Chapman & Hall/CRC
}
\references{
Hilbe, Joseph M (2015), Practical Guide to Logistic Regression, Chapman & Hall/CRC
}
\examples{
library(LOGIT)
#library(COUNT)
data(azheart); attach(azheart)
table(los); table(procedure, type); table(los, died)
summary(los)
summary(mymod <- glm(died ~ procedure + type + los, family=binomial, data=azheart))
#modelfit(mymod)
summary(mymodq <- glm(died ~ procedure+ type  + los, family=quasibinomial, data=azheart))
#modelfit(mymodq)
#library(sandwich)
#sqrt(diag(vcovHC(mymod, type="HC0")))
toOR(mymod)
}
\keyword{datasets}




