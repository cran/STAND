\name{cansdata}
\alias{cansdata}
\docType{data}
\title{Container Data Used To Evaluate Beryllium Surface Contamination}
\description{

Surface wipe samples obtained from containers that are used to
ship beryllium components.


}
\usage{data(cansdata)}

\format{
  A data frame with 120 observations on the following 4 variables:
  \describe{    
    \item{x}{ Surface wipe sample \eqn{\mu g/100cm^2} }
    \item{det}{ 1 if detect, 0 if non-detect}
    \item{strata}{ a factor with levels \code{A} and \code{B} }
    \item{sample}{ a factor with levels \code{1} and \code{2} }
    }
}
\details{ In a scoping survey, the investigator
decides to divide the survey unit into two strata: \code{A}, used recently,
and \code{B}, not used for several years.  The specified limit that is
used to determine if the survey unit is contaminated is
\eqn{L = 0.2\mu g/100cm^2}. 
An initial sample of n = 30 was obtained from each stratum (sample = 1).
  The initial survey produced discrepant results that were
hard to interpret.  A second sample of n = 30 surface wipe samples was
obtained from strata \code{A} and \code{B}.  Results below the limit of
quantification are reported as non-detects. 
}

\references{
Frome, E. L. and Wambach, P. F. (2005), " Statistical Methods and
Software for the Analysis of Occupational Exposure Data with
Non-Detectable Values," \emph{ORNL/TM-2005/52,Oak Ridge National
Laboratory}, Oak Ridge, TN 37830.
Available at: \url{http://www.csm.ornl.gov/esh/aoed/ORNLTM2005-52.pdf}
}

\examples{
data(cansdata)
#     subset container data into stratum A and stratum B
sa60 <- cansdata[ cansdata$st=="A",] ; Ia <- "Be Samples From  Stratum A"
sb60 <- cansdata[ cansdata$st=="B",] ; Ib <- "Be Samples From  Stratum B"
mle.sa60 <- unlist(lnorm.ml(sa60))  # MLEs for stratum A
mle.sb60 <- unlist(lnorm.ml(sb60)) 
#     print MLE for stratum A and B
round( data.frame(mle.sa60,mle.sb60),3)
#
# Q-Q plot for each stratum
par( mfcol=c(1,2) )
qq.lnorm(plend(sa60),mle.sa60[1,2],ylim=c(0.01,1.2),xlim=c(-0.5,2.5),main=Ia )
qq.lnorm(plend(sb60),mle.sb60[1,2],ylim=c(0.01,1.2),xlim=c(-0.5,2.5),main=Ib )
#   list all summary statistics by Strata
round(IH.summary(cansdata,L=0.2,bcol=3),4)
}
\keyword{datasets}
