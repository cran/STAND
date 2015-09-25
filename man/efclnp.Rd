\name{efclnp}
\alias{efclnp}

\title{Nonparametric Confidence Limits for the Exceedance Fraction }

\description{
When the distribution function for the X's is not specified a nonparametric approach
can be used to estimate the exceedance fraction \eqn{FL = Pr [X > L]} the
proportion of measurements that exceed the limit L. 

}
\usage{efclnp(dd,gam = 0.95,L)
}
\arguments{
 \item{dd}{ An n by 2 matrix or data frame with \cr
    x (exposure) variable in column 1, and \cr
    det = 0 for non-detect or 1 for detect in column 2 }
  \item{gam}{one-sided confidence level \eqn{\gamma}. Default is 0.95}
  \item{L}{L is specified limit for the exceedance fraction; e.g., the occupational exposure limit}
} 

\details{ Given a random
sample of size n the number y of nonconforming observations (i.e., y =
number of X's that exceed the limit L) is described using the binomial
distribution.  The point estimate of FL is \eqn{fnp = y / n} and confidence
limits are obtained using the method of Clopper and Pearson (1934)
(Hahn and Meeker, 1991) and the R documentation for base R
function  \code{\link{binom.test}}.

}

\value{
  A LIST with components:
  \item{fnp}{ nonparametric estimate of exceedance fraction (as percent) }
  \item{fnp.LCL}{ is the 100*\eqn{\gamma}\% lower confidence limit for \code{fnp}}
  \item{fnp.UCL}{ is the 100*\eqn{\gamma}\% upper confidence limit for \code{fnp}}
  \item{L}{is specified limit for the exceedance fraction( e.g. OEL)}
  \item{gam}{one-sided confidence level \eqn{\gamma}. Default is 0.95}
}
\note{The estimates of the exceedance fraction and CL's are in percentage units}

\section{Assumptions }{All non-detects < L}


\references{

Clopper, C. J. and E. S. Pearson (1934), "The Use of Confidence or
Fiducial Limits Illustrated in the Case of the Binomial," \emph{Biometrika}, 26, 404-413.

Hahn, G. J. and W. Q. Meeker (1991), \emph{Statistical Intervals}, John Wiley and Sons, New York.
 }

\author{E. L. Frome }

\seealso{  \code{\link{efraction.ml}} }
\examples{
#   calculate nonparametric estimate 
#   for Example 2 in ORNLTM2005 
data(beTWA)
unlist(efclnp(beTWA,L=0.2))
# calculate ML estimates of exceedance fraction and CLs 
unlist(efraction.ml(beTWA,L=0.2))
}

\keyword{nonparametric}
\keyword{htest}
