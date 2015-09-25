\name{nptl}
\alias{nptl}

\title{Nonparametric Upper Tolerance Limit}

\description{ Given a random sample of size \code{n} from a continuous
distribution, then, with a confidence level of at least \eqn{\gamma},
at least 100p percent of the population will be below the k\emph{th} largest value in the
sample. 
}
\usage{
nptl(n , p = 0.95, gam = 0.95)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{the sample size}
  \item{p}{probability for Xp the 100p\emph{th} percentile. Default is 0.95}
  \item{gam}{one-sided confidence level \eqn{\gamma}. Default is 0.95 }
}
\value{\item{k}{index of the order statistic}
}
\references{Sommerville, P. N. (1958), "Tables for Obtaining Non-Parametric
Confidence Limits," \emph{Annals of Mathematical Statistics}, 29, 599-601.}

\author{ E. L. Frome  }
\note{ The maximum non-detect must be less than the k\emph{th} largest
value. 
}
\examples{
data(beTWA)
k<- nptl(length(beTWA[,1]))
rev(sort(beTWA[,1]))[k]
}

\keyword{nonparametric}
