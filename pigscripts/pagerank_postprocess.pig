%default OUTPUT_PATH 's3n://mortar-example-output-data/$MORTAR_EMAIL_S3_ESCAPED/pagerank_output'

final_pageranks     =   LOAD '$PAGERANKS_INPUT_PATH' USING PigStorage() AS (node: chararray, pagerank: double);
non_null            =   FILTER final_pageranks BY (pagerank is not null);
out                 =   ORDER non_null BY pagerank DESC;

rmf $OUTPUT_PATH;
STORE out INTO '$OUTPUT_PATH' USING PigStorage();
