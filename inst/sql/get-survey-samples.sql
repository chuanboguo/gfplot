SELECT TRIP_START_DATE,
  YEAR(TRIP_START_DATE) AS YEAR,
  MONTH(TRIP_START_DATE) AS MONTH,
  GEAR_CODE AS GEAR,
  S.SURVEY_SERIES_ID,
  S.SURVEY_ID,
  SM.MAJOR_STAT_AREA_CODE,
  MSA.MAJOR_STAT_AREA_NAME,
  SM.MINOR_STAT_AREA_CODE,
  SM.SPECIES_CODE,
  SPP.SPECIES_COMMON_NAME,
  SPP.SPECIES_SCIENCE_NAME,
  SP.SPECIMEN_ID,
  SM.SAMPLE_ID,
  SP.SPECIMEN_SEX_CODE AS SEX,
  SPECIMEN_AGE AS AGE,
  SP.AGEING_METHOD_CODE AS AGEING_METHOD,
  CAST(ROUND(Best_Length / 10.0, 1) AS DECIMAL(8,1)) AS LENGTH,
  ROUND_WEIGHT AS WEIGHT,
  SP.MATURITY_CODE,
  MD.MATURITY_NAME,
  MD.MATURITY_DESC,
  SM.MATURITY_CONVENTION_CODE,
  MC.MATURITY_CONVENTION_DESC,
  TRIP_SUB_TYPE_CODE,
  SM.SAMPLE_TYPE_CODE,
  SM.SPECIES_CATEGORY_CODE,
  SM.SAMPLE_SOURCE_CODE,
  G.GROUPING_CODE,
  G.GROUPING_DESC
FROM GFBioSQL.dbo.SURVEY S
  INNER JOIN GFBioSQL.dbo.TRIP_SURVEY TS ON
  S.SURVEY_ID = TS.SURVEY_ID
  INNER JOIN GFBioSQL.dbo.B21_Samples SM ON TS.TRIP_ID = SM.TRIP_ID
  INNER JOIN GFBioSQL.dbo.B22_Specimens SP ON SM.SAMPLE_ID = SP.SAMPLE_ID
  INNER JOIN GFBioSQL.dbo.SPECIES SPP ON SPP.SPECIES_CODE = SM.SPECIES_CODE
  INNER JOIN GFBioSQL.dbo.Maturity_Convention MC ON SM.MATURITY_CONVENTION_CODE = MC.MATURITY_CONVENTION_CODE
  INNER JOIN GFBioSQL.dbo.MAJOR_STAT_AREA MSA ON SM.MAJOR_STAT_AREA_CODE = MSA.MAJOR_STAT_AREA_CODE
  LEFT OUTER JOIN GFBioSQL.dbo.MATURITY_DESCRIPTION MD ON SM.MATURITY_CONVENTION_CODE = MD.MATURITY_CONVENTION_CODE AND SP.MATURITY_CODE = MD.MATURITY_CODE AND SP.SPECIMEN_SEX_CODE = MD.SPECIMEN_SEX_CODE
  LEFT JOIN GFBioSQL.dbo.GROUPING AS G ON G.GROUPING_CODE = SM.GROUPING_CODE
WHERE TRIP_SUB_TYPE_CODE IN (2, 3) AND
SM.SAMPLE_TYPE_CODE IN (1,2) AND
  (SPECIES_CATEGORY_CODE IS NULL OR SPECIES_CATEGORY_CODE IN (1, 5, 6, 7)) AND
  (SAMPLE_SOURCE_CODE IS NULL OR SAMPLE_SOURCE_CODE = 1) AND
  SP.MATURITY_CODE <= MC.MATURITY_CONVENTION_MAXVALUE
-- insert species here
-- insert ssid here
ORDER BY MONTH(TRIP_START_DATE)

