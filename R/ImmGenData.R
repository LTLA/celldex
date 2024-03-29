#' Obtain mouse bulk expression data from the Immunologic Genome Project
#'
#' Download and cache the normalized expression values of 830 microarray samples of
#' pure mouse immune cells, generated by the Immunologic Genome Project (ImmGen).
#'
#' @inheritParams HumanPrimaryCellAtlasData
#'
#' @details
#' This function provides normalized expression values of 830 microarray samples
#' generated by ImmGen from pure populations of murine immune cells (<http://www.immgen.org/>).
#' The samples were processed and normalized as described in Aran, Looney and
#' Liu et al. (2019), i.e., CEL files from the Gene Expression Omnibus (GEO; GSE15907 and GSE37448), 
#' were downloaded, processed, and normalized using the robust multi-array average
#' (RMA) procedure on probe-level data.
#' 
#' This dataset consists of 20 broad cell types (\code{"label.main"}) and 253
#' finely resolved cell subtypes (\code{"label.fine"}).
#' The subtypes have also been mapped to the Cell Ontology (\code{"label.ont"},
#' if \code{cell.ont} is not \code{"none"}), which can be used for further programmatic
#' queries.
#'
#' @return A \linkS4class{SummarizedExperiment} object with a \code{"logcounts"} assay
#' containing the log-normalized expression values, along with cell type labels in the 
#' \code{\link{colData}}.
#'
#' @author Friederike Dündar
#' 
#' @references
#' Heng TS, Painter MW, Immunological Genome Project Consortium (2008).
#' The Immunological Genome Project: networks of gene expression in immune cells.
#' \emph{Nat. Immunol.} 9, 1091-1094. 
#' 
#' Aran D, Looney AP, Liu L et al. (2019). 
#' Reference-based analysis of lung single-cell sequencing reveals a transitional profibrotic macrophage.
#' \emph{Nat. Immunol.} 20, 163–172. 
#' 
#' @examples
#' ref.se <- ImmGenData()
#' 
#' @export
ImmGenData <- function(ensembl=FALSE, cell.ont=c("all", "nonna", "none"), legacy=FALSE) {
    cell.ont <- match.arg(cell.ont)

    if (!legacy && cell.ont == "all") {
        se <- fetchReference("immgen", "2024-02-26", realize.assays=TRUE)
    } else {
        se <- .create_se("immgen", version = "1.0.0",
            assays="logcounts", rm.NA = "none",
            has.rowdata = FALSE, has.coldata = TRUE)
        se <- .add_ontology(se, "immgen", cell.ont)
    }

    se <- .convert_to_ensembl(se, "Mm", ensembl)

    se
}
