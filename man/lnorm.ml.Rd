\name{lnorm.ml}
\alias{lnorm.ml}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ ML Estimation for Lognormal Data with Non-detects }
\description{ 

When an exposure measurement may be less than a detection limit closed
form and exact methods have not been developed for the lognormal
model.  The maximum likelihood (ML) principle is used to develop an
algorithm for parameter estimation, and to obtain large sample
equivalents of confidence limits for the mean exposure level, the
100p\emph{th} percentile, and the exceedance fraction.  For a detailed
discussion of assumptions, properties, and computational issues
related to ML estimation see Cox and Hinkley (1979) and Cohen (1991).

}
\usage{
lnorm.ml(dd)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dd}{ An n by 2 matrix or data frame with \cr
    x (exposure) variable in column 1, and \cr
    det= 0 for non-detect or 1 for detect in Column 2  }
}

\value{
  A list with components:
  \item{mu}{ ML estimate of \eqn{\mu}}
  \item{sigma}{ ML estimate of \eqn{\sigma}} 
  \item{logEX}{ ML estimate of log of E(X)}
  \item{SigmaSq}{ ML estimate of \eqn{\sigma^2}}
  \item{se.mu}{ ML estimate of standard error of \eqn{\mu}}
  \item{se.sigma}{ ML estimate of standard error of \eqn{\sigma}} 
  \item{se.logEX}{ ML estimate of standard error of log of E(X)}
  \item{se.Sigmasq}{ ML estimate of standard error of \eqn{\sigma^2}}
  \item{cov.musig}{ ML estimate of cov(\eqn{\mu},\eqn{\sigma)}}  
  \item{m}{number of detects}
  \item{n}{number of observations in the data set}
  \item{m2log(L)}{ -2 times the log-likelihood function}
  \item{convergence}{ convergence indicator from \code{optim} }  
  
}
\details{
For notational convenience the m detected values \eqn{x[i]} are listed first 
followed by the \eqn{nx[i]} indicating non-detects, so that the data are
\eqn{x[i], i = 1, \ldots , m, nx[i] i = m + 1, \ldots ,n}. If \eqn{nx[i]} is the same for each
non-detect, this is referred to as a left singly censored sample (Type I
censoring) and \eqn{nx} is the limit of detection(LOD). If the \eqn{nx[i]} are different,
this is known as randomly (or progressively) left-censored data[see
Cohen(1991) and Schmoyer et al (1996)]. In some situations a value of 0 is
recorded when the exposure measurement is less than the LOD. In this
situation, the value of \eqn{nx[i]} is the LOD indicating that \eqn{x} is in the interval
\eqn{(0, nx[i])}. The probability density function for lognormal distribution is
\deqn{g(x;\mu,\sigma)= exp[-(log(x) - \mu)^2/(2\sigma^2)] /[\sigma x \sqrt(2\Pi )]}
where \eqn{y = log(x)} is normally distributed with mean \eqn{\mu} and standard
deviation \eqn{\sigma} [Atkinson and Brown (1969)]. The geometric mean of X is
\eqn{GM = exp(\mu)} and the geometric standard deviation is \eqn{GSD = exp(\sigma)}. 
Strom and Stansberry (2000) provide a summary of these and other
relationships for lognormal parameters. Assuming the data are a random
sample from a lognormal distribution, the log of the likelihood function for
the unknown parameters \eqn{\mu}  and \eqn{\sigma} given the data is
\deqn{L (\mu, \sigma )=\sum log[g(x; \mu, \sigma )] + \sum log[G (nx; \mu, \sigma )],}
where \eqn{G(x; \mu , \sigma)} is the lognormal distribution function, i.e., \eqn{G(nx; \mu , \sigma)} is the probability that \eqn{x \le nx}. 
The first summation is over \eqn{i = 1, \ldots , m}, and the second is over \eqn{i = m + 
1, \ldots ,n}.

To test that the mean of \eqn{X > L}, \eqn{Ho: E(X) > L} at the
\eqn{\alpha = 1- \gamma} significance level a one-sided upper \eqn{100\gamma\%}
confidence limit can be used. One method for calculating this UCL is to use the
censored data equivalent of Cox's direct method; i.e., calculate the ML
estimate of \eqn{\phi =\mu + [1/2] \sigma ^2}, and \eqn{var(\phi) = var(\mu + [1/2] \sigma ^2)} where
\deqn{var(\phi )= var(\mu ) + [1/4] var(\sigma^2)+cov(\mu ,\sigma^2).}

The ML estimator of E(X) is \eqn{exp(\phi)}, the \eqn{100\gamma {\%}} LCL for E(X)
is exp[\eqn{\phi - t var(\phi )}], and the \eqn{100\gamma\%} UCL for
E(x) is \eqn{exp[\phi + t var(\phi )}], where \eqn{t = t(\gamma , m-1)}. The
resulting confidence interval (LCL, UCL) has confidence level \eqn{100(2\gamma
-1)\%}. An equivalent procedure is to estimate \eqn{\phi = \mu + [1/2] \sigma^2}
and its standard error directly, i.e., by maximizing the log-likelihood with
parameters \eqn{\mu + [1/2]\sigma^2} and \eqn{\sigma^2}. ML estimates of \eqn{\mu , \sigma , \phi , \sigma^2},
estimates of their standard errors, and covariance terms are calculated.
}


\references{
Cohen, A. C. (1991), \emph{Truncated and Censored Samples}, Marcel Decker, New York

Cox, D. R. and D. V. Hinkley (1979), \emph{Theoretical Statistics}, Chapman and Hall, New York.

Frome, E. L. and Wambach, P. F. (2005), "Statistical Methods and Software for 
the Analysis of Occupational Exposure Data with Non-Detectable Values," 
\emph{ORNL/TM-2005/52,Oak Ridge National Laboratory}, Oak Ridge, TN 37830.
Available at: \url{http://www.csm.ornl.gov/esh/aoed/ORNLTM2005-52.pdf}
}

\author{E. L. Frome}

\note{ Local function \code{ndln} is called by \code{optim} for \code{mu} and \code{sigma}
and local function \code{ndln2} is called by \code{optim} for \code{logEX} and \code{Sigmasq}.
}


\seealso{ \code{\link{optim}}, \code{\link{efraction.ml}}, \code{\link{percentile.ml}} }

\examples{
# Calculate MLE for Example 2 in ORNLTM2005-52
data(beTWA)
mle.TWA<- unlist(lnorm.ml(beTWA)) # ML for Be monitoring data
mle.TWA[1:4]  #  ML estimates of parameters
mle.TWA[5:8]  #  Standard errors of ML estimates
mle.TWA[9:13] #  additional results from lnorm.ml
}
\keyword{optimize}
\keyword{htest}
