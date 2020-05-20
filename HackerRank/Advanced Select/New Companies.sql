SELECT C.*
     , COUNT(DISTINCT L.lead_manager_code)
     , COUNT(DISTINCT S.senior_manager_code )
     , COUNT(DISTINCT M.manager_code )
     , COUNT(DISTINCT E.employee_code )
FROM Company C, Lead_Manager L, Senior_Manager S, Manager M, Employee E
WHERE C.company_code = L.company_code
    AND L.lead_manager_code = S.lead_manager_code
    AND S.senior_manager_code = M.senior_manager_code
    AND M.manager_code = E.manager_code
GROUP BY C.company_code, C.founder
ORDER BY C.company_code


SELECT C.*
     , COUNT(DISTINCT L.lead_manager_code)
     , COUNT(DISTINCT S.senior_manager_code )
     , COUNT(DISTINCT M.manager_code )
     , COUNT(DISTINCT E.employee_code )
FROM Company C
    JOIN Lead_Manager L ON C.company_code = L.company_code
    JOIN Senior_Manager S ON L.lead_manager_code = S.lead_manager_code
    JOIN Manager M ON S.senior_manager_code = M.senior_manager_code
    JOIN Employee E ON M.manager_code = E.manager_code
GROUP BY C.company_code, C.founder
ORDER BY C.company_code