SELECT 
    CASE 
        WHEN Crm_Cd_Desc LIKE '%ASSAULT%' OR Crm_Cd_Desc LIKE '%BATTERY%' OR Crm_Cd_Desc LIKE '%HOMICIDE%' THEN 'Violent Crimes'
        WHEN Crm_Cd_Desc LIKE '%RAPE%' OR Crm_Cd_Desc LIKE '%SEXUAL%' OR Crm_Cd_Desc LIKE '%LEWD%' THEN 'Sex Crimes'
        WHEN Crm_Cd_Desc LIKE '%BURGLARY%' OR Crm_Cd_Desc LIKE '%THEFT%' OR Crm_Cd_Desc LIKE '%SHOPLIFT%' THEN 'Property Crimes'
        WHEN Crm_Cd_Desc LIKE '%STOLEN%' OR Crm_Cd_Desc LIKE '%VEHICLE%' OR Crm_Cd_Desc LIKE '%AUTO%' THEN 'Vehicle-Related Crimes'
        WHEN Crm_Cd_Desc LIKE '%FIREARM%' OR Crm_Cd_Desc LIKE '%WEAPON%' THEN 'Weapons & Explosives'
        WHEN Crm_Cd_Desc LIKE '%CHILD%' OR Crm_Cd_Desc LIKE '%CHLD%' OR Crm_Cd_Desc LIKE '%MINOR%' THEN 'Crimes Against Children'
        WHEN Crm_Cd_Desc LIKE '%FRAUD%' OR Crm_Cd_Desc LIKE '%FORGERY%' THEN 'Fraud & Financial Crimes'
        WHEN Crm_Cd_Desc LIKE '%DRUG%' OR Crm_Cd_Desc LIKE '%ALCOHOL%' THEN 'Drug & Alcohol-Related Crimes'
        WHEN Crm_Cd_Desc LIKE '%TRESPASS%' OR Crm_Cd_Desc LIKE '%DISTURBING%' THEN 'Public Disturbance'
        WHEN Crm_Cd_Desc LIKE '%TRAFFICKING%' OR Crm_Cd_Desc LIKE '%EXPLOITATION%' THEN 'Human Trafficking & Exploitation'
        WHEN Crm_Cd_Desc LIKE '%THREAT%' OR Crm_Cd_Desc LIKE '%HARASS%' THEN 'Threats & Harassment'
        WHEN Crm_Cd_Desc LIKE '%COURT%' OR Crm_Cd_Desc LIKE '%VIOLATION%' THEN 'Court & Legal Violations'
        ELSE 'Other Crimes'
    END AS Crime_Category,
    Vict_Sex,
    Vict_Descent,
    CASE 
        WHEN Vict_Age <= 0 THEN 'NA'
        WHEN Vict_Age BETWEEN 1 AND 12 THEN 'Child (1-12)'
        WHEN Vict_Age BETWEEN 13 AND 17 THEN 'Teen (13-17)'
        WHEN Vict_Age BETWEEN 18 AND 25 THEN 'Young Adult (18-25)'
        WHEN Vict_Age BETWEEN 26 AND 40 THEN 'Adult (26-40)'
        WHEN Vict_Age BETWEEN 41 AND 60 THEN 'Middle-Aged (41-60)'
        ELSE 'Senior (60+)'
    END AS Age_Group,
    COUNT(*) AS Crime_Count
FROM crime_data_from_2020_to_present
GROUP BY Crime_Category, Vict_Sex, Vict_Descent, Age_Group
ORDER BY Crime_Category, Vict_Sex, Vict_Descent, Age_Group;
