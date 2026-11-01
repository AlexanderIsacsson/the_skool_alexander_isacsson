SET PAGESIZE 200
SET LINESIZE 200


PROMPT Uppgift 3 Fråga A: Vilka utbildningsområden har högst beviljandegrad i procent?

SELECT
	utbildningsområde,
	COUNT(*) AS antal_ansökningar,
	COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) AS beviljade,
	ROUND(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*), 2) AS beviljandegrad
FROM applications
GROUP BY utbildningsområde
ORDER BY beviljandegrad DESC;


PROMPT Uppgift 3 Fråga B: Beviljandegrad för distans och bundna utbildningar?

SELECT
	studieform,
	COUNT(*) AS antal_ansökningar,
	COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) AS beviljade,
	ROUND(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*), 2) AS beviljandegrad
FROM applications
GROUP BY studieform
ORDER BY beviljandegrad DESC;


PROMPT Uppgift 3 Fråga C: Vilka län har högst beviljandegrad inom Data/IT?

SELECT
	län,
	COUNT(*) AS antal_ansökningar,
	COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) AS beviljade,
	ROUND(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*), 2) AS beviljandegrad
FROM applications
WHERE utbildningsområde = 'Data/IT'
GROUP BY län
ORDER BY beviljandegrad DESC;


PROMPT Uppgift 3 Fråga D: Hur många skolor är privata respektive kommunala inom Data/IT?

SELECT
	huvudmannatyp,
	COUNT(DISTINCT UTBILDNINGSANORDNARE_ADMINISTR) AS antal_utbildningsanordnare
FROM applications
WHERE utbildningsområde = 'Data/IT'
GROUP BY huvudmannatyp;
EXIT
