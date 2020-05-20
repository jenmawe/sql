/* This query counts the number of occurences for each MARC field where the own code is equal to YB. 
In other words, this coulds the number of occurences for all Yiddish Book Center MARC fields in their bibliographic records.
The query orders the results by the MARC tag.
*/
SELECT
    substr(h1.z00r_field_code, 1, 3),
    count(substr(h1.z00r_field_code, 1, 3))
FROM
    Fcl01.z00r h1, fcl01.own_sta z2
WHERE
    h1.z00r_doc_number = z2.sys
AND
    z2.own_txt like '%YB%'
GROUP BY
    substr(h1.z00r_field_code, 1, 3)
ORDER BY
   substr(h1.z00r_field_code, 1, 3)
