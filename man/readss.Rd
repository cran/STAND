\name{readss}
\alias{readss}
\title{Read Analyze Data From ASCII  File }

\description{ Read data from fn.txt (space delimited text file) or fn.csv
(comma delimited text file) and calculate all summary statistics using
\code{\link{IH.summary}} .  Output results to an ASCII text file fnout.csv in CSV format
}

\usage{
readss(fn,L,bcol=NA,rto=5,pstat=NA,reverse=FALSE,p=0.95,gam=0.95,comma=FALSE)
}
\arguments{
 \item{fn}{name of input data file in double quotes without the .txt or .csv extension}
 \item{L}{ L is specified limit for the exceedance fraction; e.g., the occupational exposure limit}
 \item{bcol}{ Column that contains the BY variable--see details. Default NA}
 \item{rto}{Round values to rto. Default = 5}
 \item{pstat}{Select a subset of statistics calculated by  \code{\link{IH.summary}}.Dafault All}
 \item{reverse}{If \code{reverse} is TRUE reverse rows and columns in output file. Default=FALSE}
 \item{p}{ probability for Xp the 100p\emph{th} percentile. Default is 0.95}
 \item{gam}{ one-sided confidence level \eqn{\gamma}. Default is 0.95}
 \item{comma}{ if \code{TRUE},the input file is in csv format with column names. Default is \code{FALSE} }
 }

\details{Read data from a tab or comma delimited text file in the
current folder/directory.  The first column must contain measurements
(observed X values). The second column is an indicator variable with 1 for a
detected value and 0 for a non-detect.  Additional columns can contain
factors that can be used to define a BY variable.  The first record
in the file must contain valid R names. Valid names may contain
letters (case sensitive), numbers, period, and underscore and should
start with a letter ( no spaces).  This file would most likely be
obtained from an Excel spread sheet using the file "Save As" option,
with file Save as type:\cr Text(Tab delimited)(*.txt) or CSV(Comma
delimited)(*.csv).}

 \value{
  Returns invisible data.frame from file fn.txt
  \item{Column 1 }{value of measurement }
  \item{Column 2 }{indicator variable ; 1 for detect 0 for non-detect}
  \item{Column 3 }{\eqn{\ldots} additional variables}

}

\section{Side effects}{Summary statistics calculated by
\code{\link{IH.summary}} are computed for each subset of data as
defined by the levels of the BY variable.  A data frame with row names
from IH.summary (or subset based on value of \code{pstat}) and column
names defined by the values of the BY variable is output as an ASCII
text file in CSV format fnout.csv in the working folder.  If
\code{reverse} is TRUE the rows and columns are reversed.}

\references{ see the help file for \code{\link{lnorm.ml}}, \code{\link{efclnp}}
\code{\link{efraction.ml}}, \code{\link{percentile.ml}}, \code{\link{kmms}}  }

\author{E. L. Frome }

\note{For information about \code{factor} see R help file \code{\link{factor}}
Each level of the BY variable must have at least two non-detects for this function.
If this is not the case an error message is printed to the R console and the
levels of the BY variable with less than 3 non-detects are printed.
}
\seealso{  \code{\link{About-STAND}} for more details and a complete reference list}

\examples{
# to demonstrate the use of readss add a new factor grp to the cansdata
# this factor with four levels (A_1 A_2 B_1 B_2) combines strata and sample
data(cansdata)
grp <- paste(cansdata$strata,cansdata$sample,sep="_")
temp <- data.frame(cansdata,grp) # add four level factor grp to cansdata

#    the next line is NOT executable  use CUT AND PASTE
#    sink("demoread.txt") ; print(temp) ; sink()

# The preceding line writes temp to a text file demoread.txt in the current folder
# This file would normally be created by another program, e.g. Excel
#   now use readss() to read this space delimited text file and calculate
#   all of the summary statistics for each level of grp and output
#   the results to a new text file demoreadout.csv in the current folder

#     rdemo <- readss("demoread",L=0.2,bcol=5)

#  rdemo is the R data frame that was used to calculate results in demoreadout.csv
#  to see same results rounded to three places in R console use
#  round( IH.summary(rdemo,L=0.2,bcol=5), 3)

#  To select a subset of statistics from IH.summary first define the subset
#  psel<-c("Xp.obs","Xp","Xp.UCL","f","f.UCL","Rsq","m","n")
#  entering the following command will overwrite demoreadout.csv
#  with rows and columns reversed and the subset of statistics as columns
#  and the results will be rounded to 4 places
#  rdemo <- readss("demoread",L=0.2,bcol=5,rto=4,pstat=psel,rev=TRUE)
#
#  to see same results rounded to three places in R console use
#  t(round( IH.summary(rdemo,L=0.2,bcol=5)[psel,], 3))
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
