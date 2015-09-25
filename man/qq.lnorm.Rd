\name{qq.lnorm}
\alias{qq.lnorm}
\title{ Quantile-Quantile Plot for Censored Lognormal Data }
\description{
qq.lnorm produces a lognormal quantile-quantile (q-q) plot based on the product limit estimate (PLE) 
of the cumulative distribution function (CDF) F(x) for censored data.  A line is added to the plot.
}
\usage{qq.lnorm(pl, mu, sigma, aveple = TRUE,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{pl}{ A data frame with the data(x) in column 1 and PLE in column 2}
  \item{mu}{ estimate of the log scale mean }
  \item{sigma}{ estimate of log scale standard deviation }
  \item{aveple}{ if \code{TRUE}, calculate plotting positions by averaging}
  \item{...}{Additional parameters to plot}
}
\details{

The PLE is used to determine the plotting positions on the horizontal
axis for the censored data version of a theoretical q-q plot for the lognormal distribution.  Waller and Turnbull (1992)
provide a good overview of q-q plots and other graphical methods for
censored data.  The lognormal q-q plot is obtained by plotting
detected values \eqn{a[j]}(on log scale) versus \eqn{H[p(j)]} where \eqn{H(p)} is the
inverse of the distribution function of the standard normal
distribution. If the largest data value is not censored then the PLE
is 1 and H(1) is off scale.  The "plotting positions" \eqn{p[j]} are
determined from the PLE of F(x) by multiplying each estimate by
\eqn{n /(n+1)}, or by averaging adjacent values--see Meeker and Escobar
(1998, Chap 6)]. In complete data case without ties the first approach
is equivalent to replacing the sample CDF \eqn{j / n} with \eqn{j / (n+1)}, and for
the second approach the plotting positions are equal to \eqn{(j - .5) / n}. If
the lognormal distribution is a close approximation to the empirical
distribution, the points on the plot will fall near a straight line.
An objective evaluation of this is obtained by calculating \code{Rsq} the
square of the correlation coefficient associated with the plot.

A line is added to the plot based on the values of \code{mu} and \code{sigma}.
If either of these is missing \code{mu} and \code{sigma} are estimated by
linear regression of \eqn{log(y)} on \eqn{H[p(j)]}.
}
\value{
  A list with components
  
  \item{x}{ The x coordinates of the points that were plotted}
  \item{y}{ The y coordinates of the points that were plotted}
  \item{pp}{ The adjusted probabilities use to determine \code{x} }
  \item{par}{ The values of \code{mu}, \code{sigma}, and  \code{Rsq} }

}

\references{

Fay, M. P. (1999), "Comparing Several Score Tests for Interval Censored Data," 
\emph{Statistics in Medicine}, 1999; 18:273-85. (Corr: 1999, Vol 19, p.2681).

Frome, E. L. and Wambach, P. F. (2005), "Statistical Methods and Software for 
the Analysis of Occupational Exposure Data with Non-Detectable Values," 
\emph{ORNL/TM-2005/52,Oak Ridge National Laboratory}, Oak Ridge, TN 37830.
Available at: \url{http://www.csm.ornl.gov/esh/aoed/ORNLTM2005-52.pdf}

Hesel, D. R. and T. A. Cohn (1988), "Estimation of Descriptive
Statistics for Multiply Censored Water Quality Data," \emph{Water
Resources Research}, 24, 1997-2004.  
 
Meeker, W. Q. and L. A. Escobar (1998), \emph{Statistical Methods for
Reliability Data}, John Wiley and Sons, New York.  

Ny, M. P. (2002), "A Modification of Peto's Nonparametric Estimation of
Survival Curves for Interval-Censored Data," \emph{Biometrics}, 58,
439-442. 

Waller, L. A. and B. W. Turnbull (1992), "Probability Plotting with Censored Data," 
\emph{The American Statistician}, 46(1), 5-12.
}


\author{ E. L. Frome }

\note{ Helsel and Cohen (1988) consider alternative procedures that
can be used for calculating plotting positions for left censored
data. Waller and Turnbull (1992) describe a modification of the
Kaplan-Meier estimator that can be used for right censored data and
note that for the purpose of assessing goodness of fit the choice of
plotting positions makes little qualitative difference in the
appearance of any particular plot. The two options in this function
can be used for any type of censoring.

}
\seealso{  \code{\link{plekm}}, \code{\link{plend}}, \code{\link{pleicf}}  }

\examples{
data(SESdata) #  use SESdata data set Example 1 from ORNLTM-2005/52
pnd<- plend(SESdata)
qq.lnorm(pnd) #  lognormal q-q plot based on PLE 
Ia <- "Q-Q plot For SESdata "
qqout <- qq.lnorm(pnd,main=Ia) #  lognormal q-q plot based on PLE 
qqout
}


% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{hplot}

