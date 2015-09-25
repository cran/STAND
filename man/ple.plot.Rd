\name{ple.plot}
\alias{ple.plot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Plot PLE With Confidence Limits  }

\description{Plot the product limit estimate (PLE) of F(x) and \eqn{100(2\gamma -1)\%}
two-sided confidence limits (CLs) for left censored data. A horizontal line
corresponding to the Xp = 100p\emph{th} percentile is added to the plot and
the nonparametric confidence limits for Xp are displayed in the title.
}

\usage{
ple.plot(dd, gam = 0.95, p = 0.95, xlow = 0, xh = NA, ylow = 0, yh = 1,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dd}{An n by 2 matrix or data frame with \cr
    x (exposure) variable in column 1, and \cr
    det = 0 for non-detect or 1 for detect in column 2  }
  \item{gam}{ one-sided confidence level \eqn{\gamma}. Default is 0.95 }
  \item{p}{probability for Xp the 100p\emph{th} percentile. Default is 0.95}
  \item{xlow}{ minimum value on x axis. Default = 0 }
  \item{xh}{ maximum value on the x axis. Default = maximum value of x }
  \item{ylow}{ minimum value on y axis. Default = 0  }
  \item{yh}{ maximum value on the y axis. Default = 1 }
  \item{...}{Additional parameters to plot}

 }
%\details{ ~~ If necessary, more details than the description above ~~

\value{
Data frame with columns
   \item{a}{ value of j\emph{th} detect (ordered) }
   \item{ple}{ PLE of F(x) at a  }
   \item{stder}{ standard error of F(x) at a }
   \item{lower}{ lower CL for PLE at a }
   \item{upper}{ upper CL for PLE at a }
   \item{n}{ number of detects or non-detects \eqn{\ge} a }
   \item{r}{ number of detects equal to a }
 }


\author{ E. L. Frome }
\note{ If the solid horizontal line does not intersect the lower
CL for the PLE, then the upper CL for Xp UX(\code{p},\eqn{\gamma}) is not defined.
}
\seealso{ See Also \code{\link{plekm}} }

\examples{
data(beTWA)
par( mfrow=c(1,2) )
ple.plot(beTWA)  #  plot the PLE of F(x) for the beTWA data
ple.plot(beTWA,ylow=0.8) #  plot the upper right tail 
# Lognormal ML estimates of 95th percentile and CLs
unlist(percentile.ml(beTWA))
# PLE   estimates of 95th percentile and CLs
unlist(percentile.ple(beTWA))
#
}

\keyword{hplot}

