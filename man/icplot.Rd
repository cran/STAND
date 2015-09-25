\name{icplot}
\alias{icplot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plots Survival Functions}
\description{
  This function takes a vector of survival values and a
vector of time values and either plots a survival
function or adds the survival lines to an existing plot.
}
\usage{
icplot(surv, time = as.numeric(names(surv)), xrange = NA, lines.only = FALSE,
XLAB = "Time", YLAB = "Probability", LTY = 1, ...)
}

\arguments{
  \item{surv}{ a vector of survival values. }
  \item{time}{ a vector of times. These are related to the
         vector of survival by
         \eqn{Prob(X > time[i]) = surv[i]}. If this vector
         is not given then the default is to use
         \code{as.numeric(names(surv))}. }
  \item{xrange}{ the range of the x values. The default is
         \code{c(0,max(time[time<Inf]))}. This value may need
         to be supplied when plotting more than one
         survival curve on a single plot
         (see lines.only). }
  \item{lines.only}{ a logical value; default = \code{FALSE}. If lines.only = \code{FALSE}
       the function draws a new set of axes. If
       lines.only = \code{TRUE} the function adds lines to
       an existing plot.  To print 2 lines on one
       plot, call the function twice, the first time
       with lines.only = \code{FALSE} and \code{xrange = range(c(t1,t2))}
       where t1 and t2 are the (finite) times for the
       two survival curves, the second time with
       lines.only = \code{TRUE}.}
  \item{XLAB}{ a character string denoting the x label.
        Default = "Time".}
  \item{YLAB}{ a character string denoting the y label.
        Default = "Probability". }
  \item{LTY}{ an integer denoting the line type (lty value). }
  \item{\dots}{ additional plotting parameters (except xlab and ylab). }
}
\details{
  See \code{\link{icplot}} details. This may not be the most accurate
   way to present the data. See Betensky, Lindsey, Ryan,
   and Wand (1999, p. 238) for an alternative method.
}
\value{
  Returns a plot or adds a line to an existing plot.
}
\references{
Betensky, R. A., Lindsey, J. C., Ryan, L. M., and Wand, M. P. (1999),
   "Local EM Estimation of the Hazard Function for
   Interval-Censored Data," \emph{Biometrics}, 55: 238-245.
 }
\author{Michael P. Fay}

\note{ The functions \code{\link{icfit}}, \code{\link{icplot}},
and  \code{\link{ictest}} and documentation for these functions are from  Michael P. Fay.
You are free to distribute these functions to whomever is
interested. They come with no warrantee however.

}

\seealso{\code{\link{icfit}}, \code{\link{ictest}}  }

\examples{
# Plot two Survival curves on one plot.
#  need data set for this example
#   s1<- icfit(left[treatment==1],right[treatment==1])
#   s2<- icfit(left[treatment==2],right[treatment==2])
#   icplot(s1$surv,s1$time,xrange=range(c(s1$time,s2$time)))
#   icplot(s2$surv,s2$time,lines.only=TRUE,LTY=2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{hplot}

