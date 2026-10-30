SET PAGESIZE 1000
SET LINESIZE 1000

--uppgift A
PROMPT Uppgift A: Antal ansökningar per utbildningsområde

SELECT
	utbildningsområde,
	COUNT(*) AS antal_undersökningar
FROM applications
GROUP BY utbildningsområde
ORDER BY antal_undersökningar DESC;

--uppgift B
PROMPT Uppgift B: Antal beviljade ansökningar

SELECT
	utbildningsområde,
	COUNT(*) AS antal_undersökningar
FROM applications
WHERE beslut = 'Beviljad'
GROUP BY utbildningsområde
ORDER BY antal_undersökningar DESC;

--uppgift C
PROMPT Uppgift C: Antal avslagna ansökningar

SELECT
	utbildningsområde,
	COUNT(*) AS antal_undersökningar
FROM applications
WHERE beslut = 'Avslag'
GROUP BY utbildningsområde
ORDER BY antal_undersökningar DESC;

--uppgift D
PROMPT Uppgift D: Beviljade ansökningar inom Data/IT

SELECT
	utbildningsnamn,
	COUNT(*) AS antal_undersökningar
FROM applications
WHERE beslut = 'Beviljad' AND utbildningsområde = 'Data/IT'
GROUP BY utbildningsnamn
ORDER BY antal_undersökningar DESC;

--uppgift E

PROMPT Uppgift E: Avslagna ansökningar inom Data/IT

SELECT
	utbildningsnamn,
	COUNT(*) AS antal_undersökningar
FROM applications
WHERE beslut = 'Avslag' AND utbildningsområde = 'Data/IT'
GROUP BY utbildningsnamn
ORDER BY antal_undersökningar DESC;

DESC applications;
--uppgift F

PROMPT Uppgift F: Antal BEVILJADE ansökningar per utbildningsanordnare administrativ enhet och utbildningsnamn, inom Data/IT

SELECT
	utbildningsnamn,
	UTBILDNINGSANORDNARE_ADMINISTR,
	COUNT(*) AS antal_undersökningar
FROM applications
WHERE beslut = 'Beviljad' AND utbildningsområde = 'Data/IT'
GROUP BY UTBILDNINGSANORDNARE_ADMINISTR, utbildningsnamn
ORDER BY antal_undersökningar DESC;

--Uppgift G

PROMPT Uppgift G: Topp 5 län efter antal beviljade ansökningar

SELECT
	län,
	COUNT(*) AS antal_undersökningar
FROM applications
WHERE beslut = 'Beviljad'
GROUP BY län
ORDER BY antal_undersökningar DESC
FETCH FIRST 5 ROWS ONLY;

--Uppgift H

PROMPT Uppgift H: Andel distans och andel bundna utbildningar inom respektive utbildingsområde

SELECT
	utbildningsområde,
	studieform,
	COUNT(*) AS antal_utbildningar
FROM applications
GROUP BY utbildningsområde, studieform
ORDER BY utbildningsområde DESC;

-- Uppgift I

PROMPT Uppfigt I: Antal utbildningar som innehåller ordet AI

SELECT
	COUNT(DISTINCT utbildningsnamn) AS antal_AI_utbildningar
FROM applications
WHERE utbildningsnamn LIKE '%AI%';

EXIT
