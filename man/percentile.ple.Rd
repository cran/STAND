\name{percentile.ple}
\alias{percentile.ple}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Calculate Nonparametric Estimate of Xp and Confidence Limits }
\description{
Find Xp, the 100p\emph{th} percentile, and the  \eqn{100\gamma}\%
nonparametric confidence limits from PLE of F(x).
}
\usage{
percentile.ple(dd, p = 0.95, gam = 0.95, interp = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dd}{ An n by 2 matrix or data frame with \cr
    x (exposure) variable in column 1, and \cr
    det= 0 for non-detect or 1 for detect in column 2 }
  \item{p}{ Find x such that the PLE of F(x) = \code{p}. Default 0.95 }
  \item{gam}{ one-sided confidence level \eqn{\gamma}. Default is 0.95 }
  \item{interp}{ if \code{interp} is \code{TRUE} use linear interpolation. Default \code{TRUE} }
 
}
\details{
Find Xp the 100p\emph{th} percentile and confidence limits from the
PLE of F(x) -- see \code{\link{plekm}} for additional details.
If interp is \code{TRUE} use linear interpolation; otherwise, the upper confidence
limit (UCL) for Xp, UX(\code{p},\eqn{\gamma}), is the smallest value of \eqn{x} such that
the LCL for F(x) is \eqn{\ge} \code{p}, the lower confidence limit (LCL),
LX(\code{p},\eqn{\gamma}), is the largest value of \eqn{x} such that the UCL for F(x)
is \eqn{\le} \code{p}.
}

\value{
  A list with components:
  \item{Xp}{ PLE of the 100p\emph{th} percentile}
  \item{LXp}{ PLE of LX(\code{p},\eqn{\gamma}) the \eqn{100*\gamma}\% LCL for Xp}
  \item{UXp}{ PLE of UX(\code{p},\eqn{\gamma}) the \eqn{100*\gamma}\% UCL for Xp} 
  \item{p}{probability for Xp the 100p\emph{th} percentile}
  \item{gam}{one-sided confidence level \eqn{\gamma}. Default is 0.95}
} 

\references{
Frome, E. L. and Wambach, P. F. (2005), "Statistical Methods and Software for 
the Analysis of Occupational Exposure Data with Non-Detectable Values," 
\emph{ORNL/TM-2005/52,Oak Ridge National Laboratory}, Oak Ridge, TN 37830.
Available at: \url{http://www.csm.ornl.gov/esh/aoed/ORNLTM2005-52.pdf}
}
\author{ E. L. Frome }
%\note{ }
\seealso{ See Also as \code{\link{plekm}} and \code{\link{SESdata}} }
\examples{
# use data from example 2 in ORNL/TM-2005/52 to calculate
# 95 percent UCL for 95th percentile
data(beTWA) 
unlist(percentile.ple(beTWA))
unlist(percentile.ml(beTWA)) # compare ML estimates
}

\keyword{htest}
\keyword{nonparametric}
