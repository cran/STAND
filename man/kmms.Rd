\name{kmms}
\alias{kmms}

\title{Kaplan-Meier (KM) Mean and Standard Error}
\description{Kaplan- Meier Estimate of Mean and Standard Error of
 the Mean for Left Censored Data
 }
\usage{
kmms(dd, gam = 0.95)
}

\arguments{
 \item{dd}{ An n by 2 matrix or data frame with \cr
    x (exposure) variable in column 1, and \cr
    det= 0 for non-detect or 1 for detect in column 2 }
  \item{gam}{ one-sided confidence level \eqn{\gamma}. Default is 0.95 }
 }

\details{
The product limit estimate (PLE) of the cumulative distribution function
was first proposed by Kaplan and Meier (1958) for right censored data.
Turnbull (1976) provides a more general treatment of nonparametric
estimation of the distribution function for arbitrary censoring. For
randomly left censored data, the PLE is defined by Schmoyer et al.
(1996)--see \code{\link{plend}}.

The mean of the PLE is a censoring-adjusted
point estimate of E(X) the mean of X.  An approximate standard error
of the PLE mean can be obtained using the method of Kaplan and Meier
(1958), and the \eqn{100\gamma\%} UCL is \eqn{KM.mean + t(\gamma -1,
m-1) sp}, where \code{sp} is the Kaplan-Meier standard error of the mean
adjusted by the factor \eqn{m/(m-1)}, where \code{m} is the number of detects in the
sample.  When there is no censoring this reduces to the second
approximate method described by Land (1972).
 
}
\value{
    A LIST with components:
  \item{KM.mean}{Kaplan- Meier(KM) estimate of mean E(X) }
  \item{KM.LCL }{KM estimate of lower confidence limit }
  \item{KM.UCL }{KM estimate of upper confidence limit}
  \item{KM.se }{estimate of standard error of KM-mean}
  \item{gamma}{one-sided confidence level \eqn{\gamma}. Default 0.95}
}
\references{
Kaplan, E. L. and Meier, P. (1958), "Nonparametric Estimation from Incomplete Observations,"
\emph{Journal of the American Statistical Association}, 457-481. 

Schmoyer, R. L., J. J. Beauchamp, C. C. Brandt and F. O. Hoffman, Jr.
(1996), "Difficulties with the Lognormal Model in Mean Estimation and
Testing," \emph{Environmental and Ecological Statistics}, 3, 81-97.

 }
\author{E. L. Frome}

\note{ Error in KM.se corrected on 12 June 2007. KM standard error is
adjusted by multiplying by sqrt(m/(m-1)) where m is number of detected
values.  Error occurred if there were ties in detected values by
calculating the number of unique detected values. For example, for
beTWA sqrt(m/(m-1)) is 1.004796 .  Due to error 1.008032 was used. The
sqrt(m/(m-1)) will always be smaller after correction, depending on
value of m and the number of ties. See the example.   

}

\seealso{ \code{\link{plend}}, \code{\link{plekm}} }



\examples{
# results for beTWA data using kmms in stand Ver 1.1 with error
#    KM.mean      KM.LCL      KM.UCL       KM.se       gamma 
# 0.018626709 0.014085780 0.023167637 0.002720092 0.950000000
#
data(beTWA) # Use data from Example 2 in ORNLTM2002-51
unlist(kmms(beTWA))
}
\keyword{nonparametric}
\keyword{htest}
