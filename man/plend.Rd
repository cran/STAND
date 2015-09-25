\name{plend}
\alias{plend}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Compute Product Limit Estimate for Non-detects }
\description{
Compute Product Limit Estimate(PLE) of F(x) for positive data with 
  non-detects (left censored data) 
}
\usage{
plend(dd)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dd}{ An n by 2 matrix or data frame with \cr
    x (exposure) variable in column 1, and \cr
    det = 0 for non-detect or 1 for detect in column 2 }
}
\details{
The product limit estimate (PLE) of the cumulative distribution function
was first proposed by Kaplan and Meier (1958) for right censored data.
Turnbull (1976) provides a more general treatment of nonparametric
estimation of the distribution function for arbitrary censoring. For
randomly left censored data, the PLE is defined as follows [Schmoyer et al.
(1996)]. Let \eqn{a[1]< \ldots < a[m]} be the m distinct values at
which detects occur, r[j] is the number of detects at a[j], and n[j] is the
sum of non-detects and detects that are less than or equal to a[j]. Then the
PLE is defined to be 0 for \eqn{0 \le  x \le  a0}, where a0 is a[1] or the
value of the detection limit for the smallest non-detect if it is less than
a[1]. For \eqn{a0 \le  x < a[m]} the PLE is \eqn{F[j]= \prod (n[j] --
r[j])/n[j]}, where the product is over all \eqn{a[j] > x}, and the PLE is 1 for
\eqn{x \ge a[m]}. When there are only detects this reduces to the usual
definition of the empirical cumulative distribution function.
}
\value{
Data frame with columns
   \item{a(j)}{ value of j\emph{th} detect (ordered)}
   \item{ple(j)}{ PLE of F(x) at a(j)}
   \item{n(j)}{ number of detects or non-detects \eqn{\le} a(j)}
   \item{r(j)}{ number of detects equal to a(j)}
   \item{surv(j)}{ 1 - ple(j) is PLE of S(x)}
  
}
\references{
Frome, E. L. and Wambach, P. F. (2005), "Statistical Methods and Software for 
the Analysis of Occupational Exposure Data with Non-Detectable Values," 
\emph{ORNL/TM-2005/52,Oak Ridge National Laboratory}, Oak Ridge, TN 37830.
Available at: \url{http://www.csm.ornl.gov/esh/aoed/ORNLTM2005-52.pdf}

Kaplan, E. L. and Meier, P. (1958), "Nonparametric Estimation from Incomplete Observations," \emph{Journal of the American Statistical Association}, 457-481. 

Schmoyer, R. L., J. J. Beauchamp, C. C. Brandt and F. O. Hoffman, Jr.
(1996), "Difficulties with the Lognormal Model in Mean Estimation and
Testing," \emph{Environmental and Ecological Statistics}, 3, 81-97.

Turnbull, B. W. (1976), "The Empirical Distribution Function with Arbitrarily Grouped, Censored and Truncated Data," \emph{Journal of the Royal Statistical Society}, Series B (Methodological), 38(3), 290-295.

}

\author{E. L. Frome }
\note{  
In survival analysis \eqn{S(x) = 1 - F(x)} is the survival function
i.e., \eqn{S(x) = P[X > x]}. In environmental and occupational situations
\eqn{1 - F(x)} is the "exceedance" function, i.e., \eqn{C(x) = 1 - F(x) = P [X > x]}.
 
}
\seealso{  \code{\link{plekm}}, \code{\link{pleicf}}, \code{\link{qq.lnorm}} }


\examples{
data(SESdata) #  use SESdata data set Example 1 from ORNLTM-2005/52
pnd<- plend(SESdata)
Ia<-"Q-Q plot For SESdata "
qq.lnorm(pnd,main=Ia) #  lognormal q-q plot based on PLE 
pnd
}

\keyword{nonparametric }

