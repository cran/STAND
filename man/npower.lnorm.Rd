\name{npower.lnorm}
\alias{npower.lnorm}

\title{Sample Size and Power For Lognormal Distribution }
\description{Find either the sample size or power for complete sample from lognormal distribution}

\usage{
npower.lnorm(n=NA,power=NA,fstar=1,p=0.95,gamma=0.95)
}
\arguments{
  \item{n}{sample size}
  \item{power}{power of the test = 1 - \eqn{\beta}}
  \item{fstar}{ true percent of X's \eqn{\ge} limit L}
  \item{p}{ probability for Xp the 100p\emph{th} percentile. Default is 0.95}
  \item{gamma}{one-sided confidence level \eqn{\gamma}. Default is 0.95}
 }

\details{Find either the sample size \code{n} or the \code{power} of the test for specified
values of \code{fstar},  \code{p}, and \code{gamma}. Either \code{n} is missing
or \code{power} is missing.

The null hypothesis of interest is
\eqn{Ho: F \ge Fo = 1-p}; i.e., Fo is the maximum proportion of the
population that can exceed the limit Lp. The null hypothesis is
rejected if the \eqn{100 \gamma\%} UCL for F is less than Fo ,
indicating that the exposure profile is acceptable. For the complete
data case this is equivalent to testing the null hypothesis 
 \eqn{Ho: Xp \ge Lp} at the \eqn{\alpha = (1- \gamma )} significance level.
See \code{\link{efraction.exact}}, \code{\link{percentile.exact}} and
Section 2.3 of Frome and Wambach(2005) for further details.
}
\value{
  A vector with components:
  \item{n}{sample size}
  \item{power}{power of the test = 1 -\eqn{\beta}}
  \item{fstar}{true percent of X's \eqn{\ge} limit L}
  \item{p}{probability for Xp the 100p\emph{th} percentile. Default is 0.95}
  \item{gamma}{one-sided confidence level \eqn{\gamma}. Default is 0.95}
   }
\references{
Johnson, N. L. and B. L. Welch (1940), "Application of the Non-Central
t-Distribution," \emph{Biometrika}, 31(3/4), 362-389.

Lyles R. H. and L. L. Kupper (1996), "On strategies for comparing occupational
exposure data to limits,"  \emph{American Industrial Hygiene Association
Journal}, 57:6-15.

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

\author{ E.L. Frome}

\note{ The R function \code{uniroot} is used to find a parameter of the
non-central t distribution.  In some versions of R this
may cause a warning message.  See R bug report RP 9171 full precision
was not achieved in 'pnt'.  This warning message may occur in \code{uniroot}
calls to \code{pt} and does not effect the precision of the final result}

\seealso{Help files for \code{\link{efraction.ml}},\code{\link{percentile.ml}},
\code{\link{efclnp}},\code{\link{aihand}}   }
\examples{
#                              EXAMPLE 1
#    Table VII.1 Mulhausen and Damiano (1998) adapted from
#    Table II in Lyles and Kupper (1996) JAIHA vol 57 6-15 Table II
#    Sample Size Needed When Using UTL(95,95) to Show 95\% Confidence
#    that the 95th Percentile is below the OEL (Power = 0.8)
rx<-c(1.5,2,2.5,3)
sdx<- sqrt(c(0.5,1,1.5,2,2.5,3))
tabn<-matrix(0,4,6)
for ( i in 1:4) {
  for (j in 1:6) {
fstar<- 100*(1 -pnorm( log(rx[i])/sdx[j] + qnorm(0.95) ))
tabn[i,j]<- npower.lnorm(NA,0.8,fstar,p=0.95,gamma=0.95)[1] 
}
}
cn<- paste("GSD = ",round(exp(sdx),2),sep="" )
dimnames(tabn)<-list( round(1/rx,2),cn)
rm(cn,rx,sdx)
tabn
#                              EXAMPLE 2
top<-"Power For Sample Size n = 20 for p=0.95 gamma=0.95"
fstar <- seq(0.2,4.8,0.1)
pow <- rep(1,length(fstar))
for (i in 1 : length(fstar)) {
pow[i]<-npower.lnorm(20,NA,fstar[i],p=0.95,gamma=0.95)[2]
}
plot(fstar,pow,xlim=c(0,5),ylim=c(0,1),main=top,
xlab="fstar = True Percent of Xs > L(Specified Limit )",ylab="Power")
}

\keyword{htest}


