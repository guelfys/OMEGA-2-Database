CREATE DATABASE_NAME
USE DATABASE_NAME

-- tabla parametros --

INSERT INTO dbo.parametros 
VALUES ('OrigenFollowme','','FollowMe')

INSERT INTO dbo.parametros
VALUES ('OrigenRealstate','','Realstate')

INSERT INTO dbo.parametros
VALUES ('OrigenOcr','','Ocr')

INSERT INTO dbo.parametros
VALUES ('OrigenMaf','','Maf')

INSERT INTO dbo.parametros
VALUES ('OrigenColiving','','Coliving')

INSERT INTO dbo.parametros
           ([codigo]
           ,[valor]
           ,[descripcion])
     VALUES
           ('selectsTarifas',
           '[{"id":1,"description":"T1"},{"id":2,"description":"T2"},{"id":3,"description":"T3"},{"id":4,"description":"T4"}]'
           ,'Listado de tarifas')
GO

INSERT INTO dbo.parametros
           ([codigo]
           ,[valor]
           ,[descripcion])
     VALUES
           ('selectsCuota',
           '[{"id":1,"description":"1"},{"id":2,"description":"2"},{"id":3,"description":"3"},{"id":4,"description":"4"},{"id":5,"description":"5"},{"id":6,"description":"6"},{"id":7,"description":"7"},{"id":8,"description":"8"},{"id":9,"description":"9"},{"id":10,"description":"10"},{"id":11,"description":"11"},{"id":12,"description":"12"},{"id":13,"description":"Anual"}]'
           ,'Listado de cuotas')
GO

INSERT INTO dbo.parametros
           ([codigo]
           ,[valor]
           ,[descripcion])
     VALUES
           ('selectsPercep',
           '[{"id":1,"description":"IVA 21%"},{"id":2,"description":"IVA 27%"}]'
           ,'Listado de percepciones')
GO

-- Tipo de servicio --

INSERT INTO dbo.tipo_de_servicio ([nombre],[codServicio]) VALUES ('No relacionado', NULL)
INSERT INTO dbo.tipo_de_servicio (codServicio, nombre) VALUES (14, 'Alquiler edificio');
INSERT INTO dbo.tipo_de_servicio (codServicio, nombre) VALUES (15, 'Alquiler cochera');
INSERT INTO dbo.tipo_de_servicio (codServicio, nombre) VALUES (5, 'Energia');
INSERT INTO dbo.tipo_de_servicio (codServicio, nombre) VALUES (1, 'Impuesto Municipal');
INSERT INTO dbo.tipo_de_servicio (codServicio, nombre) VALUES (2, 'Agua');
INSERT INTO dbo.tipo_de_servicio (codServicio, nombre) VALUES (6, 'Gas');
INSERT INTO dbo.tipo_de_servicio (codServicio, nombre) VALUES (11, 'Expensas');
INSERT INTO dbo.tipo_de_servicio (codServicio, nombre) VALUES (3, 'Impuesto Provincial');
INSERT INTO dbo.tipo_de_servicio (codServicio, nombre) VALUES (12, 'Publicidad');

-- Empresa --

INSERT INTO dbo.empresa ([tipoEmpresa],[codSAP],[codigo],[nomCod],[ceCoCentralizado],[activo]) VALUES (N'No relacionado', -1, NULL, NULL, NULL, 0)
INSERT INTO dbo.empresa (tipoEmpresa, codSap, codigo, nomCod, ceCoCentralizado, activo) VALUES ('TASA', '0083', 83, 'TASA', '83160003', 1);
INSERT INTO dbo.empresa (tipoEmpresa, codSap, codigo, nomCod, ceCoCentralizado, activo) VALUES ('TMA', '0370', 370, 'MVS', '370040000', 1);

-- Medio pago --

INSERT INTO dbo.medio_pago ([valor],[descripcion]) VALUES ('No relacionado', '')
INSERT INTO dbo.medio_pago (valor, descripcion) VALUES ('D - 12002', 'Débito Banco');
INSERT INTO dbo.medio_pago (valor, descripcion) VALUES ('O', 'Pago mis cuentas');
INSERT INTO dbo.medio_pago (valor, descripcion) VALUES ('T', 'Transferencia Especial');
INSERT INTO dbo.medio_pago (valor, descripcion) VALUES ('U', 'Transferencia 2');
INSERT INTO dbo.medio_pago (valor, descripcion) VALUES ('V', 'Transferencia');
INSERT INTO dbo.medio_pago (valor, descripcion) VALUES ('DZ1-11500', 'Tarjeta American Express');
INSERT INTO dbo.medio_pago (valor, descripcion) VALUES ('DZ1-12000', 'Tarjeta Visa');

-- Regla de negocio --

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

-- Regla Valor --

INSERT INTO dbo.valor_regla (atributo,valor,reglaDeNegocioId) VALUES
	 (N'valorTablaValores',N'tarifaServicio',1),
	 (N'valorTablaValores',N'const residencial = "T1R"',2),
	 (N'valorTablaValores',N'const valor = null',3),
	 (N'valorTablaValores',N'const consumoNoPermitido = 0',4),
	 (N'valorTablaValores',N'const tarifaPermitida = "T1"',5),
	 (N'valorTablaValores',N'const tarifaPermitida = "T1"',6);

-- Funcionalidad --

INSERT INTO dbo.funcionalidad (nombre, categoria, descripcion, ruta) VALUES
    ('Factura', NULL, NULL, '/factura'),
    ('Medio pago', NULL, NULL, '/mediopago'),
    ('Empresa', NULL, NULL, '/empresa'),
    ('Tipo de servicio', NULL, NULL, '/tipodeservicio'),
    ('Concepto', NULL, NULL, '/concepto'),
    ('Servicio', NULL, NULL, '/servicio'),
    ('Proveedor', NULL, NULL, '/proveedor'),
    ('Sitios', NULL, NULL, '/sitios'),
    ('Factura manual', NULL, NULL, '/facturamanual'),
    ('Facturas con incumplimientos', NULL, NULL, '/facturasconincumplimientos'),
    ('Regla de negocio', NULL, NULL, '/regladenegocio'),
    ('Selects', NULL, NULL, '/selects'),
    ('Gestión Inmobiliaria', NULL, NULL, '/gestioninmobiliaria'),
    ('Factura OCR', NULL, NULL, '/facturaocr'),
    ('Conciliación de pagos', NULL, NULL, '/conciliaciondepagos'),
    ('reportes', NULL, NULL, '/reportes'),
    ('Gestión de servicios', NULL, NULL, '/gestiondeservicios');

-- Sitio -- 

INSERT INTO dbo.sitio ([codSitio],[codEdificio]) VALUES
    ('No relacionado', 'No relacionado');
