CREATE VIEW basura AS SELECT factura.id,factura.importe,factura.fecha,
alumno.id AS alumno_id, alumno.nombre
FROM factura, alumno
WHERE alumno_id = factura.alumno_id