\name{hiv}
\alias{hiv}
\docType{data}
\title{hiv}
\description{
A study of 47 patients with similar profiles. Measurements on cd4 and cd8 levels
are displayed for each panel of patients having identical predictor profiles. Both
cd4 and cd8 have three levels. The data should be modeled as a grouped logistic model,
but may also be modeled as a count model depending on what a research wishes to
determine from the data.
}
\usage{data(hiv)}
\format{
  A data frame with 11 observations of grouped data with 4 variables.
  \describe{
    \item{\code{infec}}{1=Patient diagnosed with HIV; 0=not diagnosed with HIV}
    \item{\code{cases}}{number of patients for each patient profile}
    \item{\code{cd4}}{3 levels: 0, 1, and 2}
    \item{\code{cd8}}{3 levels: 0, 1, and 2}
    }
}

\details{
hiv is saved as a data frame.
}
\source{
Hilbe, Practical Guide to Logistic Regression, Chapman & Hall/CRC.
}
\references{
Hilbe, Joseph M (2015), Practical Guide to Logistic Regression, Chapman & Hall/CRC.
}
\examples{
# Not run
#data(hiv)
#table(hiv); hiv
#noinfec <- hiv$cases -  hiv$infec
#myhiv<- glm(cbind(infec, noinfec) ~  factor(cd4)  + factor#(cd8), family=binomial, data=hiv)
#summary(myhiv)
#mymodq <- glm( cbind(infec, noinfec) ~  factor(cd4)  + factor(cd8), family=quasibinomial, data=hiv)
#summary(mymodq)
#toOR(myhiv)
#End(Not run)

library(LOGIT)
data(hiv)
table(hiv); hiv
noinfec <- hiv$cases -  hiv$infec
response <- cbind(hiv$infec, noinfec)
myhiv<- glm(response ~  factor(cd4)  + factor(cd8), family=binomial, data=hiv)
summary(myhiv)

mymodq <- glm(response ~  factor(cd4)  + factor(cd8), family=quasibinomial, data=hiv)
summary(mymodq)

#library(sandwich)
#sqrt(diag(vcovHC(myhiv, type="HC0")))
toOR(myhiv)
}
\keyword{datasets}




