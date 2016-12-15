MDS_Chr22_RUNNAMES <- c("SRR1691633_ZRSR2Mut","SRR1691634_ZRSR2Mut","SRR1691635_ZRSR2Mut","SRR1691636_ZRSR2Mut","SRR1691637_ZRSR2Mut","SRR1691638_ZRSR2Mut","SRR1691639_ZRSR2Mut","SRR1691640_ZRSR2Mut","SRR1691641_WT","SRR1691642_WT","SRR1691643_WT","SRR1691644_WT","SRR1691645_Normal","SRR1691646_Normal","SRR1691647_Normal","SRR1691648_Normal")

MDS_Chr22_BAMFILES <- NULL

.onLoad <- function(libname, pkgname)
{
    tmp <- sapply(MDS_Chr22_RUNNAMES,
                  function(runname)
                      system.file("extdata", paste0(runname, ".bam"),
                                  package=pkgname, lib.loc=libname))
    names(tmp) <- MDS_Chr22_RUNNAMES
    MDS_Chr22_BAMFILES <<- tmp
}

