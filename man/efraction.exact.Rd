\name{efraction.exact}
\alias{efraction.exact}

\title{Exceedance Fraction and Exact Confidence Limits  }
\description{Calculate estimate of the exceedance fraction \eqn{FL = Pr [X > L]}
and exact confidence limits for random sample from normal/lognormal distribution.
This function should only be used for complete samples. 
}
\usage{
efraction.exact(x, gam = 0.95, L=NA ,logx=TRUE,wpnt=FALSE)
}
\arguments{
  \item{x}{vector of data values}
  \item{gam}{one-sided confidence level \eqn{\gamma}. Default is 0.95}
  \item{L}{ L is specified limit for the exceedance fraction; e.g., the occupational exposure limit}
  \item{logx}{If \code{TRUE}, sample is from lognormal, else normal. Default is \code{TRUE}}
  \item{wpnt}{if \code{TRUE}, show warning from pnt. Default is \eqn{FALSE}}
}

\details{ The exceedance fraction represent the proportion of the X's
that exceed a given limit Lp. The null hypothesis of interest is
\eqn{Ho: F \ge Fo = 1-p}; i.e., Fo is the maximum proportion of the
population that can exceed the limit Lp. The null hypothesis is
rejected if the \eqn{100 \gamma\%} UCL for FL is less than Fo ,
indicating that the exposure profile is acceptable. The type I error rate
for this test is less than or equal to \eqn{\alpha = 1 - \gamma}.  }

\value{
  A LIST with components:
  \item{f}{estimate of exceedance fraction for lognormal distribution as \%}
  \item{fe.LCL}{ 100*\eqn{\gamma}\% exact lower confidence limit \% units}
  \item{fe.UCL}{ 100*\eqn{\gamma}\% exact upper confidence limit \% units}
  \item{L}{L is specified limit for the exceedance fraction, e.g. the occupational exposure limit}
  \item{gam}{one-sided confidence level \eqn{\gamma}. Default is 0.95}
  \item{Logx}{If \code{TRUE}, sample is from lognormal, else normal. Default is \code{TRUE}}
}
\references{
Johnson, N. L. and B. L. Welch (1940), "Application of the Non-Central
t-Distribution," \emph{Biometrika}, 31(3/4), 362-389.

Lyles, R. H. and L. L. Kupper (1996), "On strategies for comparing occupational
exposure data to limits," \emph{American Industrial Hygiene Association
Journal}. 57:6-15.

Frome, E. L. and Wambach, P. F. (2005), "Statistical Methods and Software for 
the Analysis of Occupational Exposure Data with Non-Detectable Values," 
\emph{ORNL/TM-2005/52,Oak Ridge National Laboratory}, Oak Ridge, TN 37830.
Available at: \url{http://www.csm.ornl.gov/esh/aoed/ORNLTM2005-52.pdf}

Ignacio, J. S. and W. H. Bullock (2006), \emph{A Strategy for Assesing
and Managing Occupational Exposures}, Third Edition, AIHA Press,
Fairfax, VA.

Mulhausen, J. R. and J. Damiano (1998), \emph{ A Strategy for Assessing
 and Managing Occupational Exposures}, Second Edition, AIHA Press, Fairfax, VA.


}

\author{ E. L. Frome}

\note{(fe.LCL, fe.UCL) is an approximate \eqn{100(2\gamma -1)} percent
confidence interval for F. The R function \code{uniroot} is used to find the
noncentrality parameter of noncentral t distribution to calculate CL's
for \eqn{U = (L - \mu) / \sigma} where F = pnorm(U).  In some versions of R this
may cause a warning message.  See R bug report RP 9171 full precision
was not achieved in 'pnt'.  This warning message may occur in \code{uniroot}
calls to \code{pt} and does not effect the precision of the final result}

\seealso{Help files for \code{\link{efraction.ml}},\code{\link{efclnp}},
\code{\link{percentile.exact}}, \code{\link{efraction.exact}}, 
\code{\link{aihand}}
}
\examples{
# calculate exceedance fraction and exact CLs for Example data
# Appendix  Mulhausen and Damiano(1998) Ignacion and Bullock (2006
data(aihand)
x <- aihand$x ;  det <- rep(1,length(x))
aiha<-data.frame(x,det) #  complete data
unlist(efraction.exact(x,gam=0.95,L=5) ) #  exact CLs
unlist(efraction.ml(aiha,gam=0.95,L=5))  #  ML CLs
unlist(efclnp(aiha,L=5))                 #  nonparametric CLs 
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{htest}


