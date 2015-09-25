\name{pleicf}
\alias{pleicf}
\title{Product Limit Estimate for Interval Censored Data }
\description{
Compute Product Limit Estimate (PLE) of F(x) for interval censored
data (i.e., the nonparametric maximum likelihood estimate that generalizes 
the Kaplan-Meier estimate to interval censored data).
   
}
\usage{
pleicf(dd,nondet=TRUE,mine=1e-06,maxc=10000,eps=1e-14)
}
%- maybe also 'usage' for other objects documented here.

\arguments{
  \item{dd}{ n by 2 matrix or data frame (see note below)}
  \item{nondet}{ if \code{TRUE}, \code{dd} is left censored data }
  \item{mine}{ minimum error for convergence in icfit. Default = 1e-06.}
  \item{maxc}{ maximum number of iterations. Default is 10000.}
  \item{eps}{ adjustment factor described by Ng. Default is 1e-14.}
}

\details{
This function is a driver function for \code{\link{icfit}} 
that uses an EM-algorithm applied to interval censored data (see Turnbull, 1976).
}

\note{If \code{nondet} is \code{TRUE} column 1 of dd is the data value
and column 2 is 1 if a detect and 0 otherwise.  If \code{nondet} is
\code{FALSE} \code{dd} contains the left and right endpoints required
by \code{\link{icfit}}.

}
\value{
Data frame with columns
   \item{a}{ value of j\emph{th} uncensored value (ordered)}
   \item{ple}{ PLE of F(x) at a}
   \item{surv}{ \eqn{1 - F()}, i.e the "survival" or "exceedance" function}
   \item{prob}{ prob[X = x] from \code{icfit} }
   \item{n}{ sample size}
}
\references{
Fay, M. P. (1999), "Comparing Several Score Tests for Interval Censored Data,"
 \emph{Statistics in  Medicine},18:273-85.
 (Corr: 1999,  Vol 19, p.2681).  

Ng, M. P. (2002), "A Modification of Peto's Nonparametric Estimation of
Survival Curves for Interval-Censored Data," \emph{Biometrics}, 58,
439-442. 

Turnbull, B. W. (1976), "The Empirical Distribution Function with
Arbitrarily Grouped, Censored and Truncated Data," \emph{Journal of the
Royal Statistical Society}, Series B (Methodological), 38(3), 290-295.
}

\author{E. L. Frome }

\seealso{ \code{\link{icfit}},  \code{\link{plend}}, \code{\link{plekm}}  }


\examples{
# PLE for interval censored filmbadge data
data(filmbadge)
ple.fb<-pleicf(filmbadge[,1:2],FALSE) # PLE for input to qq.lnorm
tmp <- qq.lnorm(ple.fb) ; GM<-round(exp(tmp$par[1]));GSD<-round(exp(tmp$par[2]),2)
tp<-paste("Lognormal Q-Q plot for Filmbadge Data GM= ",GM,"GSD= ",GSD)
title(tp) # title for q-q plot with graphical parameter estimates

}

\keyword{nonparametric}

