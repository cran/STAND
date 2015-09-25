\name{icfit}
\alias{icfit}

\title{Calculates the Self-Consistent Estimate of Survival from
Interval Censored Data }

\description{This function calculates the self-consistent estimate of survival
for interval censored data.
(i.e., the nonparametric maximum likelihood estimate that generalizes
the Kaplan-Meier estimate to interval censored data).
The censoring is such that if the i\emph{th} observation fails at \eqn{x},
we only observe that \eqn{L[i] < x \le R[i]}. Data may be entered with
"exact" values, i.e., \eqn{L[i] = x = R[i]}. In that case the \eqn{L[i]} is
changed internally to \eqn{L[i]*} which is the next lower of any of the
observed endpoints (unless \eqn{R[i] = 0} then an error results).
}

\usage{
icfit(L, R, initp = NA, minerror = 1e-06, maxcount = 1000)
}
%- maybe also 'usage' for other objects documented here.

\arguments{
  \item{L}{ a vector of the left endpoints of the interval }
  \item{R}{ a vector of the right endpoints of the interval }

  \item{initp}{ a vector with an initial estimate of the density
       function. This vector should sum to 1 and have a
       length equal to the number of unique values of \code{L}
       and \code{R} combined. If \code{initp} = NA (default) then an initial
       value is estimated from the data.}
     \item{minerror}{The minimum error for convergence purposes. The
       EM algorithm stops when \code{error} < \code{minerror}, where
       error is the maximum of the reduced gradients (see Gentleman
       and Geyer, 1994). Default = 1e-06.}
  \item{maxcount}{ the maximum number of iterations. Default is 10000.  }
}

\details{
  The algorithm is basically an EM-algorithm applied to
    interval censored data (see Turnbull, 1976); however,
    first there is a primary reduction (See Aragon and
    Eberly, 1992). Convergence is defined when the maximum
    reduced gradient is less than minerror, and the
    Kuhn-Tucker conditions are approximately met,
    otherwise a warning will result.  (see Gentleman and
    Geyer, 1994). There may be other faster algorithms,
    but they are more complicated (see Aragon and Eberly,
    1992). The output for time is \code{sort(unique(c(0,L,R,Inf)))}
    without the Inf. The output for \code{p} keeps the value
    related to Inf so that \code{p} may be inserted into \code{initp}
    for another run. The outputs for \code{p} and \code{surv} act as if
    the jumps in the survival curve happen at the largest
    of the possible times (see Gentleman and Geyer, 1994,
    Table 2, for a more accurate way to present \code{p}).
}
\value{
Returns a list with the following elements:
  \item{u}{a vector of Lagrange multipliers. If there are any
      negative values of \code{u} the Kuhn-Tucker conditions for
      convergence are not met. If this happens a warning
      will result.}
  \item{error}{this is the maximum of the reduced gradients. If
      convergence is correct then \code{error} < \code{minerror}
          and all values of \code{u} are nonnegative,
          otherwise a warning results.}
\item{count}{number of iterations of the self-consistent algorithm
          (i.e., EM-algorithm)}
\item{time}{a vector of times (see details)}
\item{p}{a vector of probabilities, all except the last
          values are associated with the time
      vector above, i.e., \eqn{p[i] = Prob (X = time[i])}.
          The last value is associated with time==Inf.
          (see details).}
\item{surv}{a vector of survival values associated with
          the time vector above, i.e.,
          \eqn{surv[i] = Prob (X > time[i] )}}
}
\references{

Aragon, J. and Eberly, D. (1992), "On Convergence of Convex
    Minorant Algorithms for Distribution Estimation with
    Interval-Censored Data," \emph{Journal of Computational and Graphical
    Statistics.} 1: 129-140.

Gentleman, R. and Geyer, C. J. (1994), "Maximum Likelihood
    for Interval Censored Data: Consistency and Computation,"
    \emph{Biometrika}, 81, 618-623.

Turnbull, B. W. (1976), "The Empirical Distribution Function
    with Arbitrarily Grouped, Censored and Truncated Data,"
    \emph{Journal of the Royal Statistical Society}, Series B,(Methodological), 38(3), 290-295.
}

\author{Michael P. Fay}

\note{ The functions \code{\link{icfit}}, \code{\link{icplot}},
and  \code{\link{ictest}} and documentation for these functions are from  Michael P. Fay.
You are free to distribute these functions to whomever is
interested. They come with no warranty however.
}

\seealso{ \code{\link{plekm}} , \code{\link{qq.lnorm}} }
\examples{
# Calculate and plot a Kaplan-Meier type curve for interval censored data.
# This is S(x) = 1 - F(x) and is the sample estimate of the probability
# of exceeding x.  The filmbadge data is used as an example.
data(filmbadge)
out <- icfit(filmbadge$dlow,filmbadge$dhigh)
icplot(out$surv, out$time,XLAB="Dose",YLAB="Exceedance Probability")
}
\keyword{nonparametric}
