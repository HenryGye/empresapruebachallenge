CREATE DATABASE IF NOT EXISTS EmpresaPruebaChallenge;
USE EmpresaPruebaChallenge;
UNLOCK TABLES;
--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(15) DEFAULT NULL COMMENT 'codigo original de la tbl tablas proviene de la migracion de data',
  `nombreCargo` varchar(255) NOT NULL COMMENT 'Nombre del Cargo de la Compañia',
  `tipoCargo` enum('M','U') NOT NULL DEFAULT 'M' COMMENT 'Tipo de Cargo de la Compania. M=Multiple, U=Unico',
  `descripcionCargo` varchar(255) NOT NULL COMMENT 'Define la descripcion del cargo',
  `estadoCargo` enum('A','I','D') NOT NULL DEFAULT 'A' COMMENT 'Nombre del Cargo de la Compañia',
  `usuarioCargo` int(11) NOT NULL COMMENT 'Identifica que usuario modifico el cargo',
  `fechaUsuarioCargo` datetime NOT NULL COMMENT 'Identifica la fecha de modificacion del cargo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES (1,'00001','Empleado General','M','','A',1417,'2020-07-08 21:05:12'),(2,NULL,'Asistente de Gerencia','U','Asistente de Gerencia','A',2289,'2024-03-21 17:01:19'),(3,NULL,'Asistente de RRHH','U','Asistente de RRHH','A',2289,'2024-03-21 17:01:40');
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liquidacion`
--

DROP TABLE IF EXISTS `liquidacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liquidacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fechaLiquidacion` date NOT NULL COMMENT 'la ultima fecha del mes que se liquida',
  `persona_codigo` varchar(20) NOT NULL,
  `concepto` varchar(5) NOT NULL COMMENT ' en tablas ',
  `valor` decimal(16,4) NOT NULL,
  `valorOriginal` decimal(16,4) DEFAULT NULL COMMENT 'Valor generado por nominaz',
  `cantidad` decimal(16,4) NOT NULL COMMENT 'días/horas segun concepto',
  `unidad` varchar(1) NOT NULL COMMENT 'D=dia y H=hora, V=valor',
  `periodo` varchar(1) NOT NULL COMMENT '0=mensual, 1 quicenal',
  `clase` varchar(1) NOT NULL COMMENT 'I=ingreso, D=descuento, P=prestaciones, E=Especiales',
  `tipo` varchar(3) NOT NULL COMMENT 'deberia ser de 1, pero por como esta la programacion lo dejamos en 3, revisar en programacion',
  `prestamo_id` int(20) DEFAULT NULL COMMENT 'Id del prestamo liquidado',
  `gravadoIESS` varchar(1) NOT NULL COMMENT 'S/N',
  `estado` varchar(1) NOT NULL COMMENT 'P=Preliquidado, L=Liquidado, H=generado o modificado de haberes',
  `estadoPago` varchar(1) NOT NULL COMMENT 'describe el origen del valor R=liquidacion rol, \n        U=utilidades, C=desimocuarto, T=decimoTercero, H=haberes, S=saldos, B=Subsidio',
  `origenProceso` varchar(1) DEFAULT NULL COMMENT 'S=aviso salida rol',
  `relacion` varchar(30) DEFAULT NULL COMMENT 'tabla con la que se relaciona este registro',
  `relacion_id` int(11) DEFAULT NULL COMMENT 'id de la tabla con la que se relaciona este registro',
  `error` varchar(1) DEFAULT NULL COMMENT 'E=numeros negativos',
  `grupo` varchar(5) NOT NULL COMMENT 'grupo de liquidacion',
  `anticipo` enum('ANTICIPO') DEFAULT NULL COMMENT 'Determina si el concepto viene de un anticipo',
  `numeroDeCuotasApagar` int(3) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL COMMENT 'usuario desde la base nominaz',
  `fechaUsuario` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'fecha de ultima actualizacion del registro',
  PRIMARY KEY (`id`),
  KEY `fechaLiquidacion` (`fechaLiquidacion`,`persona_codigo`),
  KEY `fechaLiquidacion_2` (`fechaLiquidacion`,`persona_codigo`,`estado`),
  KEY `fechaLiquidacion_3` (`fechaLiquidacion`,`persona_codigo`,`concepto`),
  KEY `fechaLiquidacion_4` (`fechaLiquidacion`,`estado`)
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquidacion`
--

LOCK TABLES `liquidacion` WRITE;
/*!40000 ALTER TABLE `liquidacion` DISABLE KEYS */;
INSERT INTO `liquidacion` VALUES (124,'2024-01-31','HN00000001','00001',2800.0000,NULL,30.0000,'D','0','I','F',NULL,'S','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(125,'2024-01-31','HN00000001','00022',264.6000,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(126,'2024-01-31','HN00000001','00010',312.2000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(127,'2024-01-31','HN00000001','00011',116.6667,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(128,'2024-01-31','HN00000001','00060',15.5556,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(129,'2024-01-31','HN00000001','00070',28.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(130,'2024-01-31','HN00000001','00023',0.0000,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(131,'2024-01-31','HN00000004','00001',1800.0000,NULL,30.0000,'D','0','I','F',NULL,'S','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(132,'2024-01-31','HN00000004','00022',170.1000,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(133,'2024-01-31','HN00000004','00010',200.7000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(134,'2024-01-31','HN00000004','00011',75.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(135,'2024-01-31','HN00000004','00060',5.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(136,'2024-01-31','HN00000004','00070',18.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(137,'2024-01-31','HN00000004','00023',0.0000,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(138,'2024-01-31','HN00000005','00001',8800.0000,NULL,30.0000,'D','0','I','F',NULL,'S','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(139,'2024-01-31','HN00000005','00022',831.6000,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(140,'2024-01-31','HN00000005','00010',981.2000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(141,'2024-01-31','HN00000005','00011',366.6667,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(142,'2024-01-31','HN00000005','00070',88.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(143,'2024-01-31','HN00000005','00023',0.0000,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(144,'2024-01-31','HN00000003','00001',5800.0000,NULL,30.0000,'D','0','I','F',NULL,'S','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(145,'2024-01-31','HN00000003','00022',548.1000,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(146,'2024-01-31','HN00000003','00010',646.7000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(147,'2024-01-31','HN00000003','00011',241.6667,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(148,'2024-01-31','HN00000003','00070',58.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(149,'2024-01-31','HN00000003','00023',0.0000,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(150,'2024-01-31','HN00000002','00001',3000.0000,NULL,30.0000,'D','0','I','F',NULL,'S','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(151,'2024-01-31','HN00000002','00022',283.5000,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(152,'2024-01-31','HN00000002','00010',334.5000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(153,'2024-01-31','HN00000002','00011',125.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(154,'2024-01-31','HN00000002','00060',8.3333,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(155,'2024-01-31','HN00000002','00070',30.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(156,'2024-01-31','HN00000002','00023',0.0000,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:00:43'),(190,'2024-02-29','HN00000001','00001',2800.0000,NULL,30.0000,'D','0','I','F',NULL,'S','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(191,'2024-02-29','HN00000001','00022',264.6000,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(192,'2024-02-29','HN00000001','00010',312.2000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(193,'2024-02-29','HN00000001','00011',116.6667,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(194,'2024-02-29','HN00000001','00060',15.5556,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(195,'2024-02-29','HN00000001','00070',28.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(196,'2024-02-29','HN00000001','00023',185.0973,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(197,'2024-02-29','HN00000004','00001',1800.0000,NULL,30.0000,'D','0','I','F',NULL,'S','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(198,'2024-02-29','HN00000004','00022',170.1000,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(199,'2024-02-29','HN00000004','00010',200.7000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(200,'2024-02-29','HN00000004','00011',75.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(201,'2024-02-29','HN00000004','00060',5.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(202,'2024-02-29','HN00000004','00070',18.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(203,'2024-02-29','HN00000004','00023',0.0000,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(204,'2024-02-29','HN00000005','00001',8800.0000,NULL,30.0000,'D','0','I','F',NULL,'S','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(205,'2024-02-29','HN00000005','00022',831.6000,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(206,'2024-02-29','HN00000005','00010',981.2000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(207,'2024-02-29','HN00000005','00011',366.6667,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(208,'2024-02-29','HN00000005','00070',88.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(209,'2024-02-29','HN00000005','00023',1221.8436,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(210,'2024-02-29','HN00000003','00001',5800.0000,NULL,30.0000,'D','0','I','F',NULL,'S','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(211,'2024-02-29','HN00000003','00022',548.1000,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(212,'2024-02-29','HN00000003','00010',646.7000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(213,'2024-02-29','HN00000003','00011',241.6667,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(214,'2024-02-29','HN00000003','00070',58.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(215,'2024-02-29','HN00000003','00023',852.1673,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(216,'2024-02-29','HN00000002','00001',1500.0000,NULL,30.0000,'D','0','I','F',NULL,'S','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(217,'2024-02-29','HN00000002','00022',141.7500,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(218,'2024-02-29','HN00000002','00010',167.2500,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(219,'2024-02-29','HN00000002','00011',62.5000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(220,'2024-02-29','HN00000002','00060',7.0833,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(221,'2024-02-29','HN00000002','00070',15.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(222,'2024-02-29','HN00000002','00023',37.5295,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:09'),(289,'2024-03-31','HN00000001','00001',1200.0000,NULL,30.0000,'D','0','I','F',NULL,'S','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(290,'2024-03-31','HN00000001','00022',113.4000,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(291,'2024-03-31','HN00000001','00010',133.8000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(292,'2024-03-31','HN00000001','00011',50.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(293,'2024-03-31','HN00000001','00060',6.6667,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(294,'2024-03-31','HN00000001','00070',12.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(295,'2024-03-31','HN00000001','00023',5.5683,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(296,'2024-03-31','HN00000004','00001',1800.0000,NULL,30.0000,'D','0','I','F',NULL,'S','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(297,'2024-03-31','HN00000004','00022',170.1000,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(298,'2024-03-31','HN00000004','00010',200.7000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(299,'2024-03-31','HN00000004','00011',75.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(300,'2024-03-31','HN00000004','00060',5.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(301,'2024-03-31','HN00000004','00070',18.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(302,'2024-03-31','HN00000004','00023',0.0000,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(303,'2024-03-31','HN00000005','00001',8800.0000,NULL,30.0000,'D','0','I','F',NULL,'S','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(304,'2024-03-31','HN00000005','00022',831.6000,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(305,'2024-03-31','HN00000005','00010',981.2000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(306,'2024-03-31','HN00000005','00011',366.6667,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(307,'2024-03-31','HN00000005','00070',88.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(308,'2024-03-31','HN00000005','00023',1221.8436,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(309,'2024-03-31','HN00000003','00001',5800.0000,NULL,30.0000,'D','0','I','F',NULL,'S','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(310,'2024-03-31','HN00000003','00022',548.1000,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(311,'2024-03-31','HN00000003','00010',646.7000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(312,'2024-03-31','HN00000003','00011',241.6667,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(313,'2024-03-31','HN00000003','00070',58.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(314,'2024-03-31','HN00000003','00023',852.1673,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(315,'2024-03-31','HN00000002','00001',1500.0000,NULL,30.0000,'D','0','I','F',NULL,'S','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(316,'2024-03-31','HN00000002','00022',141.7500,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(317,'2024-03-31','HN00000002','00010',167.2500,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(318,'2024-03-31','HN00000002','00011',62.5000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(319,'2024-03-31','HN00000002','00060',8.3333,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(320,'2024-03-31','HN00000002','00070',15.0000,NULL,30.0000,'D','0','P','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57'),(321,'2024-03-31','HN00000002','00023',37.5296,NULL,30.0000,'D','0','D','F',NULL,'N','L','R',NULL,NULL,NULL,NULL,'00001',NULL,NULL,2289,'2024-03-21 17:03:57');
/*!40000 ALTER TABLE `liquidacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liquidacionHistorico`
--

DROP TABLE IF EXISTS `liquidacionHistorico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liquidacionHistorico` (
  `persona_codigo` varchar(20) NOT NULL,
  `fechaLiquidacion` date NOT NULL COMMENT 'fecha de liquidacion del rol',
  `categoria` varchar(1) DEFAULT NULL COMMENT '1=empleado, 2=accionista, 3=representante legal',
  `cargo` varchar(5) DEFAULT NULL COMMENT 'tablas=00005',
  `sueldo` decimal(16,2) DEFAULT NULL,
  `grupoLiquidacion` varchar(5) DEFAULT NULL COMMENT 'tablas=00003',
  `codigoSectorial` varchar(15) DEFAULT NULL,
  `neto` varchar(1) DEFAULT NULL COMMENT 'S/N, si recibe el valor del sueldo NETO',
  `jornada` varchar(1) DEFAULT NULL COMMENT '1=completo, 2=parcial',
  `horas` smallint(6) DEFAULT '0' COMMENT 'numero de horas que labora el empleado',
  `region` enum('COSTA','SIERRA','ORIENTE','GALÁPAGOS') DEFAULT NULL COMMENT 'región de residencia para segmentar decimocuarto mensual',
  `nivelUno` varchar(5) DEFAULT '00001' COMMENT 'tablas=00010',
  `nivelDos` varchar(5) DEFAULT NULL COMMENT 'tablas=00010',
  `nivelTres` varchar(5) DEFAULT NULL COMMENT 'tablas=00010',
  `nivelCuatro` varchar(5) DEFAULT NULL COMMENT 'tablas=00010',
  `contrato` varchar(2) DEFAULT NULL COMMENT 'Tipos de contrato nominaz.vwTipoContrato',
  `tipo` varchar(1) NOT NULL DEFAULT '' COMMENT 'describe el tipo de proceso R=rol, H=haberes, U=utilidades, T=decimotercero, C=decimocuarto, D=salario digno',
  `estado` varchar(1) DEFAULT 'L' COMMENT 'L= Liquidado P=Preliquidado',
  `banco_codigo` varchar(5) DEFAULT NULL COMMENT 'Código del banco de origen',
  `formaPago` varchar(1) DEFAULT NULL COMMENT '1=cheque, 2=transferencia, 3=efectivo',
  `cuentaBancaria` varchar(20) DEFAULT NULL COMMENT 'cuenta bancaria del empleado',
  `estadoEmpleado` enum('A','R') DEFAULT 'A',
  `fechaUsuario` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`persona_codigo`,`fechaLiquidacion`,`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquidacionHistorico`
--

LOCK TABLES `liquidacionHistorico` WRITE;
/*!40000 ALTER TABLE `liquidacionHistorico` DISABLE KEYS */;
INSERT INTO `liquidacionHistorico` VALUES ('HN00000001','2024-01-31','1','1',2800.00,'00001','1210000000006','N','1',240,'SIERRA','00001',NULL,NULL,NULL,'1','R','L','00163','2','4888866100','A','2024-03-21 17:00:43'),('HN00000001','2024-02-29','1','2',2800.00,'00001','1210000000006','N','1',240,'SIERRA','00001',NULL,NULL,NULL,'1','R','L','00163','2','4888866100','A','2024-03-21 17:03:09'),('HN00000001','2024-03-31','1','3',1200.00,'00001','1210000000006','N','1',240,'SIERRA','00001',NULL,NULL,NULL,'1','R','L','00163','2','4888866100','A','2024-03-21 17:03:57'),('HN00000002','2024-01-31','1','1',3000.00,'00001','1210000000006','N','1',240,'SIERRA','00001',NULL,NULL,NULL,'1','R','L','00163','2','4888866999','A','2024-03-21 17:00:43'),('HN00000002','2024-02-29','1','1',1500.00,'00001','1210000000006','N','1',240,'SIERRA','00001',NULL,NULL,NULL,'1','R','L','00163','2','4888866999','A','2024-03-21 17:03:09'),('HN00000002','2024-03-31','1','1',1500.00,'00001','1210000000006','N','1',240,'SIERRA','00001',NULL,NULL,NULL,'1','R','L','00163','2','4888866999','A','2024-03-21 17:03:57'),('HN00000003','2024-01-31','1','1',5800.00,'00001','1210000000006','N','1',240,'SIERRA','00001',NULL,NULL,NULL,'1','R','L','00163','2','4985666100','A','2024-03-21 17:00:43'),('HN00000003','2024-02-29','1','3',5800.00,'00001','1210000000006','N','1',240,'SIERRA','00001',NULL,NULL,NULL,'1','R','L','00163','2','4985666100','A','2024-03-21 17:03:09'),('HN00000003','2024-03-31','1','3',5800.00,'00001','1210000000006','N','1',240,'SIERRA','00001',NULL,NULL,NULL,'1','R','L','00163','2','4985666100','A','2024-03-21 17:03:57'),('HN00000004','2024-01-31','1','1',1800.00,'00001','1210000000006','N','1',240,'COSTA','00001',NULL,NULL,NULL,'1','R','L','00164','2','4985666177','A','2024-03-21 17:00:43'),('HN00000004','2024-02-29','1','2',1800.00,'00001','1210000000006','N','1',240,'COSTA','00001',NULL,NULL,NULL,'1','R','L','00164','2','4985666177','A','2024-03-21 17:03:09'),('HN00000004','2024-03-31','1','2',1800.00,'00001','1210000000006','N','1',240,'COSTA','00001',NULL,NULL,NULL,'1','R','L','00164','2','4985666177','A','2024-03-21 17:03:57'),('HN00000005','2024-01-31','1','1',8800.00,'00001','1210000000006','N','1',240,'COSTA','00001',NULL,NULL,NULL,'1','R','L','00154','2','4984321100','A','2024-03-21 17:00:43'),('HN00000005','2024-02-29','1','1',8800.00,'00001','1210000000006','N','1',240,'COSTA','00001',NULL,NULL,NULL,'1','R','L','00154','2','4984321100','A','2024-03-21 17:03:09'),('HN00000005','2024-03-31','1','1',8800.00,'00001','1210000000006','N','1',240,'COSTA','00001',NULL,NULL,NULL,'1','R','L','00154','2','4984321100','A','2024-03-21 17:03:57');
/*!40000 ALTER TABLE `liquidacionHistorico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `codigo` varchar(20) NOT NULL COMMENT 'el codigo de la empresa o el documento',
  `documento` varchar(20) NOT NULL COMMENT 'la cedula o el pasaporte',
  `codigoIess` varchar(20) DEFAULT NULL COMMENT 'Código IESS para extranjeros',
  `tipoDocumento` varchar(1) NOT NULL COMMENT 'C/P Cedula/Pasaporte',
  `tipoPersona` varchar(1) NOT NULL COMMENT 'E/P/C Empleado/Pasante/C)Personal de servicios complementario, el ultimo tipo de empleado de la ',
  `primerNombre` varchar(100) NOT NULL,
  `segundoNombre` varchar(100) DEFAULT NULL,
  `primerApellido` varchar(100) NOT NULL,
  `segundoApellido` varchar(100) DEFAULT NULL,
  `genero` varchar(1) DEFAULT NULL COMMENT 'M/F Masculino/Femenino',
  `paisNacimiento` varchar(5) DEFAULT NULL COMMENT 'maetab=00004',
  `provinciaResidencia` varchar(5) DEFAULT NULL COMMENT 'maetab=00005',
  `ciudadResidencia` varchar(5) DEFAULT NULL COMMENT 'maetab=00006',
  `direccion` varchar(255) DEFAULT NULL,
  `telefonos` varchar(21) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `estadoCivil` varchar(1) DEFAULT NULL COMMENT '1=soltero, 2=casado, 3=viudo, 4=divorciado, 5=union de hecho',
  `nombrePareja` varchar(255) DEFAULT NULL,
  `hijos` varchar(1) DEFAULT NULL COMMENT 'S/N',
  `numeroHijos` int(2) DEFAULT NULL COMMENT 'este campo se llena con el excel DATOS PERSONALES, es para generar el listado de hijos para el excel DATOS HIJOS, para nada mas',
  `dependientes` enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'S/N',
  `asistencia` varchar(1) DEFAULT NULL COMMENT 'S/N, para saber si se registra la asistencia del empleado',
  `fechaIngreso` date NOT NULL,
  `jefe` varchar(20) DEFAULT NULL COMMENT 'recursivo a la misma tabla',
  `categoria` varchar(1) DEFAULT NULL COMMENT '1=empleado, 3=representante legal',
  `turno_id` int(11) DEFAULT NULL,
  `turno` varchar(5) DEFAULT NULL COMMENT 'tablas=00007',
  `cargo` int(11) DEFAULT NULL,
  `estudios` varchar(1) DEFAULT NULL COMMENT '1=sin estudio, 2=básica, 3=secundaria, 4=bachiller, \n      5=tercer nivel, 6=cuarto nivel, 7=egresado',
  `sueldo` decimal(16,2) DEFAULT NULL,
  `grupoLiquidacion` varchar(5) DEFAULT NULL COMMENT 'tablas=00003',
  `fondosReserva` varchar(1) DEFAULT NULL COMMENT 'S/N, S=acumula, se le paga al IESS, N=no acumula, se le entrega al empleado',
  `fondosReservaIngreso` varchar(1) DEFAULT NULL COMMENT 'S/N, S=se generan fondos de reserva desde el ingreso, N=se generan fondos de reserva desde el mes 13',
  `recibioFondoReservaPrevio` varchar(1) DEFAULT NULL COMMENT 'S/N si en la historial laboral, previamente ya se la ha pagado fondo de reserva',
  `decimoTercero` varchar(1) DEFAULT NULL COMMENT 'S/N S=acumula, N=mensualiza(no acumula)',
  `decimoCuarto` varchar(1) DEFAULT NULL COMMENT 'S/N S=acumula, N=mensualiza(no acumula)',
  `contrato` varchar(2) DEFAULT NULL COMMENT 'Tipos de contrato nominaz.vwTipoContrato',
  `formaPago` varchar(1) DEFAULT NULL COMMENT '1=cheque, 2=transferencia, 3=efectivo',
  `tipoCuentaBancaria` varchar(1) DEFAULT NULL COMMENT 'tipo de cuenta, C=corriente, A=ahorros, V=virtuales',
  `cuentaBancaria` varchar(20) DEFAULT NULL COMMENT 'cuenta bancaria del empleado',
  `banco_codigo` varchar(5) DEFAULT NULL COMMENT 'maetab=00010',
  `banco_codigo_origen` varchar(5) DEFAULT NULL COMMENT 'Código del banco de origen',
  `residencia` varchar(255) DEFAULT NULL COMMENT 'Direccion del empleado',
  `paisResidencia` varchar(5) DEFAULT NULL COMMENT 'maetab=00004',
  `dobleImposicion` varchar(1) DEFAULT 'X' COMMENT 'S) Si tiene, N) No tiene, X) No asignado',
  `condicion` varchar(2) DEFAULT '01' COMMENT '01=no aplica, 02=trabajo con discapacidad, 03=sustituto, 04=conyuge, conviviente o hijos con discapacidad',
  `porcentajeDiscapacidad` smallint(6) DEFAULT '0' COMMENT 'porcentaje de discapacidad',
  `identificacionDiscapacidad` varchar(20) DEFAULT NULL COMMENT 'Numero de cedula de persona con discapacidad que sustituye',
  `sangre` varchar(3) DEFAULT 'N/A' COMMENT 'tipo de sangre ejemplo: AB+,O+, etc',
  `codigoSectorial` varchar(15) DEFAULT NULL,
  `neto` varchar(1) DEFAULT NULL COMMENT 'S/N, si recibe el valor del sueldo NETO, para el calculo de la nonima',
  `informacionAdicional` text COMMENT 'Informacion adicional del empleado en los datos laborales',
  `estado` varchar(1) DEFAULT NULL COMMENT 'estado del empleado, A)activo/R)retirado',
  `fechaSalida` date DEFAULT NULL COMMENT 'fecha ultima salida igual al historia laboral',
  `galapagos` varchar(1) DEFAULT NULL COMMENT 'S/N si pertenece o no a galapagos',
  `establecimiento` varchar(3) DEFAULT NULL COMMENT ' codigo del establecimiento del sri',
  `documentoDiscapacidad` varchar(1) DEFAULT NULL COMMENT 'N) no tiene, C) Cedula, P) Pasaporte',
  `anticipoQuincenal` varchar(1) DEFAULT 'N' COMMENT 'S/N S=si recibe, N=no recibe',
  `valorAntipoQuincenal` decimal(16,2) DEFAULT NULL COMMENT 'el valor, en porcentaje o valor',
  `tipoAntipoQuincenal` varchar(1) DEFAULT 'P' COMMENT 'P/V, P=Porcentaje, V=Valor',
  `jornada` varchar(1) DEFAULT '1' COMMENT '1=completo, 2=parcial',
  `horas` smallint(6) DEFAULT '0' COMMENT 'numero de horas que labora el empleado',
  `seguroMedico` varchar(1) DEFAULT 'N' COMMENT 'S/N',
  `seguroConyuge` varchar(1) DEFAULT 'N' COMMENT 'S/N',
  `tiempoVacacionesAdicionales` tinyint(2) NOT NULL DEFAULT '5' COMMENT 'Campo utilizado para saber despues de cuantos ańos debe provisioner el sistema',
  `calculoVacaciones` varchar(1) DEFAULT 'N' COMMENT 'S/N S=si aplica, N=no aplica',
  `nivelUno` varchar(5) DEFAULT '00001' COMMENT 'tablas=00010',
  `nivelDos` varchar(5) DEFAULT NULL COMMENT 'tablas=00010',
  `nivelTres` varchar(5) DEFAULT NULL COMMENT 'tablas=00010',
  `nivelCuatro` varchar(5) DEFAULT NULL COMMENT 'tablas=00010',
  `usuario` int(11) DEFAULT NULL COMMENT 'usuario desde la base nominaz',
  `fechaUsuario` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'fecha de ultima actualizacion del registro',
  `empresaTrabajo` varchar(255) DEFAULT NULL COMMENT 'empresa donde trabajar el personal complementario',
  `empresaTrabajoRUC` varchar(20) DEFAULT NULL COMMENT 'RUC de la empresa donde trabajar el personal complementario',
  `pasanteCarrera` varchar(100) DEFAULT NULL COMMENT 'Nombre de la carrera del pasante',
  `pasanteUniversidad` varchar(100) DEFAULT NULL COMMENT 'Nombre de la universidad',
  `pasanteAreaTrabajo` varchar(100) DEFAULT NULL COMMENT 'Nombre del area en la que trabaja el pasante',
  `usuarioActivo` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Determina si el usuario existe en dynamo',
  `enfermedadCatastrofica` varchar(5) DEFAULT NULL COMMENT 'codigo de enfermedad catastrofica',
  `confidencial` enum('GENERAL','CONFIDENCIAL') DEFAULT 'GENERAL' COMMENT 'GENERAL, CONFIDENCIAL',
  PRIMARY KEY (`primerApellido`,`codigo`),
  UNIQUE KEY `un_persona_documento` (`documento`),
  UNIQUE KEY `un_codigo` (`codigo`),
  UNIQUE KEY `un_persona_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='en caso de requerir mas campos, se debe agregar campos como infor1, infor2, infor3, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES ('HN00000001','HN00000001',NULL,'P','E','JUAN','CARLOS','GARCIA','REINOSO','M','00063','00019','00188','PEDRO PINTO GUZMAN CONJUNTO B','022222222','0961103112','juan@nominaz.com','1975-10-19','2','MIRIAN FERNADA LOPEZ RIVAS','N',2,'N','N','2017-12-01',NULL,'1',1,'00001',3,'6',1200.00,'00001','S','N','S','S','S','1','2','1','4888866100','00163',NULL,NULL,'00063','X','01',0,'999','O+','1210000000006','N',NULL,'A',NULL,'N','001','N','N',0.00,NULL,'1',240,'N','N',5,'N','00001',NULL,NULL,NULL,2289,'2024-03-21 17:03:30',NULL,NULL,NULL,NULL,NULL,1,NULL,'GENERAL'),('HN00000004','HN00000004',NULL,'P','E','NICOLE','TATIANA','MANZABA','PARRAGA','F','00063','00008','00067','GUZMAN CONJUNTO A','088888888','0969658112','nicoole@nominaz.com','1975-10-19','2','','N',0,'N','N','2018-12-20',NULL,'1',1,'00001',2,'6',1800.00,'00001','S','S','S','S','S','1','2','1','4985666177','00164',NULL,NULL,'00063','X','02',50,'999','O+','1210000000006','N',NULL,'A',NULL,'N','001','N','N',0.00,NULL,'1',240,'N','N',5,'N','00001',NULL,NULL,NULL,2289,'2024-03-21 17:02:28',NULL,NULL,NULL,NULL,NULL,1,NULL,'GENERAL'),('HN00000005','HN00000005',NULL,'P','E','ALEXA','MARIA','PEREZ','GARCIA','F','00063','00014','00140','CONJUNTO A','088888888','0969658112','alexa@nominaz.com','1975-10-19','2','','N',0,'N','N','2019-12-30',NULL,'1',1,'00001',1,'6',8800.00,'00001','S','S','S','S','S','1','2','1','4984321100','00154',NULL,NULL,'00063','X','02',80,'999','O+','1210000000006','N',NULL,'A',NULL,'N','001','N','N',0.00,NULL,'1',240,'N','N',5,'N','00001',NULL,NULL,NULL,1417,'2020-07-08 21:06:26',NULL,NULL,NULL,NULL,NULL,1,NULL,'GENERAL'),('HN00000003','HN00000003',NULL,'P','E','CARLOS','ALBERTO','SALAZAR','PARRAGA','M','00063','00019','00188','PEDRO PINTO GUZMAN CONJUNTO A','022222222','0961103112','carlos@nominaz.com','1975-10-19','2','MIRIAN FERNADA LOPEZ RIVAS','N',0,'N','N','2019-05-01',NULL,'1',1,'00001',3,'6',5800.00,'00001','S','S','S','N','N','1','2','1','4985666100','00163',NULL,NULL,'00063','X','01',0,'999','O+','1210000000006','N',NULL,'A',NULL,'N','001','N','N',0.00,NULL,'1',240,'N','N',5,'N','00001',NULL,NULL,NULL,2289,'2024-03-21 17:02:37',NULL,NULL,NULL,NULL,NULL,1,NULL,'GENERAL'),('HN00000002','HN00000002',NULL,'P','E','LUIS','ALBERTO','YANEZ','ORTEGA','M','00063','00019','00188','PEDRO PINTO GUZMAN CONJUNTO B','022222222','0961103112','luis@nominaz.com','1975-10-19','2','','N',0,'N','N','2018-02-10',NULL,'1',1,'00001',1,'6',1500.00,'00001','N','N','S','N','N','1','2','1','4888866999','00163',NULL,NULL,'00063','X','01',0,'999','O+','1210000000006','N',NULL,'A',NULL,'N','001','N','N',0.00,NULL,'1',240,'N','N',5,'N','00001',NULL,NULL,NULL,2289,'2024-03-21 17:02:59',NULL,NULL,NULL,NULL,NULL,1,NULL,'GENERAL');
UNLOCK TABLES;

-- Dump completed on 2024-03-21 17:07:54
