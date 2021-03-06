% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/survey-index.R
\name{plot_survey_index}
\alias{plot_survey_index}
\alias{tidy_survey_index}
\title{Plot survey relative biomass mass index}
\usage{
tidy_survey_index(
  dat,
  survey = c("SYN WCHG", "SYN HS", "SYN QCS", "SYN WCVI", "HBLL OUT N", "HBLL OUT S",
    "HBLL INS N", "HBLL INS S", "MSA HS", "IPHC FISS"),
  min_years = 3,
  year_range = NULL
)

plot_survey_index(
  dat,
  col = brewer.pal(9, "Greys")[c(3, 7)],
  max_cv = 0.4,
  max_set_fraction = 0.05,
  xlim = NULL,
  survey_cols = NULL,
  scale = TRUE,
  year_increment = 5,
  french = FALSE,
  hide_y_axis = FALSE
)
}
\arguments{
\item{dat}{For \code{\link[=tidy_survey_index]{tidy_survey_index()}}, data from \code{\link[=get_survey_index]{get_survey_index()}}. For
\code{\link[=plot_survey_index]{plot_survey_index()}}, data from \code{\link[=tidy_survey_index]{tidy_survey_index()}}.}

\item{survey}{A character vector of survey abbreviations to include.}

\item{min_years}{The minimum number of years for a survey before it is
included.}

\item{year_range}{If not \code{NULL}, a numeric vector of length 2 giving the
range of years to plot.}

\item{col}{A vector of two colours for the lines and shading.}

\item{max_cv}{A coefficient of variation above which a panel will be shaded
as more uncertain.}

\item{max_set_fraction}{A fraction of positive sets above which a panel will
be shaded as more uncertain.}

\item{xlim}{If not \code{NULL}, the x axis limits.}

\item{survey_cols}{If not \code{NULL}, a named character vector of colors for the
various surveys.}

\item{scale}{Logical: scale the biomass by the maximum?}

\item{year_increment}{Increment for the year x axis.}

\item{french}{Logical for French or English.}

\item{hide_y_axis}{Logical: hide the y axis ticks and labels?}
}
\description{
Plot survey relative biomass mass index
}
\examples{
\dontrun{
get_survey_index("lingcod") \%>\%
  tidy_survey_index() \%>\%
  plot_survey_index()
}
}
