\name{plekm}
\alias{plekm}
\title{Product Limit Estimate for Non-detects Using Kaplan-Meier }
\description{
Compute Product Limit Estimate (PLE) of F(x) and Confidence Limits for data with
  non-detects (left censored data).
}
\usage{
plekm(dd,gam)
}

\arguments{
   \item{dd}{An n by 2 matrix or data frame with \cr
    x (exposure) variable in column 1, and \cr
    det= 0 for non-detect or 1 for detect in column 2 }
  \item{gam}{ one-sided confidence level \eqn{\gamma}. Default is 0.95 }
 }

\details{

R function \code{survreg} is used to calculate Kaplan-Meier estimate
of S(z), where z = k - x and k is greater than the largest x value.
This technique of "reversing the data" to convert left censored data
to right censored data was first suggested by Nelson (1972). conf.type
= "plain" is required in survreg for correct CLs.  The value of S(z)
is then used to calculate F(x).  Note that if \eqn{\gamma} = 0.95 the 90\%
two-sided CLs are calculated.

}
\value{
Data frame with columns
   \item{a}{ is the  value of j\emph{th} detect (ordered) }
   \item{ple}{ is PLE of F(x) at \code{a}  }
   \item{stder}{ standard error of F(x) at \code{a} }
   \item{lower}{ lower CL for PLE at \code{a} }
   \item{upper}{ upper CL for PLE at \code{a} }
   \item{n}{ number of detects or non-detects  \eqn{\le}\code{a} }
   \item{d}{ number of detects equal to \code{a} }
 }
\references{
Nelson, W.(1972), "Theory and Application of Hazard Plotting for
Censored Failure  Data", \emph{Technometrics}, 14, 945-66

Frome, E. L. and Wambach, P.F. (2005) "Statistical Methods and Software for
the Analysis of Occupational Exposure Data with Non-Detectable Values",
\emph{ORNL/TM-2005/52,Oak Ridge National Laboratory}, Oak Ridge, TN 37830.
Available at: \url{http://www.csm.ornl.gov/esh/aoed/ORNLTM2005-52.pdf}

Schmoyer, R. L., J. J. Beauchamp, C. C. Brandt and F. O. Hoffman, Jr.
(1996), "Difficulties with the Lognormal Model in Mean Estimation and
Testing," \emph{Environmental and Ecological Statistics}, 3, 81-97.

}

\author{E. L. Frome }
\note{
In survival analysis S(x) = 1 - F(x) is the survival function
i.e., S(x) = P [X > x]. In environmental and occupational situations
S(x) is the "exceedance" function, i.e., S(x) = is the proportion of
X values that exceed x. The PLE is the sample estimate of F(x), i.e.,
the proportion of values in the sample that are less than x.
}

\seealso{\code{\link{plend}}, \code{\link{pleicf}}}



\examples{

data(SESdata) ## use SESdata data set Example 1 from ORNLTM-2005/52
pkm<- plekm(SESdata)
qq.lnorm(pkm) #  lognormal q-q plot based on PLE
round(pkm,3)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{survival}

