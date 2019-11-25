

--Query 3
SELECT deref(COLUMN_VALUE).firstName, deref(COLUMN_VALUE).dob
FROM THE (SELECT c.members FROM campusClub c WHERE c.cid = 101)