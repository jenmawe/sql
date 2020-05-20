/* This query was developed by Steve Bischoff and modified afterwards. It uses the z00r table in Aleph to display the:
Bib system number
MARC Field - in this example 852
Value in that MARC field above
MARC Field - 2nd one and in this example 002
Value in that MARC field above
OWN code
STA code
Value in the STA code above.
The STA here is configured in the table own_sta so that it displays a SUPPRESSED value or null when the bib record isn't suppressed.
This query orders the result by own text. This searches all bib records across the 5C.
*/
SELECT
    h1.z00r_doc_number,
    h1.z00r_field_code,
    h1.z00r_text,
    z1.z00r_field_code,
    z1.z00r_text,
    z2.own_txt,
    z2.staf,
    z2.sta_txt
FROM
    Fcl01.z00r h1, FCL01.z00r z1, fcl01.own_sta z2
WHERE
    h1.z00r_field_code like '852%'
AND
    h1.z00r_doc_number = z1.z00r_doc_number
AND
    z2.sys = h1.z00r_doc_number
AND
    z1.z00r_field_code LIKE '002%'
ORDER BY
    z2.own_txt;
