
-- Reglas de negocio --

INSERT INTO regla_de_negocio (tipoRegla,idEntidad,nombre,servicio,descripcion,fechaAlta,fechaBaja,estado,controlFlag,serviciosPublicos,energia,obligatorioCumplimiento) VALUES
	 (N'if (tarifa != tarifaServicio) { reglasEncontradas.push(idReglasDeNegocio) }',1,N'TarifaServicio',NULL,N'La tarifa de la factura difiere de la tarifa de su servicio asociado','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'tarifa',NULL,NULL,0),
	 (N'if (tarifa != null){if (tarifa.startsWith(residencial)) { reglasEncontradas.push(idReglasDeNegocio)}}',1,N'TarifaResidencial',NULL,N'Tarifa es residencial','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'tarifa',NULL,NULL,1),
	 (N'if (cliente == valorCliente) { reglasEncontradas.push(idReglasDeNegocio) }',1,N'Cliente',NULL,N'La factura no tiene cliente','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'cliente',NULL,NULL,1),
	 (N'if (medidor == valorMedidor) { reglasEncontradas.push(idReglasDeNegocio) }',1,N'Medidor',NULL,N'La factura no tiene medidor','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'medidor',NULL,NULL,1),
	 (N'if (consumo != null && consumo == consumoNoPermitido){reglasEncontradas.push(idReglasDeNegocio)}',1,N'ConsumoNoPermitido',NULL,N'El consumo de la factura es incorrecto','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'consumo',NULL,NULL,1),
	 (N'if (potenciaRegistradaEnPunta != null && potenciaRegistradaEnPunta == 0 && !tarifa.startsWith(tarifaPermitida)){reglasEncontradas.push(idReglasDeNegocio)}',1,N'PotenciaRegistradaPuntaCero',NULL,N'la potencia registrada en punta es igual a cero, excepto en el caso de la tarifa T1','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'potRegEnPta',NULL,NULL,0),
	 (N'if (potenciaRegistradaFueraDePunta != null && potenciaRegistradaFueraDePunta == 0 && !tarifa.startsWith(tarifaPermitida)){reglasEncontradas.push(idReglasDeNegocio)}',1,N'PotenciaRegistradaFueraPuntaCero',NULL,N'la potencia registrada fuera de punta es igual a cero, excepto en el caso de la tarifa T1 ','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'potRegFueraPta',NULL,NULL,0),
	 (N'if (fechaDeFacturacionHasta != null && fechaDeFacturacionHasta > fechaActual){reglasEncontradas.push(idReglasDeNegocio)}',1,N'FechaFacturacionHastaMenorActual',NULL,N'La fecha de facturación hasta es mayor que la fecha actual','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'periodosDeFacturacionHasta',NULL,NULL,0),
	 (N'if (fechaDeFacturacionDesde != null && fechaDeFacturacionHasta != null && fechaDeFacturacionDesde > fechaDeFacturacionHasta){reglasEncontradas.push(idReglasDeNegocio)}',1,N'FechaHastaMayorDesde',NULL,N'La fecha de facturacion hasta es mayor a la fecha de facturacion desde','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'periodosDeFacturacionDesde',NULL,NULL,0),
	 (N'if (fechaFacturacionDesdeMes != null && fechaFacturacionDesdeMes < fechaDesdeMes){reglasEncontradas.push(idReglasDeNegocio)}',1,N'CoherenciaFechaDesdeMes',NULL,N'El mes de la fecha de facturacion desde no esta dentro del rango definido','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'periodosDeFacturacionDesde',NULL,NULL,0),
	 (N'if (fechaFacturacionHastaMes != null && fechaFacturacionHastaMes < fechaHastaMes){reglasEncontradas.push(idReglasDeNegocio)}',1,N'CoherenciaFechaHastaMes',NULL,N'El mes de la fecha de facturacion hasta no esta dentro del rango definido','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'periodosDeFacturacionHasta',NULL,NULL,0),
	 (N'if (fechaFacturacionDesdeAnio != null && fechaFacturacionDesdeAnio < fechaDesdeAnio){reglasEncontradas.push(idReglasDeNegocio)}',1,N'CoherenciaFechaDesdeAnio',NULL,N'El año de la fecha de facturacion desde no esta dentro del rango definido','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'periodosDeFacturacionDesde',NULL,NULL,0),
	 (N'if (fechaFacturacionHastaAnio != null && fechaFacturacionHastaAnio < fechaHastaAnio){reglasEncontradas.push(idReglasDeNegocio)}',1,N'CoherenciaFechaHastaAnio',NULL,N'El año de la fecha de facturacion hasta no esta dentro del rango definido','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'periodosDeFacturacionHasta',NULL,NULL,0),
	 (N'if (consumo >= consumoMesAnterior * (1 - ((variacionConsumo !== null ? variacionConsumo : 0) / 100)) && consumo <= consumoMesAnterior * (1 + ((variacionConsumo !== null ? variacionConsumo : 0) / 100))){reglasEncontradas.push(idReglasDeNegocio)}',1,N'VariacionEnConsumo',N'variacionConsumo',N'El consumo con respecto a la factura anterior no esta dentro del rango definido','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'consumo',NULL,NULL,0),
	 (N'if(fechaDeEmision == null || new Date(fechaDeEmision) > fechaActual){reglasEncontradas.push(idReglasDeNegocio)}',1,N'FechaEmisionIncorrecta',NULL,N'La fecha de Emision supera a la fecha actual','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'fechaDeEmision',NULL,NULL,0),
	 (N'if(nroComprobante == nroComprobanteExistente){reglasEncontradas.push(idReglasDeNegocio)}',1,N'NroComprobanteDuplicado',N'nroComprobante',N'El numero de comprobante ya existe','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'liquidacionDeServiciosPublicos',NULL,NULL,0),
	 (N'if(fechaDeVencimiento == null){reglasEncontradas.push(idReglasDeNegocio)}',1,N'FechaVencimientoVacia',N'nroComprobante',N'La fecha de vencimiento se encuentra vacia','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'proximoVencimiento',NULL,NULL,0),
	 (N'if(importe < 0){reglasEncontradas.push(idReglasDeNegocio)}',1,N'ImporteNegativo',NULL,N'El importe es negativo','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'totalAPagar',NULL,NULL,0),
	 (N'if(fechaDeRecurso == valorFechaRecurso){reglasEncontradas.push(idReglasDeNegocio)}',1,N'FechaDeRecursoVacia',NULL,N'La fecha de recurso esta vacia','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'fechaDeRecurso',NULL,NULL,0),
	 (N'if(tarifa != null && tarifa.toLowerCase().includes(valorTarifa) && potenciaRegistradaEnPunta == null){reglasEncontradas.push(idReglasDeNegocio)}',1,N'PotenciaRegistradaEnPuntaVaciaT3',NULL,N'La potencia registrada en punta esta vacia en la tarifa T3','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'potRegEnPta',NULL,NULL,0),
	 (N'if(tarifa != null && tarifa.toLowerCase().includes(valorTarifa) && potenciaRegistradaFueraDePunta == null){reglasEncontradas.push(idReglasDeNegocio)}',1,N'PotenciaRegistradaFueraPuntaVaciaT3',NULL,N'La potencia registrada fuera de punta esta vacia en la tarifa T3','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'potRegFueraPta',NULL,NULL,0),
	 (N'if(comprobanteDuplicado =! null){reglasEncontradas.push(idReglasDeNegocio)}',1,N'ComprobanteDuplicado',N'comprobanteDuplicado',N'El comprobante esta duplicado','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'liquidacionDeServiciosPublicos',NULL,NULL,0),
	 (N'if(servicioDeLaFactura == null){reglasEncontradas.push(idReglasDeNegocio)}',1,N'FacturaSinServicio',N'',N'La factura no tiene un servicio asociado','2023-12-01 00:00:00.0','2023-12-01 00:00:00.0',0,N'',NULL,NULL,0);

go
-- Valores configurables de las reglas de negocio --

INSERT INTO valor_regla (atributo,valor,reglaDeNegocioId) VALUES
	 (N'valorTablaValores',N'tarifaServicio',(SELECT id FROM regla_de_negocio WHERE nombre = 'TarifaServicio')),
	 (N'valorTablaValores',N'const residencial = "T1R"',(SELECT id FROM regla_de_negocio WHERE nombre = 'TarifaResidencial')),
	 (N'valorTablaValores',N'const valorCliente = null',(SELECT id FROM regla_de_negocio WHERE nombre = 'Cliente')),
	 (N'valorTablaValores',N'const valorMedidor = null',(SELECT id FROM regla_de_negocio WHERE nombre = 'Medidor')),
	 (N'valorTablaValores',N'const consumoNoPermitido = 0',(SELECT id FROM regla_de_negocio WHERE nombre = 'ConsumoNoPermitido')),
	 (N'valorTablaValores',N'const tarifaPermitida = "T1"',(SELECT id FROM regla_de_negocio WHERE nombre = 'PotenciaRegistradaPuntaCero')),
	 (N'valorTablaValores',N'const tarifaPermitida = "T1"',(SELECT id FROM regla_de_negocio WHERE nombre = 'PotenciaRegistradaFueraPuntaCero')),
	 (N'valorTablaValores',N'const fechaDesdeMes = 12',(SELECT id FROM regla_de_negocio WHERE nombre = 'FechaFacturacionHastaMenorActual')),
	 (N'valorTablaValores',N'const fechaHastaMes = 12',(SELECT id FROM regla_de_negocio WHERE nombre = 'FechaHastaMayorDesde')),
	 (N'valorTablaValores',N'const fechaDesdeAnio = 2021',(SELECT id FROM regla_de_negocio WHERE nombre = 'CoherenciaFechaDesdeMes')),
	 (N'valorTablaValores',N'const anioFacturacionHasta = 2021',(SELECT id FROM regla_de_negocio WHERE nombre = 'CoherenciaFechaHastaMes')),
	 (N'valorTablaValores',N'const valorFechaRecurso = null',(SELECT id FROM regla_de_negocio WHERE nombre = 'FechaDeRecursoVacia')),
	 (N'valorTablaValores',N'const valorTarifa = "t3"',(SELECT id FROM regla_de_negocio WHERE nombre = 'PotenciaRegistradaEnPuntaVaciaT3')),
	 (N'valorTablaValores',N'const valorTarifa = "t3"',(SELECT id FROM regla_de_negocio WHERE nombre = 'PotenciaRegistradaFueraPuntaVaciaT3'));

