-- List all bands with Glam rock
-- Ranked by logevity
SELECT band_name,
(split - formed) AS lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC;
