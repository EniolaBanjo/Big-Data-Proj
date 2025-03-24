SELECT COUNT(*) AS firearm_crimes_count
FROM crime_data_from_2020_to_present
WHERE Weapon_Desc LIKE '%firearm%'
   OR Weapon_Desc LIKE '%gun%'
   OR Weapon_Desc LIKE '%pistol%';