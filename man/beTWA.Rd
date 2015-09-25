\name{beTWA}
\alias{beTWA}
\docType{data}
\title{TWA Beryllium Exposure Data}

\description{ As part of a chronic disease prevention program the DOE
adopted an 8-hour time-weighted average (TWA) occupational exposure
limit (OEL) value of 0.2 \eqn{\mu g/m^3} proposed by the American
Conference of Government Industrial Hygienists (\emph{DOE 10 CRF Part
850} and \emph{ACGIH} 2004).  }


\usage{data(beTWA)}
\format{
  A data frame with 280 observations on the following 2 variables:
  \describe{
    \item{twa}{ 8-hour TWA Beryllium exposure \eqn{\mu g/m^3}}
    \item{det}{ 0 if non-detect; 1 if detect }
}
}

\details{
The beTWA data set is the results of 280 personal 8-hour TWA
beryllium exposure readings at a DOE facility.  This data contains 175
non-detects that range in value from 0.005 to 0.1 \eqn{\mu
g/m^3}. A detailed description and analysis of this data is given
as Example 2 in Section 4 of Frome and Wambach (2005).  }

\references{
Frome, E. L. and Wambach, P. F. (2005), "Statistical Methods and Software for
the Analysis of Occupational Exposure Data with Non-Detectable Values,"
\emph{ORNL/TM-2005/52,Oak Ridge National Laboratory}, Oak Ridge , TN 37830
Available at: \url{http://www.csm.ornl.gov/esh/aoed/ORNLTM2005-52.pdf}
}
\examples{
data(beTWA)
##  calculate all of the summary statistics described in
##  Example 2 in Section 4 of Frome and Wambach (2005)
round( IH.summary(beTWA,L=0.2), 3)
}
\keyword{datasets}
%\keyword{ }

