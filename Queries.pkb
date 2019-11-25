--Query 1

--Query 2

--Query 3
SELECT deref(COLUMN_VALUE).firstName, deref(COLUMN_VALUE).dob
FROM THE (SELECT c.members FROM campusClub c WHERE c.cid = 101)
--Query 4
Select deref(Advisor).firstName,deref(Advisor).rank, deref(deref(Advisor).worksin).name
from CampusClub c
WHERE c.cid = 102