
-- Reglas de negocio --

INSERT INTO dbo.regla_de_negocio (tipoRegla,idEntidad,nombre,descripcion,fechaAlta,fechaBaja,estado,controlFlag,obligatorioCumplimiento,servicio) VALUES
	 (N'if (tarifa != tarifaServicio) { reglasEncontradas.push(idReglasDeNegocio) }',1,N'Tarifa servicio',N'La tarifa de la factura no puede diferir de la tarifa de su servicio asociado','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'tarifa',0,NULL),
	 (N'if (tarifa != null){if (tarifa.startsWith(residencial)) { reglasEncontradas.push(idReglasDeNegocio)}}',1,N'Tarifa Residencial',N'Tarifa no puede ser residencial','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'tarifa',1,NULL),
	 (N'if (medidor == valor || cliente == valor) { reglasEncontradas.push(idReglasDeNegocio) }',1,N'Cliente-Medidor',N'La factura debe tener cliente y medidor','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'cliente',1,NULL),
	 (N'if (consumo != null && consumo == consumoNoPermitido){reglasEncontradas.push(idReglasDeNegocio)}',1,N'ConsumoNoPermitido',N'El consumo de la factura es incorrecto','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'consumo',1,NULL),
	 (N'if (potenciaRegistradaEnPunta != null && potenciaRegistradaEnPunta == 0 && !tarifa.startsWith(tarifaPermitida)){reglasEncontradas.push(idReglasDeNegocio)}',1,N'PotenciaRegistradaPuntaCero',N'la potencia registrada en punta es igual a cero, excepto en el caso de la tarifa T1','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'potRegEnPta',0,NULL),
	 (N'if (potenciaRegistradaFueraDePunta != null && potenciaRegistradaFueraDePunta == 0 && !tarifa.startsWith(tarifaPermitida)){reglasEncontradas.push(idReglasDeNegocio)}',1,N'PotenciaRegistradaFueraPuntaCero',N'la potencia registrada fuera de punta es igual a cero, excepto en el caso de la tarifa T1 ','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'potRegFueraPta',0,NULL),
	 (N'if (fechaDeFacturacionHasta != null && fechaDeFacturacionHasta > fechaActual){reglasEncontradas.push(idReglasDeNegocio)}',1,N'FechaFacturacionHastaMenorActual',N'La fecha de facturación hasta es mayor que la fecha actual','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'periodosDeFacturacionHasta',0,NULL),
	 (N' if (fechaDeFacturacionDesde != null && fechaDeFacturacionHasta != null && fechaDeFacturacionDesde > fechaDeFacturacionHasta){reglasEncontradas.push(idReglasDeNegocio)}',1,N'FechaHastaMayorDesde',N'La fecha de facturacion hasta es mayor a la fecha de facturacion desde','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'periodosDeFacturacionDesde',0,NULL),
	 (N'if(fechaDeEmision == null || new Date(fechaDeEmision) > fechaActual){reglasEncontradas.push(idReglasDeNegocio)}',1,N'FechaEmisionIncorrecta',N'La fecha de Emision supera a la fecha actual','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'fechaDeEmision',0,NULL),
	 (N'if(fechaDeVencimiento == null){reglasEncontradas.push(idReglasDeNegocio)}',1,N'FechaVencimientoVacia',N'La fecha de vencimiento se encuentra vacia','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'proximoVencimiento',0,N'nroComprobante');
INSERT INTO dbo.regla_de_negocio (tipoRegla,idEntidad,nombre,descripcion,fechaAlta,fechaBaja,estado,controlFlag,obligatorioCumplimiento,servicio) VALUES
	 (N'if(importe < 0){reglasEncontradas.push(idReglasDeNegocio)}',1,N'ImporteNegativo',N'El importe es negativo','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'totalAPagar',0,NULL);

-- Valores configurables de las reglas de negocio --

INSERT INTO dbo.valor_regla (atributo,valor,reglaDeNegocioId) VALUES
	 (N'valorTablaValores',N'tarifaServicio',1),
	 (N'valorTablaValores',N'const residencial = "T1R"',2),
	 (N'valorTablaValores',N'const valor = null',3),
	 (N'valorTablaValores',N'const consumoNoPermitido = 0',4),
	 (N'valorTablaValores',N'const tarifaPermitida = "T1"',5),
	 (N'valorTablaValores',N'const tarifaPermitida = "T1"',6);
	 
GO