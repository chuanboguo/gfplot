SELECT
  DATABASE_NAME,
  FISHERY_SECTOR,
  GEAR,
  BEST_DATE,
  FE_START_DATE,
  FE_END_DATE,
  SPECIES_SCIENTIFIC_NAME,
  SPECIES_COMMON_NAME,
  LANDED_KG,
  DISCARDED_KG,
  LANDED_PCS,
  DISCARDED_PCS,
  MC.MAJOR_STAT_AREA_CODE,
  MC.MINOR_STAT_AREA_CODE
	MSA.MAJOR_STAT_AREA_DESCRIPTION
FROM GFFOS.dbo.GF_MERGED_CATCH MC
INNER JOIN GFFOS.dbo.SPECIES SP ON SP.SPECIES_CODE = MC.SPECIES_CODE
INNER JOIN GFBioSQL.dbo.MAJOR_STAT_AREA MSA ON MC.MAJOR_STAT_AREA_CODE = MSA.MAJOR_STAT_AREA_CODE
-- insert species here
ORDER BY BEST_DATE, SPECIES_COMMON_NAME
