\name{MDS.Chr22.U12Genes-package}

\alias{MDS.Chr22.U12Genes-package}
\alias{MDS.Chr22.U12Genes}
\alias{MDS_Chr22_RUNNAMES}
\alias{MDS_Chr22_BAMFILES}


\title{Aligned reads from an RNAseq experiment: Aberrant splicing of U12-type 
  introns is the hallmark of ZRSR2 mutant myelodysplastic syndrome}

\description{
  The package contains 8 BAM files, 1 per sequencing run. Each
  BAM file was obtained by (1) aligning the reads (paired-end) to the
  full hg19 genome with TopHat2, and then (2) subsetting to keep only
  alignments on chr14. See accession number E-MTAB-1147 in the
  ArrayExpress database for details about the experiment, including links
  to the published study (by Zarnack et al., 2012) and to the
  FASTQ files.

  \code{MDS_Chr22_RUNNAMES} is a predefined character vector
  containing the names of the 8 runs of the RNAseq experiment. The name of
  each run is its accession number on the European Nucleotide Archive (ENA). 

  \code{MDS_Chr22_BAMFILES} is a predefined named character
  vector of length 8 containing the paths to the 8 BAM files obtained by
  aligning the reads from each sequencing run. The reads were aligned to the
  full hg19 genome with TopHat2 and then the resulting BAM file was subset
  to keep only alignments located on chr14.
}

\usage{
MDS_Chr22_RUNNAMES
MDS_Chr22_BAMFILES
}

\details{
  The scripts/ folder in the package contains the scripts that
  were used to generate the data contained in the package (note that
  all the data contained in the package is located in its extdata/ folder).
  The README.TXT file in the scripts/ folder describes how to use those
  scripts to re-generate the data.
}

\references{
  \emph{Direct Competition between hnRNP C and U2AF65 Protects the
  Transcriptome from the Exonization of Alu Elements.}
  Kathi Zarnack, Julian Konig, Mojca Tajnik, Inigo Martincorena,
  Sebastian Eustermann, Isabelle Stevant, Alejandro Reyes, Simon Anders,
  Nicholas M. Luscombe, Jernej Ule.
  \emph{Cell} 2012, Europe PMC 23374342

  \emph{TopHat2: accurate alignment of transcriptomes in the presence of
  insertions, deletions and gene fusions.}
  Daehwan Kim, Geo Pertea, Cole Trapnell, Harold Pimentel, Ryan Kelley
  and Steven L Salzberg.
  \emph{Genome biology} 2013, 14:R36
}

\seealso{
  \itemize{
    \item \url{http://www.ebi.ac.uk/arrayexpress/experiments/E-MTAB-1147/}
          for details about the experiment, including links to the published
          study (by Kathi Zarnack et al., 2012) and to the FASTQ files.

    \item \url{http://www.ebi.ac.uk/ena/data/view/ERR127306},
          \url{http://www.ebi.ac.uk/ena/data/view/ERR127307},
          \url{http://www.ebi.ac.uk/ena/data/view/ERR127308},
          \url{http://www.ebi.ac.uk/ena/data/view/ERR127309},
          \url{http://www.ebi.ac.uk/ena/data/view/ERR127302},
          \url{http://www.ebi.ac.uk/ena/data/view/ERR127303},
          \url{http://www.ebi.ac.uk/ena/data/view/ERR127304},
          and \url{http://www.ebi.ac.uk/ena/data/view/ERR127305},
          for direct access to individual runs on the European Nucleotide
          Archive (ENA).

    \item \url{http://ccb.jhu.edu/software/tophat} for the TopHat2 software.

    \item \url{http://samtools.sourceforge.net/SAM1.pdf} for the SAM Format
          Specification.

    \item The \code{readGAlignmentPairs} function
          in the \pkg{GenomicAlignments} package for more information about
          how to read paired-end reads from a BAM file into Bioconductor.

    \item The \code{ScanBamParam} function in the
          \pkg{Rsamtools} package for how to get control over what to
          import from a BAM file.
  }
}

\value{
	Object of class \code{interestResult} from \code{IntEREst} library.
}

\examples{
#Show sample names 
print(MDS_Chr22_RUNNAMES)
print(MDS_Chr22_BAMFILES)

if (require(GenomicAlignments)) {
	#choose the first bam file
    bamFile <- MDS_Chr22_BAMFILES[1]
	# Set to read 20 pairs of reads
	bf<-BamFile(bamFile, yieldSize=20, asMates=TRUE )
	#Open file connection
	open(bf)
    scParam <- ScanBamParam(
		what=scanBamWhat()[c(1,3,5,8,13,9, 10, 6, 4, 14, 15)], 
		flag=scanBamFlag(isPaired=TRUE, 
			isDuplicate=FALSE))
	readTmp<- scanBam(bf, param=scParam)
	# The number of the loaded reads
	length(readTmp[[1]][[1]])

	# Check the number of mated, ambiguous, or unmated 
	# loaded reads
	table(readTmp[[1]]$mate_status)

}

}

\keyword{package}
