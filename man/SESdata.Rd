\name{SESdata}
\alias{SESdata}
\docType{data}
\title{Samples from Elevated Surfaces of a Smelter }

\description{The Department of Energy (DOE) Chronic Beryllium
Disease Prevention Program is concerned with monitoring
objects (e.g., equipment, buildings) for beryllium contamination and
workers for exposure to beryllium in the workplace.  

The SESdata is the results of a survey to evaluate possible beryllium
contamination based on 31 surface wipe samples from elevated surfaces (SES) 
of a smelter at a DOE facility. For equipment that is being evaluated for release to
the public, or for non beryllium use, the DOE has established a release
limit for removable beryllium contamination of \eqn{ 0.2 \mu g/100cm^2}. 
}

\usage{data(SESdata)}
\format{
  A data frame with 31 observations on the following 2 variables
  \describe{   
    \item{x}{ beryllium \eqn{\mu g/100cm^2} }
    \item{detect}{ 0 if non-detect; 1 if detected }
    }
}

\details{Statistics of interest are the exceedance fraction and 
the 95th percentile. The exceedance fraction is an estimate of the
percentage of surface area that is expected to exceed the release
limit Lp = 0.2 \eqn{\mu g/100cm^2} with p = 0.95.  Both the point estimate and
the UCL for F exceed Fo = 100 (1-p) = 5\%, indicating that the equipment
is not acceptable.  In fact, at the 95% LCL indicates that at the 95%
confidence level at least 19.5\% of the surface area exceeds the
release limit.  

A more detailed description and analysis of this data is given as Example 1
in Section 4 of Frome and Wambach (2005)}

\references{
Frome, E. L. and Wambach, P. F. (2005), "Statistical Methods and Software for 
the Analysis of Occupational Exposure Data with Non-Detectable Values," 
\emph{ORNL/TM-2005/52,Oak Ridge National Laboratory}, Oak Ridge, TN 37830.
Available at: \url{http://www.csm.ornl.gov/esh/aoed/ORNLTM2005-52.pdf} 
}
\examples{
data(SESdata)
mle.ses <- unlist(lnorm.ml(SESdata)) # ML for SESdata
print(mle.ses[1:4])  #  ML estimates of parameters
print(mle.ses[5:8])  #  Standard errors of ML estimates
#  Next line produces a lognormal q-q plot with ML line 
qq.lnorm(plend(SESdata),mle.ses[1],mle.ses[2])
title("Lognormal Q-Q plot For SESdata  Example 1 in ORNLTM2005-52")
unlist(efraction.ml(SESdata,gam=0.95,L=0.2))   #  MLE of exceedance fraction and CLs
unlist(percentile.ml(SESdata,p=0.95,gam=0.95)) #  MLE of 95 percentile and CLs

}
\keyword{datasets}
