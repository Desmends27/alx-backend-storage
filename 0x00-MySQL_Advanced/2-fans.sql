-- rank orgins of bands, ordered by number
SELECT origin, COUNT(fans) as nb_fans
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC;
