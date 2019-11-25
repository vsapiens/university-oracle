--Query 1

--Query 2

--Query 3
SELECT deref(COLUMN_VALUE).firstName || ' ' || deref(COLUMN_VALUE).lastName as "Name" , deref(COLUMN_VALUE).dob as "Date of Birth"
FROM THE (SELECT c.members FROM campusClub c WHERE c.cid = 101)
--Query 4
Select deref(Advisor).firstName || ' ' || deref(Advisor).lastName as "Avisor Name",deref(Advisor).rank as "Rank", deref(deref(Advisor).worksin).name as "Dpt. Name"
from CampusClub c
WHERE c.name = 'Club2'