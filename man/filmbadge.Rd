\name{filmbadge}
\alias{filmbadge}
\docType{data}
\title{Quarterly Film Badge Data}

\description{Example of quarterly film badge data with non-detects}  

\usage{data(filmbadge)}
\format{
  A data frame with 28 observations on the following 6 variables.
  \describe{
    \item{dlow}{lower end of annual dose}
    \item{dhigh}{upper end of annual}
    \item{Q1}{dose for quarter 1}
    \item{Q2}{dose for quarter 2}
    \item{Q3}{dose for quarter 3}
    \item{Q4}{dose for quarter 4}
  }
}

\details{The product limit estimate (PLE) of the distribution function
F(x) was first proposed by Kaplan and Meier (1958) for right-censored
data, and Schmoyer et. al. (1996) defined the PLE for situations in
which left censored data occurs.  Both left censoring and right
censoring are special cases of the general PLE (Peto,1973; Turnbull,
1976).  A non-detect or left censored dose occurs when the dose is
less than a detection limit. For a non-detect it is only known that
the dose does not exceed the limit of detection(LOD).  To obtain an
estimate of the annual dose distribution F(x) from quarterly doses the
general PLE is required since the annual doses will be "interval
censored" if at least two of the quarterly doses are non-detects.
Consider, for example, a worker with quarterly dose of 0, 50, 0, and
100 mrem.  The quarterly interval doses are (0,30), (50,50), (0,30),
and (100,100) assuming an LOD of 30 mrem.  The annual dose is obtained
by adding the lower and upper bounds of the quarterly doses and is
equal to (150,210) for the example, i.e., it is only known that the
dose is between 150 and 210.  }

\note{ The dose unit is mrem (100 mrem= 10mSv). The LOD is 30 mrem.  This
is a representative sample of quarterly external dose records for 28
workers at the Y-12 facility in Oak Ridge (see \emph{ORAUT-OTIB-0044,
Rev. 01-A} and \emph{ORAUT-OTIB-0064}) and is used here to illustrate
the calculation of the PLE for interval censored data.  The R function
\code{survreg} can be used to obtain ML estimates of the parameters
for the lognormal model and the covariance matrix that is needed for
CLs for the exceedance fraction and 95th percentile.
}

\references{
Kaplan, E. L. and P. Meir (1958), "Nonparametric Estimation from Incomplete Observations," \emph{Journal of the American Statistical Association}, 457-481. 

Ng, M. P. (2002), "A Modification of Peto's Nonparametric Estimation of Survival Curves for Interval-Censored Data," \emph{Biometrics}, volume 58, number 2, pp. 439-442.

ORAUT (Oak Ridge Associated Universities Team), 2005c, "Historical Evaluation of the Film Badge Dosimetry Program at the Y-12 Facility in Oak Ridge, Tennessee:  Part 1 - Gamma Radiation", \emph{ORAUT-OTIB-0044, Rev. 01-A (was ORAUT-RPRT-0032, Rev. 00)}, Oak Ridge, Tennessee.

ORAUT (Oak Ridge Associated Universities Team), 2007, "External Coworker Dosimetry Data for the Y-12 National Security Complex". \emph{ORAUT-OTIB-0064} (Under Revision).

Peto, R. (1973), "Experimental Survival Curves for Interval-censored Data," \emph{Applied Statistics}, volume 22, number 1, pp. 86-91. 

Schmoyer, R. L., J. J. Beauchamp, C. C. Brandt and F. O. Hoffman, Jr. (1996), "Difficulties with the Lognormal Model in Mean Estimation and Testing," \emph{Environmental and Ecological Statistics}, 3, 81-97.

Turnbull, B. W. (1976), "The Empirical Distribution Function with Arbitrarily Grouped, Censored and Truncated Data," \emph{Journal of the Royal Statistical Society}, Series B (Methodological), 38(3), 290-295.
}
\examples{
data(filmbadge)
head(filmbadge)  #  LOOK AT FIRST FIVE RECORDS
#   USE icfit() TO CALCULATE PLE FOR INTERVAL CENSORED DATA
par( mfrow=c(1,2) )
out <- icfit(filmbadge$dlow,filmbadge$dhigh)
#   PLOT EXCEEDANCE S(x) vs x USING icplot()
tp <- "PLE of Exceedance for Filmbadge Data" 
icplot(out$surv, out$time,XLAB="Dose",YLAB="Exceedance Probability",main=tp,cex.main=.8)
#   USE pleicf() TO CALCULATE PLE FOR filmbadge DATA
ple.fb <- pleicf(filmbadge[,1:2],FALSE)
#   USE qq.lnorm  FOR LOGNORMAL Q-Q PLOT FOR INTERVAL CENSORED DATA
tmp <- qq.lnorm(ple.fb)  
GM <-round(exp(tmp$par[1])); GSD <- round(exp(tmp$par[2]),2)
tp<-paste("Lognormal Q-Q plot for Filmbadge\n  Data GM= ",GM,"GSD= ",GSD)
title(tp,cex.main=0.8) # title for q-q plot with graphical parameter estimates
#  RESULTS FROM  pleicf()
round(ple.fb,3)
#

}
\keyword{datasets}

