\name{ictest}
\alias{ictest}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Performs Tests for Interval Censored Data}
\description{
This function performs several different tests for
interval censored data. It has 3 different models
that generalize either the Wilcoxon rank sum test
(model = "PO") or the logrank test (model = "GPH" or
model = "Sun"). Each model may be one of 2 types,
either an asymptotic permutation test or a
score test.

The censoring is such that if the i\emph{th} observation fails at \eqn{x},
we only observe that \eqn{L[i] < x \le R[i]}. Data may be entered with
"exact" values, i.e., \eqn{L[i] = x = R[i]}. In that case the \eqn{L[i]} is
changed internally to \eqn{L*[i]} which is the next lower of any of the
observed endpoints (unless \eqn{R[i] = 0} then an error results).

The function requires a previously calculated survival
curve (see \code{\link{icfit}}).
}
\usage{
ictest(L, R, S, group, model, type = "permutation", fuzz , output.scores)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{L}{ a vector of left endpoints of the interval.
   We assume each \eqn{L[i] \ge 0}.}
  \item{R}{ a vector of right endpoints of the interval. Exact
   values may be entered as L[i] == R[i] they are changed
   internally.
 }
  \item{S}{ a vector of survival values calculated from
	all the data (i.e., ignoring group membership)
	(see time below), typically output from icfit.}
  \item{group}{ a vector denoting the group for which the test
	is desired. If group is a factor or character
	then a k-sample test is performed, where k is
	the number of unique values of group. If group
	is numeric then a "correlation" type test is
	performed. If there are only two groups, both
	methods give the same results. }
  \item{model}{ a character vector with three possible values
	describing the model:
	model = "GPH"  (default) gives the grouped proportional
	hazards model. This generalizes a logrank test.
	model = "Sun"  gives a Logistic model. This
	generalizes another form of the logrank test.
	model = "PO" gives a proportional odds model.
	This generalizes the Wilcoxon rank sum test.
	(see details).}
  \item{type}{ a character vector with two possible values,
	"permutation" or "score" (see details) }
  \item{fuzz}{ a small numeric value. Because
	we need to determine places in the survival
	curve where there are no changes, and the machine
	may have rounding error, we use this. (Default = 1e-12)}
  \item{output.scores}{ a logical value. \code{output.scores} = \code{TRUE}
outputs the scores in the output list. Default is \code{output.scores} = \code{FALSE}}
}
\details{
  The 3 models are compared in depth in Fay (1999).
   For censored data two common likelihoods are the
   marginal likelihood or the ranks and the
   likelihood with nuisance parameters for the
   baseline survival. Here we use the latter
   likelihood (as in Finkelstein, 1986, Fay, 1996,
   and Sun, 1996).  It is difficult to create proper
   score tests for this likelihood because the
   number of nuisance parameters typically grows with
   the sample size and often many of
   the parameters are equal at the nonparametric
   MLE, i.e., they are on the boundary of the
   parameter space. One way around this is to
   perform a permutation test on the scores
   (Fay, 1996). A second way around (the boundary
   problem at least) it is to redefine
   the interval points so that  no boundary
   problems exist (see Fay, 1996). These are the
   two methods used here.

   We present two generalizations of the logrank
   test. The method of Sun (1996) is more difficult to
   calculate and has no theoretical advantages
   of which I am aware. The grouped proportional
   hazards model of Finkelstein (1996) is recommended.
   Note that when \code{icfit} and \code{ictest} are used on right-censored
 data, because the method of estimating
   variance is different, even Sun's method does not
   produce exactly the standard logrank test results.

   There are some typos in Appendix II of Fay (1999).
   See the S code for the corrections.
}
\value{
  Returns a list with the following elements:
  \item{scores}{only returned if output.scores = T. This is a vector
  the same length as L and R, containing the scores
  used in the permutation test.}
  \item{U}{The efficient score vector. When group is a factor
  or character vector then each element of U has the
  interpretation as the weighted sum of "observed" minus
  "expected" deaths for the group element defined by the
  label of U. Thus negative values indicate better than average
  survival (see Fay, 1999).
}
  \item{chisq.value}{Chi-square value of the test}
\item{df}{Degrees of freedom for the chi-square test.}
\item{pvalue}{p-value from the chi-square value.}
\item{test}{a character vector of length one, either
  "2-sample","correlation" or "k-sample"
  where k in the number of unique group values.}
\item{model}{same as model input, either "GPH","Sun" or "PO"}
\item{type}{same as type input, either "permutation" or
  "score"}
}
\references{
   Fay, M. P. (1996), "Rank Invariant Tests for Interval
   Censored Data Under the Grouped Continuous Model,"
   \emph{Biometrics}, 52: 811-822.

   Fay, M. P. (1999), "Comparing Several Score Tests for
   Interval Censored Data," \emph{Statistics in Medicine},
   18: 273-285.

   Finkelstein, D. M. (1986), "A Proportional Hazards
   Model for Interval Censored Failure Time Data,"
   \emph{Biometrics}, 42: 845-854.

   Sun, J. (1996), "A Non-parametric Test for Interval
   Censored Failure Time Data With Applications to
   AIDS Studies," \emph{Statistics in Medicine}, 15: 1387-1395.
}
\author{Michael P. Fay}

\note{ The functions \code{\link{icfit}}, \code{\link{icplot}},
and  \code{\link{ictest}} and documentation for these functions are from  Michael P. Fay.
You are free to distribute these functions to whomever is
interested. They come with no warranty however.}

\seealso{\code{\link{icfit}},\code{\link{icplot}} }

\examples{
## Perform a logrank-type test using the observed information variance.
## need data set for this example
#   out<-icfit(left,right)
#  ictest(left,right,out$surv,group,out$time,model = "GPH",type = "score")
#
## Perform a Wilcoxon rank sum-type test using asymptotic permutation variance.
#
# ictest(left,right,out$surv,group,out$time, model = "PO",type = "permutation")
}

\keyword{htest}
