﻿
drop table tm_lz.lt_RWG_ANALYSIS_DATA;
drop table tm_lz.lt_RWG_ANALYSIS;

  CREATE TABLE tm_lz.lt_RWG_ANALYSIS_DATA
   (	STUDY_ID character varying(200), 
	PROBESET character varying(200), 
	FOLD_CHANGE character varying(500), 
	PVALUE character varying(500), 
	RAW_PVALUE character varying(500), 
	MIN_LSMEAN character varying(500), 
	MAX_LSMEAN character varying(500), 
	ANALYSIS_CD character varying(100), 
	BIO_ASSAY_ANALYSIS_ID character varying(500), 
	ADJUSTED_PVALUE character varying(500)
   )
WITH (
  OIDS=FALSE
)TABLESPACE transmart;


ALTER TABLE tm_lz.lt_RWG_ANALYSIS_DATA
  OWNER TO tm_lz;



  CREATE TABLE tm_lz.lt_RWG_ANALYSIS
   (	STUDY_ID character varying(500 ), 
	COHORTS character varying(500 ), 
	ANALYSIS_ID character varying(500 ), 
	PVALUE_CUTOFF character varying(500), 
	FOLDCHANGE_CUTOFF character varying(500), 
	LSMEAN_CUTOFF character varying(500), 
	ANALYSIS_TYPE character varying(500 ), 
	DATA_TYPE character varying(500 ), 
	PLATFORM character varying(500 ), 
	LONG_DESC character varying(500 ), 
	SHORT_DESC character varying(500 ), 
	IMPORT_DATE date not null default CURRENT_DATE, 
	BIO_ASSAY_ANALYSIS_ID character varying(500)
   )
WITH (
  OIDS=FALSE
)TABLESPACE transmart;


ALTER TABLE tm_lz.lt_RWG_ANALYSIS
  OWNER TO tm_lz;
  
  
 
  CREATE TABLE tm_wz.rwg_analysis
   (	STUDY_ID character varying(500 ), 
	COHORTS character varying(500 ), 
	ANALYSIS_ID character varying(500 ), 
	PVALUE_CUTOFF character varying(500), 
	FOLDCHANGE_CUTOFF character varying(500), 
	LSMEAN_CUTOFF character varying(500), 
	ANALYSIS_TYPE character varying(500 ), 
	DATA_TYPE character varying(500 ), 
	PLATFORM character varying(500 ), 
	LONG_DESC character varying(500 ), 
	SHORT_DESC character varying(500 ), 
	IMPORT_DATE date not null default CURRENT_DATE, 
	BIO_ASSAY_ANALYSIS_ID bigint
   )
WITH (
  OIDS=FALSE
)TABLESPACE transmart;


ALTER TABLE tm_wz.rwg_analysis
  OWNER TO tm_wz;
 

  CREATE TABLE TM_WZ.RWG_ANALYSIS_DATA
   (	STUDY_ID character varying(500 ), 
	PROBESET character varying(500 ), 
	FOLD_CHANGE numeric, 
	PVALUE numeric, 
	RAW_PVALUE numeric, 
	MIN_LSMEAN numeric, 
	MAX_LSMEAN numeric, 
	ANALYSIS_CD character varying(500 ), 
	BIO_ASSAY_ANALYSIS_ID bigint, 
	ADJUSTED_PVALUE numeric
   ) WITH (
  OIDS=FALSE
)TABLESPACE transmart;

ALTER TABLE TM_WZ.RWG_ANALYSIS_DATA
  OWNER TO tm_wz;
   
GRANT ALL ON TABLE TM_WZ.RWG_ANALYSIS_DATA TO tm_cz;

 
 
CREATE TABLE tm_wz.tmp_assay_analysis_metrics
   (	BIO_ASSAY_ANALYSIS_ID	bigint,
	DATA_CT	numeric,
	FC_MEAN	numeric,
	FC_STDDEV numeric
   )
WITH (
  OIDS=FALSE
)TABLESPACE transmart;
ALTER TABLE tm_wz.tmp_assay_analysis_metrics
  OWNER TO tm_wz;
GRANT ALL ON TABLE tm_wz.tmp_assay_analysis_metrics TO tm_wz;
GRANT ALL ON TABLE tm_wz.tmp_assay_analysis_metrics TO tm_cz;



 --Add new columns to BIOMART.BIO_ASSAY_ANALYSIS
ALTER TABLE biomart.bio_assay_analysis ADD COLUMN LSMEAN_CUTOFF numeric(9,2);
alter table BIOMART.BIO_ASSAY_ANALYSIS ADD COLUMN ANALYSIS_UPDATE_DATE timestamp without time zone;
  
ALTER TABLE biomart.bio_assay_analysis_data ADD COLUMN lsmean1 numeric(9,2);
ALTER TABLE biomart.bio_assay_analysis_data ADD COLUMN lsmean2 numeric(9,2);
  

create table tm_wz.BIO_ASSAY_ANALYSIS_DATA_NEW as
(select * from biomart.bio_assay_analysis_data where 1=2);
ALTER TABLE tm_wz.BIO_ASSAY_ANALYSIS_DATA_NEW
  OWNER TO tm_wz;

 
GRANT ALL PRIVILEGES ON SCHEMA DEAPP TO TM_CZ;
GRANT ALL PRIVILEGES ON SCHEMA BIOMART TO TM_CZ;
GRANT ALL PRIVILEGES ON SCHEMA TM_WZ TO TM_CZ;

GRANT ALL ON TABLE tm_lz.lt_rwg_analysis_data TO tm_cz;
GRANT ALL ON TABLE tm_wz.bio_assay_analysis_data_new TO tm_cz;
GRANT ALL ON TABLE  BIOMART.bio_experiment TO tm_cz;
GRANT ALL ON TABLE  BIOMART.bio_assay_analysis TO tm_cz;
GRANT ALL ON TABLE  BIOMART.bio_assay_platform  TO tm_cz;
GRANT ALL ON TABLE  biomart.bio_data_omic_marker  TO tm_cz;
GRANT ALL ON TABLE  biomart.bio_assay_data_annotation  TO tm_cz;
GRANT ALL ON TABLE  DEAPP.de_gpl_info TO tm_cz;
GRANT ALL ON TABLE  DEAPP.de_subject_sample_mapping  TO tm_cz;
GRANT ALL ON TABLE  tm_wz.BIO_ASSAY_ANALYSIS_DATA_NEW TO tm_cz;  
  

