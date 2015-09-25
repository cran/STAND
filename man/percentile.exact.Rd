\name{percentile.exact}
\alias{percentile.exact}
\title{Estimate of Xp and Exact Confidence Limits for Normal/Lognormal }

\description{Calculate estimate of Xp the 100*p percentile of the
normal/lognormal distribution, and the lower and upper 100*\eqn{\gamma}\% exact
confidence limits. The resulting interval (Xp.LCL,Xp.UCL) is an
approximate \eqn{100*(2\gamma - 1)} percent confidence interval for
Xp the 100*p percentile. This function should only be used for complete samples.}

\usage{
percentile.exact(x, p = 0.95, gam = 0.95,logx=TRUE,wpnt=FALSE)
}
%
\arguments{
  \item{x}{vector of positive data values}
  \item{p}{probability for Xp the 100p\emph{th} percentile. Default is 0.95}
  \item{gam}{one-sided confidence level \eqn{\gamma}. Default 0.95}
  \item{logx}{If \code{TRUE}, sample is from lognormal, else normal. Default is \code{TRUE}}
  \item{wpnt}{if \code{TRUE}, show warning from pnt. Default is \eqn{FALSE}}
}
\details{

A point estimate of Xp, the 100p\emph{th} percentile of a normal/lognormal
distribution is calculated.  Exact confidence limits for Xp are
calculated using the quantile function of the non-central t
distribution.  The exact UCL is \eqn{m + K*s}, where \eqn{m} is the sample mean, \eqn{s}
is the sample standard deviation, and the \eqn{K factor} depends on \eqn{n, p,} and
\eqn{\gamma}.  The exact LCL is \eqn{m + K'*s}.  The local function
\code{kf} calculates \eqn{K} and \eqn{K'} using the quantile
function of the non-central t distribution \code{qt}.

The null hypothesis \eqn{Ho: Xp \ge Lp} is rejected at the \eqn{\alpha = (1- \gamma )} 
significance level if the \eqn{100\gamma\%} UCL for Xp
is less than the specified limit Lp (indicating the exposure profile is acceptable).
}
\value{
  A LIST with components:
  \item{Xp}{ estimate of the p\emph{th} percentile of the distribution}
  \item{Xpe.LCL}{ \eqn{100*\gamma}\% exact lower confidence limit for Xp}
  \item{Xpe.UCL}{ \eqn{100*\gamma}\% exact upper confidence limit for Xp}
  \item{p}{probability for Xp the 100p\emph{th} percentile. Default 0.95}
  \item{gam}{one-sided confidence level \eqn{\gamma}. Default is 0.95}
  \item{Logx}{If \code{TRUE}, sample is from lognormal, else normal. Default is TRUE}
  \item{n}{sample size}
  \item{Ku}{the K factor used to calculate the exact UCL}
  \item{Kl}{the K' factor used to calculate the exact LCL}
}
\references{
Burrows, G. L. (1963), "Statistical Tolerance Limits - What are They,"
\emph{Applied Statistics}, 12, 133-144.

Johnson, N. L. and B. L. Welch (1940), "Application of the Non-Central
t-Distribution," \emph{Biometrika}, 31(3/4), 362-389.

Lyles R. H. and L. L. Kupper (1996), "On Strategies for Comparing Occupational
Exposure Data to Limits,"  \emph{American Industrial Hygiene Association
Journal}, 57:6-15.

Tuggle, R. M. (1982), "Assessment of Occupational Exposure Using
One-Sided Tolerance Limits," \emph{American Industrial Hygiene Association
Journal}, 43, 338-346.

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

\author{E. L. Frome }
\note{The UCL is also referred to as an upper tolerance limit,
i.e., if \code{p} = 0.95 and \eqn{\gamma} = 0.99 then Xpe.UCL is the exact UTL 95\% - 99\%.
}
\seealso{ Help files for \code{\link{percentile.ml}},
        \code{\link{efraction.exact}}, \code{\link{aihand}}  }

\examples{
#                      EXAMPLE 1
# calculate 95th percentile and exact CLs for Example data
# Appendix  Mulhausen and Damiano (1998)
data(aihand)
x <- aihand$x ;  det <- rep(1,length(x))
aiha <- data.frame(x,det) #  complete data
unlist(percentile.exact(x,gam=0.95,p=0.95) )[1:5]  #  exact CLs
unlist(percentile.ml(aiha,gam=0.95,p=0.95))   #  ML CLs
#                      EXAMPLE 2
#  Ignacio and Bullock (2006) Mulhausen and Damiano (1998)
#  Calculate TABLE VII.3 (page 272) Factor for One-Sided Tolerance
#  Limits for Normal Distribution (Abridged Version)
#  Same as Table III Burrows(1963) Panel 3 Page 138
nn <- c(seq(3,25),seq(30,50,5))
pv <-c(0.75,0.9,0.95,0.99,0.999)
tab <- matrix(0,length(nn),length(pv))
  for( k in (1:length(nn) ) ){
  xx <- seq(1,nn[k])
  for(j in (1:length(pv))) {
  tab[k,j ]<- percentile.exact(xx,pv[j],gam=0.95,FALSE)$Ku
}}
dimnames(tab)<-(list(nn,pv)) ; rm(nn,pv,xx)
round(tab,3)
#
#                      EXAMPLE 3
#  Calculate TABLE I One Sided Tolerance Factor K'
#  Tuggle(1982) Page 339 (Abridged Version)
nn <- c(seq(3,20),50,50000000)
pv <-c(0.9,0.95,0.99)
tab <- matrix(0,length(nn),length(pv))
  for( k in (1:length(nn) ) ){
  xx <- seq(1,nn[k])
  for(j in (1:length(pv))) {
  tab[k,j ]<- percentile.exact(xx,pv[j],gam=0.95,FALSE)$Kl
}}
dimnames(tab)<-(list(nn,pv)) ; rm(nn,pv,xx)
round(tab,3)
}

\keyword{htest}
