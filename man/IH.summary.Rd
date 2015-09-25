\name{IH.summary}
\alias{IH.summary}

\title{Summary Statistic for Samples With Non-detects }

\description{Summary statistic described by The American Industrial
Hygiene Association (AIHA) for occupational exposure data are
calculated for samples with non-detects (aka left censored data).
Parametric estimates are based on a lognormal model using maximum
likelihood (ML).  Nonparametric methods are based on the product limit
estimate (PLE) for left censored data.  }

\usage{
IH.summary(dd,L, p = 0.95, gam = 0.95,bcol=NA)
}

\arguments{
  \item{dd}{ An n by 2 matrix or data frame with \cr
    x (exposure) variable in column 1, and \cr
    det = 0 for non-detect or 1 for detect in column 2 }
  \item{L}{ L is specified limit for the exceedance fraction; e.g., the occupational exposure limit}
  \item{p}{ p is probability for Xp the 100p\emph{th} percentile. Default is 0.95}
  \item{gam}{ one-sided confidence level \eqn{\gamma}. Default is 0.95}
  \item{bcol}{ Column number that contains a BY variable. This column
   must contain a factor and the value of each of the summary statistics is calculated
   for each level of the factor. Default NA}
 }


\value{
  A data.frame with column names based on levels of the BY variable and row names:
  \item{mu}{ML estimate of mean of y=log(x)}
  \item{se.mu}{Estimate of standard error of mu}
  \item{sigma}{ML estimate of sigma}
  \item{se.sigma}{Estimate of standard error of sigma}
  \item{GM}{MLE of geometric mean}
  \item{GSD}{MLE of geometric standard deviation}
  \item{EX}{MLE of E(X) the (arithmetic) mean}
  \item{EX-LCL}{Lower Confidence Limit for E(X)}
  \item{EX-UCL}{Upper Confidence Limit for E(X)}
  \item{KM-mean}{Kaplan-Meier(KM) Estimate of E(X)}
  \item{KM-LCL}{KM Lower Confidence Limit for E(X)}
  \item{KM-UCL}{KM Upper Confidence Limit for E(X)}
  \item{KM-se}{Standard Error of KM-mean}
  \item{obs.Xp}{Estimate of Xp from PLE}
  \item{Xp}{ML estimate of Xp the pth percentile}
  \item{Xp.LCL}{MLE of LX(p,gam) the LCL for Xp}
  \item{Xp.UCL}{MLE of UX(p,gam) the UCL for Xp}
  \item{zL}{MLE of the Z value for limit L}
  \item{NpUTL}{Nonparametric estimate of the UTL \eqn{p-\gamma}}
  \item{Maximum}{Largest value in the data set}
  \item{NonDet}{percent of X's that are left censored, i.e., non-detects}
  \item{n }{number of observations in the data set}
  \item{Rsq }{Square of correlation for the quantile-quantile (q-q) plot}
  \item{m }{number X's greater than the LOD}
  \item{f }{MLE of exceedance fraction F for limit L}
  \item{f.LCL}{LCf(L,gam) MLE of LCL for F}
  \item{F.UCL}{UCf(L,gam) MLE of UCL for F }
  \item{fnp}{Nonparametric estimate of F for limit L}
  \item{fnp.LCL }{Nonparametric estimate of LCL for  F}
  \item{fnp.UCL }{Nonparametric estimate of UCL for  F }
  \item{m2log(L)}{ -2 times the log-likelihood function}
  \item{L }{L is specified limit for the exceedance fraction; e.g., the occupational exposure limit}
  \item{p }{percentile for UTL \code{p}-\eqn{\gamma} }
  \item{gam}{one-sided confidence level \eqn{\gamma}. Default is 0.95}
}
\details{

Regulatory and advisory criteria for evaluating the adequacy of
occupational exposure controls are generally expressed as limits that
are not to be exceeded in a work shift or shorter time-period if the
agent is acutely hazardous.  Exposure monitoring results above the
limit require minimal interpretation and should trigger immediate
corrective action. Demonstrating compliance with a limit is more
difficult.  AIHA has published a consensus standard with two basic
strategies for evaluating an exposure profile---see Mulhausen and
Damiano(1998), Ignacio and Bullock (2006). The first approach is based
on the mean of the exposure distribution, and the second approach
considers the "upper tail" of the exposure profile.  Statistical
methods for estimating the mean, an upper percentile of the
distribution, the exceedance fraction, and the uncertainty in each of
these parameters are provided by this package.  Most of the AIHA
methods are based on the assumptions that the exposure data does not
contain non-detects, and that a lognormal distribution can be used to
describe the data. Exposure monitoring results from a compliant
workplace tend to contain a high percentage of non-detected results
when the detection limit is close to the exposure limit, and in some
situations, the lognormal assumption may not be reasonable.  All of
these methods are described in a companion report by Frome and Wambach
(2005).  }


\references{
Frome, E. L. and Wambach, P. F. (2005), "Statistical Methods and Software for
the Analysis of Occupational Exposure Data with Non-Detectable Values,"
\emph{ORNL/TM-2005/52,Oak Ridge National Laboratory}, Oak Ridge, TN 37830.
Available at: \url{http://www.csm.ornl.gov/esh/aoed/ORNLTM2005-52.pdf}

Ignacio, J. S. and W. H. Bullock (2006), \emph{A Strategy for Assesing
and Managing Occupational Exposures}, Third Edition, AIHA Press,
Fairfax, VA.

Mulhausen, J. R. and J. Damiano (1998), \emph{ A Strategy for Assesing
 and Managing Occupational Exposures}, Second Edition, AIHA Press, Fairfax, VA.

See complete list of references at \code{\link{About-STAND}}
}

\author{E. L. Frome }
% \note{ ~~further notes~~ }
\seealso{See Also \code{\link{lnorm.ml}}, \code{\link{efraction.ml}},
   \code{\link{percentile.ml}}, \code{\link{kmms}}
}
\examples{
# Analysis for cansdata  Example 1 from ORNLTM2005-52
data(cansdata)
Allcans<- round(IH.summary(cansdata,L=0.2,bcol=NA),3)
# Example using cansdata with By variable
cansout <- round(IH.summary(cansdata,L=0.2,bcol=3),3)
#  combine out from both analysis
cbind(Allcans,cansout)
}

\keyword{htest}

