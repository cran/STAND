\name{About-STAND}
\alias{About-STAND}
\alias{STAND}
\docType{package}
\title{Statistical Analysis of Non-detect Data}


\description{ Environmental exposure measurements are, in general,
positive and may be subject to left censoring; i.e., the measured
value is less than a "detection limit", and is referred to as a
non-detect or "less than" value.  This package calculates the censored
data equivalent of a number of statistics that are used in the
analysis of environmental data that do not contain non-detects,
i.e. the usual complete data case.
}
\details{
\tabular{ll}{
Package: \tab stand\cr
Type: \tab Package\cr
Version: \tab 2.0\cr
Date: \tab 2015-09-10\cr
License: \tab GPL version 2 or newer\cr
}
In occupational monitoring, strategies for
assessing workplace exposures typically focus on the mean exposure
level or the probability that any measurement exceeds a limit.
Parametric methods used to determine acceptable levels of exposure are
based on a two parameter lognormal distribution. The mean exposure
level, an upper percentile, the exceedance fraction, and confidence
limits for each of these statistics are calculated.  Statistical
methods for random samples (without non-detects) from the lognormal
distribution are well known for each of these situations--see
e.g., Lyles and Kupper (1996).  In this package the maximum likelihood
method for randomly left censored lognormal data is used to calculate
these statistics, and graphical methods are provided to evaluate the
lognormal assumption.  Nonparametric methods based on the product
limit estimate for left censored data are used to estimate the mean
exposure level, and the upper confidence limit on an upper percentile
(i.e., the upper tolerance limit) is obtained using a nonparametric
approach.

The American Industrial Hygiene Association (AIHA) has published a
consensus standard with two basic strategies for evaluating an
exposure profile---see Mulhausen and Damiano(1998), Ignacio and
Bullock (2006).  Most of the AIHA methods are based on the assumptions
that the exposure data does not contain non-detects, and that a
lognormal distribution can be used to describe the data. Exposure
monitoring results from a compliant workplace tend to contain a high
percentage of non-detected results when the detection limit is close
to the exposure limit, and in some situations, the lognormal
assumption may not be reasonable.  The function
\code{\link{IH.summary}} calculates most of the statistics proposed by
AIHA for exposure data with non-detects. All of the methods are
described in the report Frome and Wambach (2005).  }

\references{

Aitchison, J. and J. A. C. Brown (1969), \emph{The Lognormal Distribution},
Cambridge, U.K., Cambridge University Press.

Akritas, M. G., T. F. Ruscitti, and G. S. Patil (1994), "Statistical
Analysis of Censored Environmental Data," \emph{Handbook of Statistics},
Vol. 12, G. P. Patil and C. R. Rao (eds), 221-242, Elsevier Science, New
York.

American Conference of Governmental Industrial Hygienists (ACGIH) (2004),
"Notice of Intended Change In: 2004 TLVs and BEIs," \emph{ACGIH}, p. 60,
Cincinnati, OH.

Burrows, G. L. (1963), "Statistical Tolerance Limits - What are They,"
\emph{Applied Statistics}, 12, 133-144.

Armstrong, B. G. (1992), "Confidence Intervals for Arithmetic Means of
Lognormally Distributed Exposures," \emph{American Industrial Hygiene
Association Journal}, 53(8), 481-485.

Chambers, J. M., W. S. Cleveland, B. Kleiner, and P. A. Tukey (1983),
\emph{Graphical Methods for Data Analysis}, Duxbury Press, Boston.

Clopper, C. J. and Pearson, E. S. (1934), "The Use of Confidence or
Fiducial Limits Illustrated in the Case of the Binomial," \emph{Biometrika},
26, 404-413.

Cohen, A. C. (1991), \emph{Truncated and Censored Samples}, Marcel Dekker,
Inc., New York.

Crow, E. L. and K. Shimizu (1988), \emph{Lognormal Distribution}, Marcel
Decker, New York.

Cox, D. R. and D. V. Hinkley (1979), \emph{Theoretical Statistics}, Chapman and
Hall, New York.

Cox, D. R. and D. Oakes (1984), \emph{Analysis of Survival Data}, Chapman and
Hall, New York.

Department of Energy (December, 1999), "Chronic Beryllium Disease
Prevention Program, Federal Register," \emph{10 CFR Part 850}, volume 64, number 235, 68854-68914.

Fowlkes, E. B. (1979), "Some Methods for Studying the Mixture of Two
Normal (Lognormal) Distributions," \emph{Journal of the American Statistical
Association}, 74, 561-575.

Frome, E. L. and Wambach, P. F. (2005), "Statistical Methods and Software for
the Analysis of Occupational Exposure Data with Non-Detectable Values,"
\emph{ORNL/TM-2005/52,Oak Ridge National Laboratory}, Oak Ridge, TN 37830.
Available at: \url{http://www.csm.ornl.gov/esh/aoed/ORNLTM2005-52.pdf}

Hahn, G. J. and W. Q. Meeker (1991), \emph{Statistical Intervals}, John Wiley
and Sons, New York.

Hewett, P. and G. H. Ganser, (1997), "Simple Procedures for Calculating
Confidence Intervals Around the Sample Mean and Exceedance Fraction
Derived from Lognormally Distributed Data," \emph{Applied Occupational and
Environmental Hygiene}, 12(2), 132-147.

Helsel, D. (1990), "Less Than Obvious: Statistical Treatment of Date
Below the Detection Limit," \emph{Environmental Science and Technology},
24(12), 1767-1774.

Hesel, D. R. and T. A. Cohn (1988), "Estimation of Descriptive Statistics
for Multiply Censored Water Quality Data," \emph{Water Resources Research},
24, 1997-2004.

Johnson, N. L. and B. L. Welch (1940), "Application of the Non-Central
t-Distribution," \emph{Biometrika}, 31(3/4), 362-389.

Ignacio, J. S. and W. H. Bullock (2006), \emph{A Strategy for Assessing
and Managing Occupational Exposures}, Third Edition, AIHA Press,
Fairfax, VA.

Kalbfleisch, J. D. and R. L. Prentice (1980), \emph{The Statistical Analysis
of Failure Time Data}, John Wiley and Sons, New York.

Kaplan, E. L. and Meir, P. (1958), "Nonparametric Estimation from
Incomplete Observations," \emph{Journal of the American Statistical
Association}, 457-481.

Land, C. E. (1972), "An Evaluation of Approximate Confidence Interval
Estimation Methods for Lognormal Means," \emph{Technometrics}, 14(1),
145-158.

Lyles R. H. and L. L. Kupper (1996), "On Strategies for Comparing Occupational
Exposure Data to Limits," \emph{American Industrial Hygiene Association
Journal}, 57:6-15.

Meeker, W. Q. and L. A. Escobar (1998), \emph{Statistical Methods for
Reliability Data}, John Wiley and Sons, New York.

Moulton, L. H. and N. A. Halsey (1995), "A Mixture Model with Detection
Limits for Regression Analysis of Antibody Response on Vaccine,"
\emph{Biometrics}, 51, 1570-1578.

Mulhausen, J. R. and J. Damiano (1998), \emph{ A Strategy for Assessing
 and Managing Occupational Exposures}, Second Edition, AIHA Press, Fairfax, VA.

Neuman, M. C., P. M. Dixon, B. B. Looney, and J. E. Pinder (1989),
"Estimating Mean and Variance for Environmental Samples with Below
Detection Limit Observations," \emph{Water Resources Bulletin}, 25, 905-916.

Ng, M. P. (2002), "A Modification of Peto's Nonparametric Estimation of
Survival Curves for Interval-Censored Data," \emph{Biometrics}, volume 58,
number 2, pp. 439-442.

Odeh, R. E. and D. B. Owen (1980), \emph{Tables for Normal Tolerance Limits,
Sampling Plans, and Screening}, Marcel Deker, New York.

Peto, R. (1973), "Experimental Survival Curves for Interval-censored
Data," \emph{Applied Statistics}, volume 22, number 1, pp. 86-91.

Schmee, J., D. Gladstein, and W. Nelson (1985), "Confidence Limits for
Parameters of a Normal Distribution From Singly Censored Samples,
Using Maximum Likelihood," \emph{Technometrics}, 27, 119-128.

Schmoyer, R. L., J. J. Beauchamp, C. C. Brandt and F. O. Hoffman, Jr.
(1996), "Difficulties with the Lognormal Model in Mean Estimation and
Testing," \emph{Environmental and Ecological Statistics}, 3, 81-97.

Sommerville, P. N. (1958), "Tables for Obtaining Non-Parametric
Confidence Limits," \emph{Annals of Mathematical Statistics}, 29, 599-601.

Taylor, D. J., L. L. Kupper, S. M. Rappaport, and R. H. Lyles (2001), "A Mixture Model for Occupational Exposure Mean Testing with a
Limit of Detection," \emph{Biometrics}, 57, 681-688.

Tuggle, R. M. (1982), "Assessment of Occupational Exposure Using
One-Sided Tolerance Limits," \emph{American Industrial Hygiene Association
Journal}, 43, 338-346.

Turnbull, B. W. (1976), "The Empirical Distribution Function with
Arbitrarily Grouped, Censored and Truncated Data," \emph{Journal of the
Royal Statistical Society}, Series B (Methodological), 38(3), 290-295.

Venables, W. N. and B. D. Ripley (2002), \emph{Modern Applied Statistics
with S}, 4th edition. Springer-Verlag, New York.

Verrill, S. and R. A. Johnson (1998), "Tables and Large-Sample
Distribution Theory for Censored-Data Correlation Statistics for
Testing Normality," \emph{Journal of the American Statistical Association},
83(404), 1192-1197.

Waller, L. A., and B. W. Turnbull, (1992), "Probability Plotting with
Censored Data," \emph{The American Statistician}, 46(1), 5-12.
}


\section{Acknowledgements}{This work was supported in part by the Office of
Health, Safety, and Security of the U. S. Department of Energy and was
performed in the Computer Science and Mathematics Division (CSMD) at
the Oak Ridge National Laboratory, which is managed by UT-Battelle,
LLC under Contract No. DE-AC05-00OR22725.  Additional funding and
oversight have been provided through the Occupational Exposure and
Worker Studies Group, Oak Ridge Institute for Science and Education,
which is managed by Oak Ridge Associated Universities under Contract
No. DE-AC05-060R23100.

This report was prepared as an account of work sponsored by an agency
of the United States Government. Neither the United States government
nor any agency thereof, nor any of their employees, makes any
warranty, express or implied, or assumes any legal liability or
responsibility for the accuracy, completeness, or usefulness of any
information, apparatus, product, or process disclosed, or represents
that its use would not infringe privately owned rights. Reference
herein to any specific commercial product, process, or service by
trade name, trademark, manufacturer, or otherwise, does not
necessarily constitute or imply its endorsement, recommendation, or
favoring by the United States Government or any agency thereof. The
views and opinions of authors expressed herein do not necessarily
state or reflect those of the United States Government or any agency
thereof.

The work has been authored by a contractor of the U.S. Government.
Accordingly, the U.S. Government retains a nonexclusive, royalty-free
license to publish or reproduce the published form of this work, or to
allow others to do so for U. S. Government purposes.
}
\note{Throughout this document and the online help files the greek letter \eqn{\gamma} is used to represent the confidence level for a one-sided confidence limit (default value 0.95). This is represented by \code{gam} or \code{gamma} in the argument list and value of functions that compute confidence limits.}

\examples{
# Example 1 from Frome and Wambach (2005) ORNL/TM-2005/52
# NOTE THAT FUNCTIONS NAMES AND DETAILS HAVE BEEN REVISED IN THIS PACKAGE
# the results are the same. For example lnorm.ml() replaces mlndln().
data(SESdata)
mle<-lnorm.ml(SESdata)
unlist(mle[1:4])             # ML estimates mu sigma E(X) and sigma^2
unlist(mle[5:8])            # ML Estimates of standard errors
unlist(mle[9:13])            # additional  output from ORNL/TM-2005/52
IH.summary(SESdata,L=0.2)    #  All sumarry statistics for SESdata
#  lognormal q-q plot for SESdata Figure in ORNL/TM-2005/52
qq.lnorm(plend(SESdata),mle$mu,mle$sigma)
title("SESdata: Smelter-Elevated Surfaces")
}


\keyword{package}
