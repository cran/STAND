\name{aihand}
\alias{aihand}
\docType{data}
\title{Industrial Hygiene Air Monitoring Data}
\description{
Data from Mulhausen and Damiano Appendix V is used to
illustrate data with "less-than" values (non-detects).
}
\usage{data(aihand)}

\format{
  A data frame with 15 observations on the following 3 variables
  \describe{
    \item{xnd}{air monitoring data with 3 non-detects}
    \item{det}{ 0 if non-detect, 1 if detect}
    \item{x}{ air monitoring data \eqn{(mg/m^3)}}
    }
}
\details{The data in column 1 was obtained from the data in
column 3 by assuming a limit of detection of 1.9.  The original
data in column 3 is used as an example in Appendices V, VI,
and VII ( see Tables V.1, V.5, V.6, VI.2 ) to illustrate methods of
analysis when there are no non-detects.
}

\source{Table V.2 page 244 in Mulhausen and Damiano (1998) and
Table IV.3 page 349 in Ignacio and Bullock (2006)
}

\references{
Ignacio, J. S. and W. H. Bullock (2006), \emph{A Strategy for Assessing
and Managing Occupational Exposures}, Third Edition, AIHA Press,
Fairfax, VA.

Mulhausen, J. R. and J. Damiano (1998), \emph{A Strategy for Assessing
 and Managing Occupational Exposures}, Second Edition, AIHA Press, Fairfax, VA.
}

\examples{
data(aihand) # Table V.2 Mulhausen and Damiano (1998)

# calculate summary statistics for non-detect data
ndt <- IH.summary(aihand,L=5)
x <- aihand$x ;  det <- rep(1,length(x))
aiha<-data.frame(x,det) #  complete data
# calculate summary statistics for complete data
cdt <- IH.summary(aiha,L=5)
# output results in a table
round(cbind(cdt,ndt),3)

#  rm(aiha,aihand,cdt,det,ndt)
# add results for exact method for complete data case
# for Xp and the exceedance fraction
}
\keyword{datasets}

