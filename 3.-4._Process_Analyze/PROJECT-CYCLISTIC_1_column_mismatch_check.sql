WITH reference AS (
  SELECT 
    column_name, 
    data_type, 
    ordinal_position
  FROM `gda-projects-2026.cyclistic_data.INFORMATION_SCHEMA.COLUMNS`
  WHERE table_name = '202505divvytripdata'
)

SELECT 
  t.table_name,
  t.column_name,
  t.data_type AS actual_type,
  r.data_type AS expected_type,
  r.ordinal_position AS expected_position,
  CASE 
    WHEN r.column_name IS NULL THEN 'EXTRA COLUMN (not in reference)'
    WHEN t.data_type != r.data_type THEN 'DATA TYPE MISMATCH'
    WHEN t.ordinal_position != r.ordinal_position THEN 'COLUMN ORDER MISMATCH'
    ELSE 'OK'
  END AS issue
FROM `gda-projects-2026.cyclistic_data.INFORMATION_SCHEMA.COLUMNS` t
LEFT JOIN reference r ON t.column_name = r.column_name
WHERE t.table_name != '202505divvytripdata'
  AND (t.table_name LIKE '2025%' OR t.table_name LIKE '2026%')  -- adjust pattern
ORDER BY t.table_name, t.ordinal_position;