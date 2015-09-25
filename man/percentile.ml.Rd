\name{percentile.ml}
\alias{percentile.ml}

\title{Calculate ML Estimate of Xp and Confidence Limits }

\description{Calculate the ML estimate of Xp the 100p\emph{th} percentile
of the lognormal distribution, and the lower and upper \eqn{100*\gamma}\% confidence limits
LX(\code{p},\eqn{\gamma}) and UX(\code{p},\eqn{\gamma}).  The upper confidence limit is used to
test the null hypothesis that the exposure profile is "unacceptable".
If UX(\code{p},\eqn{\gamma) < L} the null hypothesis is rejected and workplace
is considered "safe" or the object/area is not contaminated.  The
Type I error is \eqn{\le \alpha = 1 - \gamma}.  The resulting interval (LX,UX)
is an approximate \eqn{100*(2\gamma - 1)} percent confidence interval for Xp.
}

\usage{
percentile.ml(dd, p = 0.95, gam = 0.95, dat = TRUE)
}
%- maybe also 'usage' for other objects documented here.

\arguments{
 \item{dd}{An n by 2 matrix or data frame with \cr
    x (exposure) variable in column 1, and \cr
    det= 0 for non-detect or 1 for detect in column 2}
 \item{p}{is probability for Xp the 100p\emph{th} percentile. Default is 0.95}
 \item{gam}{ one-sided confidence level \eqn{\gamma}. Default is 0.95}
 \item{dat}{ if \code{dat} is \code{FALSE} then \code{dd} is a list from
              \code{\link{lnorm.ml}}. Default is \code{TRUE} }  
}

\details{
The point estimate of \eqn{Yp = log(Xp)} is \eqn{\mu  + z \sigma} where \eqn{\mu} and
\eqn{\sigma} are ML estimates and \eqn{z} is qnorm(p). The variance of the estimate is
\deqn{var(\mu  + z\sigma ) = var(\mu ) + Z^2p var (\sigma )+ 2z 
cov(\mu ,\sigma)} 
The \eqn{100\gamma {\%}} LCL and UCL for Xp are
\deqn{LX(p,\gamma ) = exp[Yp- t(\gamma ,(m-1))var(Yp)^{1/2}],}
\deqn{UX(p,\gamma ) = exp[Yp + t(\gamma ,(m-1))var(Yp)^{1/2}].}

The ML estimates of \eqn{var(\mu)}, \eqn{var(\sigma)}, and \eqn{cov(\mu 
,\sigma)} are obtained from the ML variance-covariance matrix using 
\code{\link{lnorm.ml}}. The null hypothesis \eqn{Ho: Xp \ge Lp} is rejected at the \eqn{\alpha = (1-
\gamma )} significance level if the \eqn{100\gamma\%} UCL for Xp < Lp (indicating the exposure profile is acceptable).
}
\value{
  A LIST with components:
  \item{Xp}{ML estimate of the p\emph{th} percentile of lognormal distribution}
  \item{Xp.LCL}{ \eqn{100*\gamma}\% lower confidence limit for Xp}
  \item{Xp.UCL}{ \eqn{100*\gamma}\% upper confidence limit for Xp}
  \item{p}{probability for Xp the 100p\emph{th} percentile. Default 0.95}
  \item{gam}{one-sided confidence level \eqn{\gamma}. Default is 0.95}
}
\references{
Cohen, A. C. (1991), \emph{Truncated and Censored Samples}, Marcel Decker, New York

Cox, D. R. and D. V. Hinkley (1979), \emph{Theoretical Statistics}, Chapman and Hall, New York.

Frome, E. L. and Wambach, P. F. (2005), "Statistical Methods and Software for 
the Analysis of Occupational Exposure Data with Non-Detectable Values," 
\emph{ORNL/TM-2005/52,Oak Ridge National Laboratory}, Oak Ridge, TN 37830.
Available at: \url{http://www.csm.ornl.gov/esh/aoed/ORNLTM2005-52.pdf}
}

\author{E. L. Frome }

\note{The UCL is also referred to as an upper tolerance limit(UTL),
i.e., if p = 0.95 and gam = 0.99 then Xp.UCL is the UTL-95\%-99\%.
}
\seealso{ Help files for \code{\link{lnorm.ml}},\code{\link{efraction.ml}} }

\examples{
data(beTWA)
# calculate ML estimate of 95th percentile and CLs for Example 2 in ORNLTM2005-52 
unlist(percentile.ml(beTWA,0.95,0.95))

}

\keyword{htest}
\keyword{optimize}

