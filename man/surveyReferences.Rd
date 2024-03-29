% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/surveyReferences.R
\name{surveyReferences}
\alias{surveyReferences}
\title{Survey reference metadata}
\usage{
surveyReferences(cache = cacheDirectory(), overwrite = FALSE, latest = TRUE)
}
\arguments{
\item{cache, overwrite}{Arguments to pass to \code{\link{fetchMetadataDatabase}}.}

\item{latest}{Whether to only consider the latest version of each dataset.}
}
\value{
A \linkS4class{DataFrame} where each row corresponds to a dataset, containing various columns of metadata.
Some columns may be lists to capture 1:many mappings.
}
\description{
Metadata survey for all available reference datasets in the \pkg{celldex} package.
}
\details{
The returned DataFrame contains the usual suspects like the title and description for each dataset,
the number of samples and types of labels, the organisms and genome builds involved, and so on.
More details can be found in the Bioconductor metadata schema at \url{https://github.com/ArtifactDB/bioconductor-metadata-index}.
}
\examples{
surveyReferences()

}
\seealso{
\code{\link{searchReferences}}, to search on the metadata for specific datasets.
}
\author{
Aaron Lun
}
