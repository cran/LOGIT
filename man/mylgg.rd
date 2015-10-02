\name{mylgg}
\alias{mylgg}
\docType{data}
\title{mylgg}
\description{
The data has 11 grouped observations and 6 variables. Grouped
subset of medpar data.
}
\usage{data(mylgg)}
\format{
  A data frame with 11 observations with the following 6 variables.
  \describe{
    \item{\code{white}}{0=identified as non-white; identified as white}
    \item{\code{hmo}}{0=patient not an HMO member; 1=patient member of HMO}
    \item{\code{type}}{Type of admission: 1=elective;2=urgent; 3=emergency}
    \item{\code{alive}}{# patients alive per patient profile}
    \item{\code{dead}}{# patients died within 48 hrs admit per patient profile}
    \item{\code{m}}{# patients in each patient profile (same predictor values)}
   }
}
\details{
mylgg is saved as a data frame.
Used to assess odds ratios and predict survival folllowing surgery
}
\source{
Subset of medpar data, grouped format.
}
\references{
Hilbe, Joseph M (2015), Practical Guide to Logistic Regression, Chapman & Hall/CRC.

Hilbe, Joseph M (2009), Logistic Regression Models, Chapman & Hall/CRC.
}
\examples{
library(MASS)   # if not automatically loaded
# LOGISTIC REGRESSION
library(LOGIT)
data(mylgg)
mylgg
summary(lg <- glm(cbind(alive, dead) ~ white + hmo + factor(type),
                family=binomial, data=mylgg))
toOR(lg)
P__disp(lg)

}

\keyword{datasets}
