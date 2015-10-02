\name{jhbayes}
\alias{jhbayes}

\title{
 Two functions to provide better JAGS model output
}
\description{
For use with JAGS from within the R environment. Provides a nicer model
output than comes with the default JAGS output.
}

\usage{
#source("jhbayes.r")
}

\arguments{
  \item{x}{
Variable arguments based on model}
}

\details{
Load jhbayes.r prior to running JAGS model. MyBUGSOutput and uNames functions
will then be in memory. From Alain Zuur support files on highstat.com.
}

\references{
Hilbe, Joseph M. (2015), Practical Guide to Logistic Regression, Chapman & Hall/CRC,
   page 137-143.

Zuur, A.F., Hilbe, J.M., and Ieno, E.N. (2013), A Beginner's Guide to
   GLM and GLMM with R: a frequentist and Bayesian perspective for ecologists,
   Highlands.
}

\author{
Alain F. Zuur, Highlands Statistics, UK. highstat@highstat.com
Joseph M. Hilbe, Arizona State University, and
    Jet Propulsion Laboratory, California Institute of technology
    hilbe@asu.edu
}
\note{
jhbayes.r must be loaded into memory in order to be effectve. Use the source
function or paste into R editor. Code is 23 lines in length.
}

%\seealso{
%\code{\link{JAGS}}
%}

\examples{
#library(R2jags)
#library(LOGIT)
#data(medpar)
#JAGS code with J0 as MCMC algorithm
#  out <- J0$BUGS$output
#  myB <- MyBUGSOutput(out, c(uNames("beta", K), "LogL", "AIC", "BIC"))
#  round(myB, 4)
}

\keyword{ models }
