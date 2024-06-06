INSERT INTO omega.grupo
(codigo, nombre)
VALUES
('OMEGA_SERVICIOS', 'Los usuarios que tengan asociado este perfil podrán acceder sólo a las opciones de los menúes de OMEGA que correspondan a la gestión, extremo a extremo, de las facturas de servicios públicos.'),
('OMEGA_ENERGIA', 'Este perfil deberá ser asignado a los usuarios del área de Energía y Climatización. En consecuencia, sólo podrán acceder a las opciones de los menúes de OMEGA vinculadas con el control y monitoreo del consumo de energía eléctrica.'),
('OMEGA_INMOBILIARIA', 'Gestionan servicios que no llegan a través del Loader para los edificios de RealState.'),
('OMEGA_CONSULTA', 'Este perfil tendrá habilitadas exclusivamente las opciones de consultas de información, no pudiendo ingresar datos ni hacer modificaciones de ningún tipo.'),
('OMEGA_SOPORTE', 'Este perfil sólo estará disponible para los usuarios que operen y den soporte a la aplicación, y tendrá acceso a la totalidad de las opciones de OMEGA.');
GO