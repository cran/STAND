\name{efraction.ml}
\alias{efraction.ml}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Calculate ML Estimate of Exceedance Fraction and Confidence Limits  }
\description{Calculate the ML estimate of the exceedance fraction \eqn{F = Pr [X > L]}
 and "large sample" confidence limits for lognormal data with non-detects. 
}
\usage{
efraction.ml(dd, gam = 0.95, L = 5, dat = TRUE)
}

\arguments{
  \item{dd}{ if \code{dat} is \code{TRUE} \code{dd} is an n by 2 matrix or data frame with x in column 1 det in column 2}
  \item{gam}{ one-sided confidence level \eqn{\gamma}. Default is 0.95}
  \item{L}{ L is specified limit for the exceedance fraction; e.g., the occupational exposure limit}
  \item{dat}{ if \code{dat} is \code{FALSE}, then \code{dd} is a list from
              \code{\link{lnorm.ml}}. Default is \code{TRUE} }
} 

\details{
The exceedance fraction FL represent the proportion of the X's that exceed a
given limit Lp. The null hypothesis of interest is \eqn{Ho: FL \ge Fo=
1-p}; i.e., Fo is the maximum proportion of the population that can exceed
the limit Lp. The ML point estimate of FL is \eqn{f = 1 - N(v)} where
 \eqn{v = [log(L)-\mu ] /\sigma} , and  N(v) is the standard normal distribution 
function. The large sample \eqn{100\gamma\%} LCL for \eqn{V = [log(L) - \mu 
]/\sigma} is LCLv \eqn{= v - t(\gamma , m-1) var(v)^{1/2}}, where
\deqn{var(v)= p1^2 var(\mu )+ p2^2 var(\sigma)+ 2p1p2 cov( \mu, \sigma)},
and p1 and p2 are partial derivatives of \eqn{v} with respect to \eqn{\mu} and \eqn{\sigma}.
The \eqn{100\gamma\%} UCL for FL is \eqn{UF( L, \gamma) = 1 - N(LCLv)}.
The \eqn{100\gamma\%} LCL for FL is \eqn{LF( L, \gamma) = 1 - N(UCLv)}, where
\eqn{UCLv = u + t(\gamma, m-1) var(v)^{1/2}}. The null hypothesis \eqn{Ho: FL = 1 - p}
is rejected if the \eqn{100\gamma\%} UCL for FL is less
than Fo, indicating that the exposure profile is acceptable. The large
sample ML estimates of the exceedance fraction and \eqn{100\gamma\%}
confidence limits for lognormal data are calculated using the
output from \code{\link{lnorm.ml}}. 
}
\value{
  A LIST with components:
  \item{f}{is the ML estimate of exceedance fraction for lognormal distribution}
  \item{f.LCL}{ is the 100*\eqn{\gamma}\% lower confidence limit for \code{f}}
  \item{f.UCL}{ is the 100*\eqn{\gamma}\% upper confidence limit for \code{f}}
  \item{L}{L is specified limit for the exceedance fraction; e.g., the occupational exposure limit}
  \item{gam}{one-sided confidence level \eqn{\gamma}. Default is 0.95}
}
\references{
Frome, E. L. and Wambach, P. F. (2005), "Statistical Methods and Software for 
the Analysis of Occupational Exposure Data with Non-Detectable Values," 
\emph{ORNL/TM-2005/52,Oak Ridge National Laboratory}, Oak Ridge, TN 37830.
Available at: \url{http://www.csm.ornl.gov/esh/aoed/ORNLTM2005-52.pdf}
}

\author{ E. L. Frome}
\note{ (f.LCL, f.UCL) is an 100\eqn{(2\gamma -1)} percent confidence interval 
for F}
\seealso{  \code{\link{lnorm.ml}},\code{\link{percentile.ml}}  }
\examples{
# calculate ML estimate of exceedance fraction and CLs for Example 2 in ORNLTM2005-52 
data(beTWA)
unlist(efraction.ml(beTWA,L=0.2))
#  calculate nonparametric CLs 
unlist(efclnp(beTWA,L=0.2))
}

\keyword{htest}

