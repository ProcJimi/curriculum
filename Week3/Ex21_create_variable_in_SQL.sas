*Ex21_create_variable_in_SQL.sas;
options nodate nonumber;
PROC SQL;
SELECT name, weight format=6.1,
  CASE
  WHEN weight <100 THEN '<100 lbs'
  WHEN weight GE 100 AND weight LT 120 THEN '100-<120 lbs'
  WHEN weight GE 120 AND weight LE 150 THEN '120-150 lbs'
  ELSE '120-150 lbs'
  END AS Weight_Cat label= 'Weight Category'
FROM sashelp.class
ORDER BY weight;
QUIT;

