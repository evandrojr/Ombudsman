-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.10


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema sistema_ouvidoria
--

CREATE DATABASE IF NOT EXISTS sistema_ouvidoria;
USE sistema_ouvidoria;

--
-- Definition of table `sistema_ouvidoria`.`acesso`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`acesso`;
CREATE TABLE  `sistema_ouvidoria`.`acesso` (
  `COD_FUNC` int(11) NOT NULL DEFAULT '0',
  `COD_FUNCIO` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`COD_FUNC`,`COD_FUNCIO`),
  KEY `COD_FUNCIO` (`COD_FUNCIO`),
  CONSTRAINT `acesso_ibfk_1` FOREIGN KEY (`COD_FUNC`) REFERENCES `funcionario` (`COD_FUNC`),
  CONSTRAINT `acesso_ibfk_2` FOREIGN KEY (`COD_FUNCIO`) REFERENCES `funcionalidade` (`COD_FUNCIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`acesso`
--

/*!40000 ALTER TABLE `acesso` DISABLE KEYS */;
LOCK TABLES `acesso` WRITE;
INSERT INTO `sistema_ouvidoria`.`acesso` VALUES  (1,1),
 (1,2),
 (1,15),
 (1,16),
 (1,17),
 (1,18),
 (1,19),
 (1,20),
 (1,21),
 (1,22),
 (1,23),
 (1,24),
 (1,25),
 (1,33),
 (1,38),
 (1,39),
 (1,40),
 (1,41),
 (1,46),
 (1,47),
 (1,52),
 (1,53);
UNLOCK TABLES;
/*!40000 ALTER TABLE `acesso` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`acessodefault`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`acessodefault`;
CREATE TABLE  `sistema_ouvidoria`.`acessodefault` (
  `COD_PERFIL` int(11) NOT NULL DEFAULT '0',
  `COD_FUNCIO` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`COD_PERFIL`,`COD_FUNCIO`),
  KEY `COD_FUNCIO` (`COD_FUNCIO`),
  CONSTRAINT `acessodefault_ibfk_1` FOREIGN KEY (`COD_FUNCIO`) REFERENCES `funcionalidade` (`COD_FUNCIO`),
  CONSTRAINT `acessodefault_ibfk_2` FOREIGN KEY (`COD_PERFIL`) REFERENCES `perfil` (`COD_PERFIL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`acessodefault`
--

/*!40000 ALTER TABLE `acessodefault` DISABLE KEYS */;
LOCK TABLES `acessodefault` WRITE;
INSERT INTO `sistema_ouvidoria`.`acessodefault` VALUES  (7,1),
 (6,3),
 (2,4),
 (5,4),
 (6,4),
 (6,5),
 (6,7),
 (6,8),
 (6,9),
 (1,11),
 (2,11),
 (5,11),
 (1,12),
 (2,12),
 (5,12),
 (1,13),
 (2,13),
 (5,13),
 (1,14),
 (2,14),
 (5,14),
 (4,15),
 (7,15),
 (3,16),
 (7,16),
 (1,17),
 (2,17),
 (3,17),
 (4,17),
 (7,17),
 (3,18),
 (7,18),
 (3,19),
 (7,19),
 (3,20),
 (7,20),
 (3,21),
 (7,21),
 (3,22),
 (7,22),
 (2,23),
 (3,23),
 (7,23),
 (3,24),
 (7,24),
 (3,25),
 (7,25),
 (1,26),
 (2,26),
 (1,27),
 (2,27),
 (1,28),
 (2,28),
 (1,29),
 (2,29),
 (1,30),
 (2,30),
 (1,31),
 (2,31),
 (5,31),
 (6,32),
 (2,33),
 (7,33),
 (6,34),
 (1,35),
 (2,35),
 (1,36),
 (2,36),
 (5,36),
 (4,38),
 (7,38),
 (4,39),
 (7,39),
 (7,40),
 (7,41),
 (1,42),
 (2,42),
 (6,43),
 (1,44),
 (2,44),
 (5,44),
 (1,45),
 (2,45),
 (1,46),
 (2,46),
 (3,46),
 (4,46),
 (5,46),
 (6,46),
 (7,46),
 (1,47),
 (2,47),
 (4,47),
 (5,47),
 (7,47),
 (1,48),
 (2,48),
 (5,49),
 (6,49),
 (1,51),
 (2,51),
 (1,52),
 (2,52),
 (3,52),
 (4,52),
 (5,52),
 (6,52),
 (7,52),
 (1,55),
 (2,55);
UNLOCK TABLES;
/*!40000 ALTER TABLE `acessodefault` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`acionador`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`acionador`;
CREATE TABLE  `sistema_ouvidoria`.`acionador` (
  `COD_ACNDOR` int(11) NOT NULL AUTO_INCREMENT,
  `COD_UF` int(11) DEFAULT '0',
  `COD_MEIO_ENVIO_RESP_ORGAO` int(11) NOT NULL DEFAULT '0',
  `COD_FAIXA_ETARIA` int(11) DEFAULT '0',
  `COD_MEIO_RECEB_RESP` int(11) DEFAULT NULL,
  `COD_CONS_ACNMNT` int(11) DEFAULT NULL,
  `COD_TIPO_ACNDOR` int(11) NOT NULL DEFAULT '0',
  `COD_ESCOLA` int(11) DEFAULT '0',
  `TIP_SEXO` char(1) DEFAULT NULL,
  `DSC_EMAIL` varchar(112) DEFAULT NULL,
  `DSC_TEL` varchar(32) DEFAULT NULL,
  `DSC_DDD_TEL` varchar(16) DEFAULT NULL,
  `DSC_DDI_TEL` varchar(16) DEFAULT NULL,
  `DSC_FAX` varchar(32) DEFAULT NULL,
  `DSC_DDD_FAX` varchar(16) DEFAULT NULL,
  `DSC_DDI_FAX` varchar(16) DEFAULT NULL,
  `TIP_CPF_CNPJ` char(1) DEFAULT NULL,
  `DSC_RAZAO_SOC` text,
  `NUM_CNPJ` varchar(32) DEFAULT NULL,
  `NUM_CPF_CONTAT` varchar(32) DEFAULT NULL,
  `NOM_CONTAT` varchar(208) DEFAULT NULL,
  `NOM_ACNDOR` varchar(208) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `NUM_CPF_ACNDOR` varchar(32) DEFAULT NULL,
  `NUM_MATRICULA` varchar(32) DEFAULT NULL,
  `DSC_SETOR` text,
  `COD_PAIS` int(11) DEFAULT NULL,
  PRIMARY KEY (`COD_ACNDOR`),
  KEY `COD_UF` (`COD_UF`),
  KEY `COD_MEIO_ENVIO_RESP_ORGAO` (`COD_MEIO_ENVIO_RESP_ORGAO`),
  KEY `COD_FAIXA_ETARIA` (`COD_FAIXA_ETARIA`),
  KEY `COD_MEIO_RECEB_RESP` (`COD_MEIO_RECEB_RESP`),
  KEY `COD_CONS_ACNMNT` (`COD_CONS_ACNMNT`),
  KEY `COD_TIPO_ACNDOR` (`COD_TIPO_ACNDOR`),
  KEY `COD_ESCOLA` (`COD_ESCOLA`),
  KEY `COD_PAIS` (`COD_PAIS`),
  CONSTRAINT `acionador_ibfk_1` FOREIGN KEY (`COD_UF`) REFERENCES `uf` (`COD_UF`),
  CONSTRAINT `acionador_ibfk_2` FOREIGN KEY (`COD_MEIO_ENVIO_RESP_ORGAO`) REFERENCES `meioenviorespostaorgao` (`COD_MEIO_ENVIO_RESP_ORGAO`),
  CONSTRAINT `acionador_ibfk_3` FOREIGN KEY (`COD_FAIXA_ETARIA`) REFERENCES `faixaetaria` (`COD_FAIXA_ETARIA`),
  CONSTRAINT `acionador_ibfk_4` FOREIGN KEY (`COD_MEIO_RECEB_RESP`) REFERENCES `informacoesrecebimentoresposta` (`COD_MEIO_RECEB_RESP`),
  CONSTRAINT `acionador_ibfk_5` FOREIGN KEY (`COD_CONS_ACNMNT`) REFERENCES `informacoesconsultaacionamento` (`COD_CONS_ACNMNT`),
  CONSTRAINT `acionador_ibfk_6` FOREIGN KEY (`COD_TIPO_ACNDOR`) REFERENCES `tipoacionador` (`COD_TIPO_ACNDOR`),
  CONSTRAINT `acionador_ibfk_7` FOREIGN KEY (`COD_ESCOLA`) REFERENCES `escolaridade` (`COD_ESCOLA`),
  CONSTRAINT `acionador_ibfk_8` FOREIGN KEY (`COD_PAIS`) REFERENCES `pais` (`COD_PAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 10240 kB; ("COD_PAIS") REFER "ouvidoria/pais"("';

--
-- Dumping data for table `sistema_ouvidoria`.`acionador`
--

/*!40000 ALTER TABLE `acionador` DISABLE KEYS */;
LOCK TABLES `acionador` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `acionador` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`acionamento`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`acionamento`;
CREATE TABLE  `sistema_ouvidoria`.`acionamento` (
  `COD_ACNMNT` int(11) NOT NULL AUTO_INCREMENT,
  `COD_ESTADO_ACNMNT` int(11) NOT NULL DEFAULT '0',
  `COD_ACNDOR` int(11) NOT NULL DEFAULT '0',
  `COD_MSG` int(11) NOT NULL DEFAULT '0',
  `COD_LOCAL_OCORR` int(11) NOT NULL DEFAULT '0',
  `COD_FUNC` int(11) NOT NULL DEFAULT '0',
  `COD_MEIO_RECEB` int(11) DEFAULT NULL,
  `COD_RESP` int(11) DEFAULT NULL,
  `NUM_PROTOC` int(11) DEFAULT NULL,
  `DAT_ACNMNT` datetime DEFAULT NULL,
  `DSC_ORIGEM_ACNMNT` varchar(10) DEFAULT NULL,
  `DSC_DSPCHO` text,
  `DAT_INI_ANDMNT` datetime DEFAULT NULL,
  `DAT_PREV_RESOL_INT` datetime DEFAULT NULL,
  `DAT_PREV_RESOL_EXT` datetime DEFAULT NULL,
  `DAT_LIMITE_DBLOQ` datetime DEFAULT NULL,
  `IND_ATEND_PRAZO` char(1) DEFAULT NULL,
  PRIMARY KEY (`COD_ACNMNT`),
  UNIQUE KEY `NUM_PROTOC` (`NUM_PROTOC`),
  KEY `COD_ESTADO_ACNMNT` (`COD_ESTADO_ACNMNT`),
  KEY `COD_MEIO_RECEB` (`COD_MEIO_RECEB`),
  KEY `COD_RESP` (`COD_RESP`),
  KEY `COD_MSG` (`COD_MSG`),
  KEY `COD_ACNDOR` (`COD_ACNDOR`),
  KEY `COD_FUNC` (`COD_FUNC`),
  KEY `COD_LOCAL_OCORR` (`COD_LOCAL_OCORR`),
  CONSTRAINT `acionamento_ibfk_1` FOREIGN KEY (`COD_ESTADO_ACNMNT`) REFERENCES `estadoacionamento` (`COD_ESTADO_ACNMNT`),
  CONSTRAINT `acionamento_ibfk_2` FOREIGN KEY (`COD_MEIO_RECEB`) REFERENCES `meiorecebimento` (`COD_MEIO_RECEB`),
  CONSTRAINT `acionamento_ibfk_3` FOREIGN KEY (`COD_RESP`) REFERENCES `respostaacionamento` (`COD_RESP`),
  CONSTRAINT `acionamento_ibfk_4` FOREIGN KEY (`COD_MSG`) REFERENCES `mensagem` (`COD_MSG`),
  CONSTRAINT `acionamento_ibfk_5` FOREIGN KEY (`COD_ACNDOR`) REFERENCES `acionador` (`COD_ACNDOR`),
  CONSTRAINT `acionamento_ibfk_6` FOREIGN KEY (`COD_FUNC`) REFERENCES `funcionario` (`COD_FUNC`),
  CONSTRAINT `acionamento_ibfk_7` FOREIGN KEY (`COD_LOCAL_OCORR`) REFERENCES `localidadeocorrencia` (`COD_LOCAL_OCORR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`acionamento`
--

/*!40000 ALTER TABLE `acionamento` DISABLE KEYS */;
LOCK TABLES `acionamento` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `acionamento` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`ajuda`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`ajuda`;
CREATE TABLE  `sistema_ouvidoria`.`ajuda` (
  `COD_AJUDA` int(10) unsigned NOT NULL DEFAULT '0',
  `COD_FUNCIO` int(11) DEFAULT '0',
  `COD_AJUDA_PAI` int(10) unsigned DEFAULT NULL,
  `DSC_TITULO` varchar(50) NOT NULL DEFAULT '',
  `IND_TIPO` char(1) NOT NULL DEFAULT '',
  `DSC_HTML_AJUDA` varchar(255) DEFAULT NULL,
  `NUM_ORDEM` int(10) unsigned NOT NULL DEFAULT '0',
  `COD_GRUPO` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`COD_AJUDA`),
  KEY `COD_FUNCIO` (`COD_FUNCIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabela utilizada para o help da aplicação';

--
-- Dumping data for table `sistema_ouvidoria`.`ajuda`
--

/*!40000 ALTER TABLE `ajuda` DISABLE KEYS */;
LOCK TABLES `ajuda` WRITE;
INSERT INTO `sistema_ouvidoria`.`ajuda` VALUES  (0,0,NULL,'','',NULL,0,1),
 (1,38,NULL,'Manter Scripts','2','ajuda/help_38.html',1,3),
 (2,38,1,'Busca de Scripts','2','ajuda/help_38.html#busca',1,3),
 (3,38,1,'Lista de Scripts','2','ajuda/help_38.html#lista',2,3),
 (4,38,1,'Detalhamento de Script','2','ajuda/help_38.html#detalhe',3,3),
 (5,5,6,'Avaliar Solução','2','../ExibirMensagemGenerica.do?titulo=Mensagem&tela=Ajuda&texto=Desculpe, ajuda ainda não disponível',2,3),
 (6,1,7,'Consultar Resposta','2','../ExibirMensagemGenerica.do?titulo=Mensagem&tela=Ajuda&texto=Desculpe, ajuda ainda não disponível',1,3),
 (7,47,NULL,'Consultar','2','../ExibirMensagemGenerica.do?titulo=Mensagem&tela=Ajuda&texto=Desculpe, ajuda ainda não disponível',1,3),
 (8,32,NULL,'Acionamento','2','ajuda/acionamento/helpEnviarMensagemWeb.jsp',4,3);
UNLOCK TABLES;
/*!40000 ALTER TABLE `ajuda` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`assunto`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`assunto`;
CREATE TABLE  `sistema_ouvidoria`.`assunto` (
  `COD_ASSNTO` int(11) NOT NULL AUTO_INCREMENT,
  `COD_INSTIT` int(11) NOT NULL DEFAULT '0',
  `DSC_ASSNTO` varchar(50) NOT NULL DEFAULT '',
  `QTD_PRAZO_INT` int(11) DEFAULT NULL,
  `QTD_PRAZO_EXT` int(11) DEFAULT NULL,
  `DAT_CADAST` datetime DEFAULT NULL,
  `DAT_VIGENC` datetime DEFAULT NULL,
  `DSC_DETALH_ASSNTO` text,
  PRIMARY KEY (`COD_ASSNTO`),
  KEY `COD_INSTIT` (`COD_INSTIT`),
  CONSTRAINT `assunto_ibfk_1` FOREIGN KEY (`COD_INSTIT`) REFERENCES `instituicao` (`COD_INSTIT`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`assunto`
--

/*!40000 ALTER TABLE `assunto` DISABLE KEYS */;
LOCK TABLES `assunto` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `assunto` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`atendimento`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`atendimento`;
CREATE TABLE  `sistema_ouvidoria`.`atendimento` (
  `COD_ATEND` int(11) NOT NULL AUTO_INCREMENT,
  `COD_SCRIPT` int(11) NOT NULL DEFAULT '0',
  `COD_FUNC` int(11) DEFAULT NULL,
  `DAT_ATEND` datetime DEFAULT NULL,
  PRIMARY KEY (`COD_ATEND`),
  KEY `COD_SCRIPT` (`COD_SCRIPT`),
  KEY `COD_FUNC` (`COD_FUNC`),
  CONSTRAINT `atendimento_ibfk_1` FOREIGN KEY (`COD_SCRIPT`) REFERENCES `script` (`COD_SCRIPT`),
  CONSTRAINT `atendimento_ibfk_2` FOREIGN KEY (`COD_FUNC`) REFERENCES `funcionario` (`COD_FUNC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`atendimento`
--

/*!40000 ALTER TABLE `atendimento` DISABLE KEYS */;
LOCK TABLES `atendimento` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `atendimento` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`boletim`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`boletim`;
CREATE TABLE  `sistema_ouvidoria`.`boletim` (
  `COD_BOLET` int(11) NOT NULL AUTO_INCREMENT,
  `COD_INSTIT` int(11) NOT NULL DEFAULT '0',
  `COD_FUNC` int(11) NOT NULL DEFAULT '0',
  `NOM_BOLET` varchar(50) DEFAULT NULL,
  `NUM_BOLET` int(11) DEFAULT NULL,
  `NUM_TEL` varchar(15) DEFAULT NULL,
  `DSC_AREA_GERD` varchar(50) DEFAULT NULL,
  `DSC_CONTEU` text,
  `IND_PUBLIC` char(1) DEFAULT NULL,
  `IND_CABEC` char(1) DEFAULT NULL,
  `IND_GRAFIC` char(1) DEFAULT NULL,
  `IND_TABELA` char(1) DEFAULT NULL,
  `DSC_DIR_LOCAL` varchar(100) DEFAULT NULL,
  `DAT_CADAST` datetime DEFAULT NULL,
  PRIMARY KEY (`COD_BOLET`),
  UNIQUE KEY `NUM_BOLET` (`NUM_BOLET`),
  KEY `COD_FUNC` (`COD_FUNC`),
  KEY `COD_INSTIT` (`COD_INSTIT`),
  CONSTRAINT `boletim_ibfk_1` FOREIGN KEY (`COD_FUNC`) REFERENCES `funcionario` (`COD_FUNC`),
  CONSTRAINT `boletim_ibfk_2` FOREIGN KEY (`COD_INSTIT`) REFERENCES `instituicao` (`COD_INSTIT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`boletim`
--

/*!40000 ALTER TABLE `boletim` DISABLE KEYS */;
LOCK TABLES `boletim` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `boletim` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`configuracoes`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`configuracoes`;
CREATE TABLE  `sistema_ouvidoria`.`configuracoes` (
  `COD_CONFIG` int(11) NOT NULL AUTO_INCREMENT,
  `IND_PERM_MSG_DIGIT_ACNMNT` char(1) NOT NULL DEFAULT '',
  `IND_PERM_ARQ_ANEXO_ACNMNT` char(1) NOT NULL DEFAULT '',
  `NUM_TAM_MAX_ARQ_MSG_DIGIT` int(11) DEFAULT NULL,
  `NUM_TAM_MAX_ARQ_ANEXO` int(11) DEFAULT NULL,
  `IND_POSSUI_CODIGO_ACESSO` char(1) NOT NULL DEFAULT '',
  `IND_BLOQ_CODIGO_ACESSO` char(1) DEFAULT NULL,
  `QTD_TENT_CODIGO_ACESSO` int(11) DEFAULT NULL,
  `QTD_TEMPO_BLOQ_CODIGO_ACESSO` int(11) DEFAULT NULL,
  `IND_BLOQ_PROTOC` char(1) DEFAULT NULL,
  `QTD_TENT_PROTOC` int(11) DEFAULT NULL,
  `QTD_TEMPO_BLOQ_PROTOC` int(11) DEFAULT NULL,
  `IND_PERM_ATEND_CONS_MSG` char(1) NOT NULL DEFAULT '',
  `IND_CERT_DIGIT_GERAL` char(1) NOT NULL DEFAULT '',
  `IND_CERT_DIGIT_ORGAO` char(1) NOT NULL DEFAULT '',
  `DSC_DIR_ARQ_ANEXOS_ORGAO` varchar(100) NOT NULL DEFAULT '',
  `DSC_URL_BASE_FUNC` varchar(255) DEFAULT NULL,
  `DSC_TEXTO_APRES_OUVID` text NOT NULL,
  `DSC_TEXTO_APRES_FORM` text,
  `DSC_TEXTO_RESP_ACNMNT` text NOT NULL,
  `DSC_TEXTO_CONS_RESP_NO_PRAZO` text NOT NULL,
  `DSC_TEXTO_CONS_RESP_SEM_PRAZO` text NOT NULL,
  `DSC_TEXTO_CONS_RESP_EM_ATRASO` text NOT NULL,
  `DSC_TEXTO_APRES_RESP` text NOT NULL,
  `DSC_TEXTO_INFO_OUVID` text NOT NULL,
  `DSC_TEXTO_CANAIS_COMUNI` text,
  `DSC_TEXTO_AVAL_RESP` text NOT NULL,
  `DSC_ESQMA_CORES` varchar(50) NOT NULL DEFAULT '',
  `NOM_EXIB_ORGAO` varchar(100) DEFAULT NULL,
  `NOM_IMG_LOGO` varchar(100) DEFAULT NULL,
  `NOM_IMG_BANNER` varchar(100) DEFAULT NULL,
  `NOM_IMG_3` varchar(100) DEFAULT NULL,
  `NOM_IMG_4` varchar(100) DEFAULT NULL,
  `NOM_IMG_5` varchar(100) DEFAULT NULL,
  `NOM_REMET_EMAIL` varchar(100) NOT NULL DEFAULT '',
  `DSC_TEXTO_LEGISL_OUVID` text,
  `DSC_COR_CAB_LOGO` varchar(50) NOT NULL DEFAULT '',
  `DSC_COR_CAB_BANNER` varchar(50) NOT NULL DEFAULT '',
  `DSC_URL_SUPORT_USU` varchar(255) NOT NULL DEFAULT '',
  `DSC_IMG_LOGO` text,
  `DSC_IMG_BANNER` text,
  `DSC_IMG_3` text,
  `DSC_IMG_4` text,
  `DSC_IMG_5` text,
  `URL_IMG_LOGO` text,
  `URL_IMG_BANNER` text,
  `URL_IMG_3` text,
  `URL_IMG_4` text,
  `URL_IMG_5` text,
  `DSC_TEXTO_NOTIFICACAO_PENDENCIA` text,
  `DSC_TEXTO_NOTIFICACAO_ATRASO` text,
  `DSC_TEXTO_NOTIFICACAO_ATRASO_CRITICO` text,
  `IND_NOTIFICACAO_EMAIL` char(1) DEFAULT 'N',
  `HOR_ENVIO_NOTIFICACAO` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`COD_CONFIG`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`configuracoes`
--

/*!40000 ALTER TABLE `configuracoes` DISABLE KEYS */;
LOCK TABLES `configuracoes` WRITE;
INSERT INTO `sistema_ouvidoria`.`configuracoes` VALUES  (12,'0','0',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','admin','','ADMINISTRAÇÃO DAS OUVIDORIAS','ADMINISTRAÇÃO DAS OUVIDORIAS','ADMINISTRAÇÃO DAS OUVIDORIAS','ADMINISTRAÇÃO DAS OUVIDORIAS','ADMINISTRAÇÃO DAS OUVIDORIAS','ADMINISTRAÇÃO DAS OUVIDORIAS','ADMINISTRAÇÃO DAS OUVIDORIAS','ADMINISTRAÇÃO DAS OUVIDORIAS','ADMINISTRAÇÃO DAS OUVIDORIAS','ADMINISTRAÇÃO DAS OUVIDORIAS','Azul','Administração das Ouvidorias','imgexemplo1.gif','imgexemplo2.gif',NULL,NULL,NULL,'nobody@domain','ADMINISTRAÇÃO DAS OUVIDORIAS','FFFFFF','000000','http://www.serpro.gov.br/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL),
 (13,'1','1',2000,2000,'1','1',4,3,'1',4,10,'1','0','0','dnit','','Este é o Sistema de Ouvidoria do DNIT que é utilizado para possibilitar a comunicação com a Ouvidoria. ','Esta opção permite ao empregado entrar em contato com a Administração, por intermédio da Ouvidoria, para a apresentação de suas denúncias, reclamações, sugestões, pedidos e elogios.','Agradecemos por falar com a Ouvidoria do DNIT. Guarde o protocolo e o código de acesso para posterior acompanhamento de sua mensagem.','Estamos trabalhando na resposta a sua mensagem, que lhe será encaminhada pelo meio de comunicação escolhido.','Estamos trabalhando na resposta a sua mensagem, que lhe será encaminhada pelo meio de comunicação escolhido.','Pedimos desculpas pelo atraso em sua resposta. Estamos providenciando melhor atendê-lo em seu próximo acionamento.','Conforme solicitado, segue abaixo a resposta a seu acionamento.','O Sistema de Ouvidoria facilita a solução de problemas e conflitos organizacionais. Ajuda na melhoria do atendimento às expectativas dos empregados com agilidade e transparência, de forma ética e reservada. As informações sistematizadas e consolidadas a partir das mensagens recebidas dos empregados serão utilizadas pela Empresa para apoio ao planejamento participativo e para a tomada de decisões gerenciais. O sistema prestará uma efetiva contribuição para a melhoria do relacionamento entre a Empresa e seu público interno, com benefícios extensivos a toda a sociedade, que passará a contar com uma organização mais motivada para o desempenho de suas obrigações sociais.','Para melhor atendê-lo, a Ouvidoria do DNIT pode ser contactada via:\r\n\r\n    * Central de Atendimento telefônico: 0800-611535 (08:00 às 12:00 e das 14:00 às 18:00 hs)\r\n    * Ouvidoria Virtual: ouvidoria@dnit.gov.br\r\n    * Fax: (61) 3315-4051\r\n    * Carta: SAN Quadra 03 Lote A, 4° andar, sala 097, Ed. Núcleo dos Transportes - Brasília/DF - CEP:70.040-902\r\n','Solicitamos avaliar nossa resposta. Caso não tenha sido possível atender suas expectativas, pedimos que entre novamente em contato, gerando novo acionamento, e nos informando quanto a sua insatisfação. Muito obrigado.','Azul','Ministério dos Transportes','AssinaMinFazenda.bmp','logo_dnit.jpg','space.bmp',NULL,NULL,'ouvidoria@dnit.gov.br','Conforme especifica o Decreto 2.341 de 21 de setembro de 2005, todo órgão público deverá ter um sistema de Ouvidoria para atender o cidadão.','FFCC00','0181E5','http://www.dnit.gov.br','DNIT - Departamento Nacional de Infraestrutura de Transpostes','','','','','http://www.dnit.gov.br','http://www.dnit.gov.br','','','','Existe mensagem com resposta pendente sob sua responsabilidade.','Existe mensagem em atraso sob sua responsabilidade.','Existe mensagem com estado atraso crítico sob sua responsabilidade.','S','12:00');
UNLOCK TABLES;
/*!40000 ALTER TABLE `configuracoes` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`escolaridade`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`escolaridade`;
CREATE TABLE  `sistema_ouvidoria`.`escolaridade` (
  `COD_ESCOLA` int(11) NOT NULL AUTO_INCREMENT,
  `DSC_ESCOLA` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`COD_ESCOLA`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`escolaridade`
--

/*!40000 ALTER TABLE `escolaridade` DISABLE KEYS */;
LOCK TABLES `escolaridade` WRITE;
INSERT INTO `sistema_ouvidoria`.`escolaridade` VALUES  (1,'Analfabeto'),
 (2,'Alfabetizado'),
 (3,'Primeiro Grau'),
 (4,'Segundo Grau'),
 (5,'Superior'),
 (6,'Pós-Graduação'),
 (7,'Mestrado'),
 (8,'Doutorado'),
 (9,'Pós-Doutorado');
UNLOCK TABLES;
/*!40000 ALTER TABLE `escolaridade` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`estadoacionamento`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`estadoacionamento`;
CREATE TABLE  `sistema_ouvidoria`.`estadoacionamento` (
  `COD_ESTADO_ACNMNT` int(11) NOT NULL AUTO_INCREMENT,
  `DSC_ESTADO_ACNMNT` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`COD_ESTADO_ACNMNT`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`estadoacionamento`
--

/*!40000 ALTER TABLE `estadoacionamento` DISABLE KEYS */;
LOCK TABLES `estadoacionamento` WRITE;
INSERT INTO `sistema_ouvidoria`.`estadoacionamento` VALUES  (1,'Pendente'),
 (2,'Atraso'),
 (3,'Crítico'),
 (4,'Em Andamento'),
 (5,'Respondido'),
 (6,'Enviado');
UNLOCK TABLES;
/*!40000 ALTER TABLE `estadoacionamento` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`estadoscript`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`estadoscript`;
CREATE TABLE  `sistema_ouvidoria`.`estadoscript` (
  `COD_ESTADO_SCRIPT` int(11) NOT NULL AUTO_INCREMENT,
  `DSC_ESTADO_SCRIPT` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`COD_ESTADO_SCRIPT`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`estadoscript`
--

/*!40000 ALTER TABLE `estadoscript` DISABLE KEYS */;
LOCK TABLES `estadoscript` WRITE;
INSERT INTO `sistema_ouvidoria`.`estadoscript` VALUES  (1,'APROVADO'),
 (2,'REPROVADO'),
 (3,'PENDENTE'),
 (4,'INATIVO');
UNLOCK TABLES;
/*!40000 ALTER TABLE `estadoscript` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`estadosolucao`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`estadosolucao`;
CREATE TABLE  `sistema_ouvidoria`.`estadosolucao` (
  `COD_ESTADO_SOLUCAO` int(11) NOT NULL AUTO_INCREMENT,
  `DSC_ESTADO_SOLUCAO` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`COD_ESTADO_SOLUCAO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`estadosolucao`
--

/*!40000 ALTER TABLE `estadosolucao` DISABLE KEYS */;
LOCK TABLES `estadosolucao` WRITE;
INSERT INTO `sistema_ouvidoria`.`estadosolucao` VALUES  (1,'APROVADO'),
 (2,'REPROVADO'),
 (3,'PENDENTE'),
 (4,'INATIVO');
UNLOCK TABLES;
/*!40000 ALTER TABLE `estadosolucao` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`faixaetaria`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`faixaetaria`;
CREATE TABLE  `sistema_ouvidoria`.`faixaetaria` (
  `COD_FAIXA_ETARIA` int(11) NOT NULL AUTO_INCREMENT,
  `DSC_INTERV` varchar(20) DEFAULT NULL,
  `NUM_IDADE_INI` int(11) DEFAULT NULL,
  `NUM_IDADE_FIM` int(11) DEFAULT NULL,
  PRIMARY KEY (`COD_FAIXA_ETARIA`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`faixaetaria`
--

/*!40000 ALTER TABLE `faixaetaria` DISABLE KEYS */;
LOCK TABLES `faixaetaria` WRITE;
INSERT INTO `sistema_ouvidoria`.`faixaetaria` VALUES  (1,'Até 18 anos',0,18),
 (2,'De 19 até 25',19,25),
 (3,'De 26 até 30',26,30),
 (4,'De 31 até 35',31,35),
 (5,'De 36 até 40',36,40),
 (6,'De 41 até 45',41,45),
 (7,'De 46 até 50',46,50),
 (8,'De 51 até 55',51,55),
 (9,'De 56 até 65',56,65),
 (10,'Acima de 65 anos',65,999);
UNLOCK TABLES;
/*!40000 ALTER TABLE `faixaetaria` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`funcionalidade`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`funcionalidade`;
CREATE TABLE  `sistema_ouvidoria`.`funcionalidade` (
  `COD_FUNCIO` int(11) NOT NULL AUTO_INCREMENT,
  `COD_FUNCIO_PAI` int(11) DEFAULT NULL,
  `DSC_FUNCIO` varchar(50) DEFAULT NULL,
  `IND_HISTOR` char(1) DEFAULT NULL,
  `IND_ITEM_MENU` char(1) DEFAULT NULL,
  `DAT_CADAST` datetime DEFAULT NULL,
  `DSC_PATH` varchar(100) NOT NULL DEFAULT '',
  `NUM_ORDEM_ITEM_MENU` int(11) DEFAULT NULL,
  `IND_AUTENT` char(1) DEFAULT NULL,
  `DSC_PATH_IMAGEM_HI` varchar(100) DEFAULT NULL,
  `DSC_PATH_IMAGEM_LO` varchar(100) DEFAULT NULL,
  `TAM_IMAGEM` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`COD_FUNCIO`),
  KEY `COD_FUNCIO_PAI` (`COD_FUNCIO_PAI`),
  CONSTRAINT `funcionalidade_ibfk_1` FOREIGN KEY (`COD_FUNCIO_PAI`) REFERENCES `funcionalidade` (`COD_FUNCIO`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`funcionalidade`
--

/*!40000 ALTER TABLE `funcionalidade` DISABLE KEYS */;
LOCK TABLES `funcionalidade` WRITE;
INSERT INTO `sistema_ouvidoria`.`funcionalidade` VALUES  (1,47,'Consultar Respostas','1','1','2004-12-07 00:00:00','/andamento/ConsultarResposta.do',15,'0',NULL,NULL,NULL),
 (2,NULL,'Acesso Restrito','1','0','2004-12-07 00:00:00','/Login.do?action=exibir',2,'0','pages/images/menu/SistFr02BotAcessoRestrito01.gif','pages/images/menu/SistFr02BotAcessoRestrito02.gif','100'),
 (3,49,'Recuperar Código de Acesso','1','1','2004-12-08 00:00:00','/andamento/RecuperaCodigoAcesso.do',44,'0',NULL,NULL,NULL),
 (4,11,'Consultar Mensagem','1','0','2004-12-08 00:00:00','/andamento/ConsultaMsgPorRespons.do',4,'1',NULL,NULL,NULL),
 (5,1,'Avaliar Solução','1','0','2004-12-08 00:00:00','',5,'1',NULL,NULL,NULL),
 (6,NULL,'Enviar Email','1','0','2004-12-08 00:00:00','',6,'1','pages/images/menu/SistFr02BotAcessoRestrito01.gif','pages/images/menu/SistFr02BotAcessoRestrito02.gif',NULL),
 (7,49,'Consultar Scripts','0','1','2004-12-08 00:00:00','/acionamento/ConsultarScript.do',41,'1',NULL,NULL,NULL),
 (8,NULL,'Fale com a Ouvidoria','0','1','2005-02-10 18:46:00','/ExibirMensagemGenerica.do?titulo=Fale com a Ouvidoria&tela=Fale com a Ouvidoria&funcionalidade=8',32,'1','pages/images/menu/SistFr02BotFaleOuvidoria01.gif','pages/images/menu/SistFr02BotFaleOuvidoria02.gif','131'),
 (9,32,'Digitalizar carta de acionamento','0','0','2004-12-08 00:00:00','about:blank',9,'1',NULL,NULL,NULL),
 (10,4,'Imprimir resposta acionamento','0','0','2004-12-08 00:00:00','about:blank',10,'1',NULL,NULL,NULL),
 (11,47,'Mensagens','0','1','2004-12-11 00:00:00','/andamento/ConsultaMsgPorRespons.do',11,'1',NULL,NULL,NULL),
 (12,36,'Redirecionar Mensagem','1','0','2004-12-11 00:00:00','about:blank',12,'1',NULL,NULL,NULL),
 (13,49,'Banco de Soluções','0','1','2004-12-11 00:00:00','/andamento/ConsultaSolucoes.do',13,'1',NULL,NULL,NULL),
 (14,49,'Banco de Scripts','0','1','2004-12-11 00:00:00','/andamento/ConsultarBancoScripts.do',14,'1',NULL,NULL,NULL),
 (15,47,'Mensagens Respondidas','0','1','2004-12-11 00:00:00','/gerencial/ConsultaMsgRespondida.do',15,'1',NULL,NULL,NULL),
 (16,17,'Administrar Usuários','0','1','2004-12-11 00:00:00','/gerencial/ConsultarUsuario.do',20,'1',NULL,NULL,NULL),
 (17,NULL,'Administrar','0','1','2004-12-11 00:00:00','/ExibirMensagemGenerica.do?titulo=Manter Tabelas&tela=ManterTabelas&funcionalidade=17',17,'1','pages/images/menu/SistFr02BotAdministrar01.gif','pages/images/menu/SistFr02BotAdministrar02.gif','78'),
 (18,17,'Opções de Avaliação','0','1','2004-12-11 00:00:00','/gerencial/ConsultarTipoAvaliacaoResposta.do',28,'1',NULL,NULL,NULL),
 (19,17,'Sub-Órgãos','0','1','2004-12-11 00:00:00','/gerencial/ConsultarSubOrgao.do',23,'1',NULL,NULL,NULL),
 (20,17,'Assuntos de Mensagens','0','1','2004-12-11 00:00:00','/gerencial/ConsultarTipoAssunto.do',30,'1',NULL,NULL,NULL),
 (21,17,'Tipos de Mensagens','0','1','2004-12-11 00:00:00','/gerencial/ConsultarTipoMensagem.do',29,'1',NULL,NULL,NULL),
 (22,17,'Configurar Ouvidoria','0','1','2004-12-11 00:00:00','/gerencial/AtualizarConfiguracoesOrgao.do?action=exibir',22,'1',NULL,NULL,NULL),
 (23,47,'Consultar Usuários por Perfil','0','1','2004-12-11 00:00:00','/gerencial/ConsultaUsuarioPerfil.do',23,'1',NULL,NULL,NULL),
 (24,16,'Atribuir Acessos a Usuários','0','0','2004-12-11 00:00:00','about:blank',24,'1',NULL,NULL,NULL),
 (25,16,'Definir Especialistas','0','0','2004-12-11 00:00:00','about:blank',25,'1',NULL,NULL,NULL),
 (26,NULL,'Indicadores','0','1','2004-12-11 00:00:00','/ExibirMensagemGenerica.do?titulo=Relatórios&tela=Relatorios&funcionalidade=26',3,'1','pages/images/menu/SistFr02BotIndicadores01.gif','pages/images/menu/SistFr02BotIndicadores02.gif','80'),
 (27,26,'Internos','0','1','2004-12-11 00:00:00','/gerencial/IndicadoresInternos.do',31,'1',NULL,NULL,NULL),
 (28,26,'Externos','0','1','2004-12-11 00:00:00','/gerencial/IndicadoresExternos.do',32,'1',NULL,NULL,NULL),
 (29,26,'Fórmula','0','1','2004-12-11 00:00:00','/gerencial/IndicadoresFormula.do',33,'1',NULL,NULL,NULL),
 (30,26,'Histórico','0','1','2004-12-11 00:00:00','/gerencial/IndicadoresHistorico.do',34,'1',NULL,NULL,NULL),
 (31,11,'Mostrar Mensagens','0','0','2004-12-11 00:00:00','about:blank',31,'1',NULL,NULL,NULL),
 (32,8,'Fazer Acionamento','0','1','2004-12-11 00:00:00','/acionamento/EnviarMensagemWeb.do',321,'0',NULL,NULL,NULL),
 (33,17,'Autorizar Scripts','0','1','2004-12-11 00:00:00','/gerencial/ConsultarScriptsPend.do',24,'1',NULL,NULL,NULL),
 (34,8,'Outros Canais de Comunicação','0','1','2005-02-10 18:46:00','/ExibirMensagemGenerica.do?titulo=Outros Canais de Comunicação&tela=CanaisComunicacao',322,'1',NULL,NULL,NULL),
 (35,26,'Gerar Boletim','0','0','2004-12-11 00:00:00','/aprendizado/GerarBoletim.do',35,'1',NULL,NULL,NULL),
 (36,31,'Responder Mensagem','0','0','2004-12-11 00:00:00','about:blank',36,'1',NULL,NULL,NULL),
 (37,13,'Consultar Banco de Respostas','0','0','2004-12-11 00:00:00','about:blank',0,'1',NULL,NULL,NULL),
 (38,17,'Manter Scripts','0','1','2004-12-11 00:00:00','/gerencial/ConsultaScriptAtualizacao.do',25,'1',NULL,NULL,NULL),
 (39,17,'Manter Banco de Soluções','0','1','2004-12-11 00:00:00','/gerencial/ConsultaSolucaoAtualizacao.do',27,'1',NULL,NULL,NULL),
 (40,17,'Manter Órgãos','0','1','2004-12-11 00:00:00','/gerencial/AdministrarOrgao.do',21,'1',NULL,NULL,NULL),
 (41,17,'Parâmetros Gerais','0','1','2004-12-11 00:00:00','/gerencial/ExibirParametrosGerais.do',41,'1',NULL,NULL,NULL),
 (42,48,'Administrar Boletins','0','1','2004-12-11 00:00:00','/aprendizado/ConsultarBoletim.do',351,'1',NULL,NULL,NULL),
 (43,49,'Listar Respostas','0','1','2004-12-20 00:00:00','/andamento/ConsultarAcionamentoResposta.do',42,'1',NULL,NULL,NULL),
 (44,36,'Reclassificar Acionamento - Tipo de Assunto','0','1','2004-12-21 00:00:00','about:blank',44,'1',NULL,NULL,NULL),
 (45,47,'Andamento da Solução','0','1','2004-12-22 00:00:00','/andamento/consultarAndamentoSolucao.do',13,'1',NULL,NULL,NULL),
 (46,52,'Mapa do Site','0','1','2005-01-07 10:33:10','/ExibirMensagemGenerica.do?titulo=Mapa do Site&tela=MapaSiteLogado',46,'1',NULL,NULL,NULL),
 (47,NULL,'Consultar','0','1','2005-01-11 18:13:00','/ExibirMensagemGenerica.do?titulo=Consultar&tela=Consultar&funcionalidade=47',1,'1','pages/images/menu/SistFr02BotConsultar01.gif','pages/images/menu/SistFr02BotConsultar02.gif','67'),
 (48,NULL,'Boletins','0','1','2005-01-11 19:17:00','/ExibirMensagemGenerica.do?titulo=Boletins&tela=Boletins&funcionalidade=48',4,'1','pages/images/menu/SistFr02BotBoletins01.gif','pages/images/menu/SistFr02BotBoletins02.gif','58'),
 (49,NULL,'Atendimento','0','1','2005-01-11 18:13:00','/ExibirMensagemGenerica.do?titulo=Atendimento&tela=Atendimentor&funcionalidade=49',5,'1','pages/images/menu/SistFr02BotAtendimento01.gif','pages/images/menu/SistFr02BotAtendimento02.gif','84'),
 (51,48,'Listas de E-mails','0','1','2005-01-11 18:13:00','/aprendizado/ConsultarGruposEmail.do',353,'1',NULL,NULL,NULL),
 (52,NULL,'Ajuda','0','1','2005-01-17 15:00:00','/ExibirMensagemGenerica.do?titulo=Ajuda&tela=AjudaLogado',400,'1','pages/images/menu/SistFr02BotAjuda01.gif','pages/images/menu/SistFr02BotAjuda02.gif','46'),
 (53,52,'Tópicos da Ajuda','0','1','2005-01-17 15:00:00','/Ajuda.do',410,'1',NULL,NULL,NULL),
 (54,17,'Visualizar Scripts','0','1','2005-04-04 11:00:00','/gerencial/VisualizaScriptAtualizacao.do?editar=N',26,'1',NULL,NULL,NULL),
 (55,17,'Autorizar Solução','0','1','2008-03-24 19:30:21','/gerencial/ConsultarSolucoesPendentes.do',42,'1',NULL,NULL,NULL),
 (56,36,'Reclassificar Acionamento - Tipo de Mensagem','0','1','2008-12-11 18:44:42','about:blank',44,'1',NULL,NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `funcionalidade` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`funcionario`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`funcionario`;
CREATE TABLE  `sistema_ouvidoria`.`funcionario` (
  `COD_FUNC` int(11) NOT NULL AUTO_INCREMENT,
  `COD_PERFIL` int(11) NOT NULL DEFAULT '0',
  `NOM_FUNC` varchar(60) DEFAULT NULL,
  `DSC_LOGIN` varchar(11) NOT NULL DEFAULT '',
  `DSC_SENHA` varchar(32) NOT NULL DEFAULT '',
  `COD_INSTIT` int(11) DEFAULT NULL,
  `IND_SITUA` char(1) NOT NULL DEFAULT '',
  `DSC_MOTIVO` text,
  `QTD_TENT_LOGIN` int(11) DEFAULT NULL,
  `DAT_BLOQUEIO_LOGIN` datetime DEFAULT NULL,
  `consultor` char(2) DEFAULT '0',
  `DSC_EMAIL` varchar(112) DEFAULT NULL,
  PRIMARY KEY (`COD_FUNC`),
  UNIQUE KEY `UQ_INST_LOGIN` (`COD_INSTIT`,`DSC_LOGIN`),
  KEY `COD_PERFIL` (`COD_PERFIL`),
  KEY `FK_FUNC_ALOCADO` (`COD_INSTIT`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`COD_PERFIL`) REFERENCES `perfil` (`COD_PERFIL`),
  CONSTRAINT `funcionario_ibfk_2` FOREIGN KEY (`COD_INSTIT`) REFERENCES `instituicao` (`COD_INSTIT`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`funcionario`
--

/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
LOCK TABLES `funcionario` WRITE;
INSERT INTO `sistema_ouvidoria`.`funcionario` VALUES  (1,7,'Administrador do Sistema','11111111111','60DC1A8060B62E1B',42,'A','',0,NULL,'0','');
UNLOCK TABLES;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`funcionarioassunto`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`funcionarioassunto`;
CREATE TABLE  `sistema_ouvidoria`.`funcionarioassunto` (
  `COD_ASSNTO` int(11) NOT NULL DEFAULT '0',
  `COD_FUNC` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`COD_ASSNTO`,`COD_FUNC`),
  KEY `COD_FUNC` (`COD_FUNC`),
  CONSTRAINT `funcionarioassunto_ibfk_1` FOREIGN KEY (`COD_ASSNTO`) REFERENCES `assunto` (`COD_ASSNTO`),
  CONSTRAINT `funcionarioassunto_ibfk_2` FOREIGN KEY (`COD_FUNC`) REFERENCES `funcionario` (`COD_FUNC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`funcionarioassunto`
--

/*!40000 ALTER TABLE `funcionarioassunto` DISABLE KEYS */;
LOCK TABLES `funcionarioassunto` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `funcionarioassunto` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`funcionarioinstituicao`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`funcionarioinstituicao`;
CREATE TABLE  `sistema_ouvidoria`.`funcionarioinstituicao` (
  `COD_FUNC` int(11) NOT NULL DEFAULT '0',
  `COD_INSTIT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`COD_FUNC`,`COD_INSTIT`),
  KEY `COD_INSTIT` (`COD_INSTIT`),
  CONSTRAINT `funcionarioinstituicao_ibfk_1` FOREIGN KEY (`COD_INSTIT`) REFERENCES `instituicao` (`COD_INSTIT`),
  CONSTRAINT `funcionarioinstituicao_ibfk_2` FOREIGN KEY (`COD_FUNC`) REFERENCES `funcionario` (`COD_FUNC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`funcionarioinstituicao`
--

/*!40000 ALTER TABLE `funcionarioinstituicao` DISABLE KEYS */;
LOCK TABLES `funcionarioinstituicao` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `funcionarioinstituicao` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`funcionariolocalocorrencia`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`funcionariolocalocorrencia`;
CREATE TABLE  `sistema_ouvidoria`.`funcionariolocalocorrencia` (
  `COD_LOCAL_OCORR` int(11) NOT NULL DEFAULT '0',
  `COD_FUNC` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`COD_LOCAL_OCORR`,`COD_FUNC`),
  KEY `COD_FUNC` (`COD_FUNC`),
  CONSTRAINT `funcionariolocalocorrencia_ibfk_1` FOREIGN KEY (`COD_FUNC`) REFERENCES `funcionario` (`COD_FUNC`),
  CONSTRAINT `funcionariolocalocorrencia_ibfk_2` FOREIGN KEY (`COD_LOCAL_OCORR`) REFERENCES `localidadeocorrencia` (`COD_LOCAL_OCORR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`funcionariolocalocorrencia`
--

/*!40000 ALTER TABLE `funcionariolocalocorrencia` DISABLE KEYS */;
LOCK TABLES `funcionariolocalocorrencia` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `funcionariolocalocorrencia` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`funcionariotipomensagem`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`funcionariotipomensagem`;
CREATE TABLE  `sistema_ouvidoria`.`funcionariotipomensagem` (
  `COD_FUNC` int(11) NOT NULL DEFAULT '0',
  `COD_TIPO_MSG` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`COD_FUNC`,`COD_TIPO_MSG`),
  KEY `COD_TIPO_MSG` (`COD_TIPO_MSG`),
  CONSTRAINT `funcionariotipomensagem_ibfk_1` FOREIGN KEY (`COD_TIPO_MSG`) REFERENCES `tipomensagem` (`COD_TIPO_MSG`),
  CONSTRAINT `funcionariotipomensagem_ibfk_2` FOREIGN KEY (`COD_FUNC`) REFERENCES `funcionario` (`COD_FUNC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`funcionariotipomensagem`
--

/*!40000 ALTER TABLE `funcionariotipomensagem` DISABLE KEYS */;
LOCK TABLES `funcionariotipomensagem` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `funcionariotipomensagem` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`gruposemail`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`gruposemail`;
CREATE TABLE  `sistema_ouvidoria`.`gruposemail` (
  `COD_GRUPO` int(11) NOT NULL AUTO_INCREMENT,
  `DSC_GRUPO` varchar(30) DEFAULT NULL,
  `DSC_LISTA_EMAIL` text,
  `DAT_CADAST` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DAT_UPDATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `COD_INSTIT` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`COD_GRUPO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`gruposemail`
--

/*!40000 ALTER TABLE `gruposemail` DISABLE KEYS */;
LOCK TABLES `gruposemail` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `gruposemail` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`historico`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`historico`;
CREATE TABLE  `sistema_ouvidoria`.`historico` (
  `COD_HISTOR` int(11) NOT NULL AUTO_INCREMENT,
  `COD_FUNC` int(11) NOT NULL DEFAULT '0',
  `COD_FUNCIO` int(11) NOT NULL DEFAULT '0',
  `COD_ACNMNT` int(11) DEFAULT NULL,
  `DAT_CADAST` datetime DEFAULT NULL,
  PRIMARY KEY (`COD_HISTOR`),
  KEY `COD_FUNCIO` (`COD_FUNCIO`),
  KEY `COD_FUNC` (`COD_FUNC`),
  KEY `COD_ACNMNT` (`COD_ACNMNT`),
  CONSTRAINT `historico_ibfk_1` FOREIGN KEY (`COD_FUNCIO`) REFERENCES `funcionalidade` (`COD_FUNCIO`),
  CONSTRAINT `historico_ibfk_2` FOREIGN KEY (`COD_FUNC`) REFERENCES `funcionario` (`COD_FUNC`),
  CONSTRAINT `historico_ibfk_3` FOREIGN KEY (`COD_ACNMNT`) REFERENCES `acionamento` (`COD_ACNMNT`)
) ENGINE=InnoDB AUTO_INCREMENT=7538 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`historico`
--

/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
LOCK TABLES `historico` WRITE;
INSERT INTO `sistema_ouvidoria`.`historico` VALUES  (7537,1,2,NULL,'2011-11-09 19:44:35');
UNLOCK TABLES;
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`historicoenvio`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`historicoenvio`;
CREATE TABLE  `sistema_ouvidoria`.`historicoenvio` (
  `cod_histen` int(11) NOT NULL AUTO_INCREMENT,
  `dat_envio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dsc_lista_email` text NOT NULL,
  `cod_func` int(11) NOT NULL DEFAULT '0',
  `cod_bolet` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_histen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`historicoenvio`
--

/*!40000 ALTER TABLE `historicoenvio` DISABLE KEYS */;
LOCK TABLES `historicoenvio` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `historicoenvio` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`informacoesconsultaacionamento`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`informacoesconsultaacionamento`;
CREATE TABLE  `sistema_ouvidoria`.`informacoesconsultaacionamento` (
  `COD_CONS_ACNMNT` int(11) NOT NULL AUTO_INCREMENT,
  `COD_ACESSO` varchar(32) NOT NULL DEFAULT '',
  `DSC_PERG` varchar(100) DEFAULT NULL,
  `DSC_RESP` varchar(100) DEFAULT NULL,
  `NUM_TENT_PERG` int(11) DEFAULT NULL,
  `NUM_TENT_COD` int(11) DEFAULT NULL,
  PRIMARY KEY (`COD_CONS_ACNMNT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`informacoesconsultaacionamento`
--

/*!40000 ALTER TABLE `informacoesconsultaacionamento` DISABLE KEYS */;
LOCK TABLES `informacoesconsultaacionamento` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `informacoesconsultaacionamento` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`informacoesrecebimentoresposta`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`informacoesrecebimentoresposta`;
CREATE TABLE  `sistema_ouvidoria`.`informacoesrecebimentoresposta` (
  `COD_MEIO_RECEB_RESP` int(11) NOT NULL AUTO_INCREMENT,
  `COD_UF` int(11) DEFAULT NULL,
  `COD_PAIS` int(11) NOT NULL DEFAULT '0',
  `DSC_LOGRAD` text,
  `DSC_COMPL_LOGRAD` text,
  `NUM_LOGRAD` varchar(16) DEFAULT NULL,
  `DSC_BAIRRO` varchar(112) DEFAULT NULL,
  `DSC_CIDADE` varchar(112) DEFAULT NULL,
  `NUM_CEP` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`COD_MEIO_RECEB_RESP`),
  KEY `COD_UF` (`COD_UF`),
  KEY `COD_PAIS` (`COD_PAIS`),
  CONSTRAINT `informacoesrecebimentoresposta_ibfk_1` FOREIGN KEY (`COD_UF`) REFERENCES `uf` (`COD_UF`),
  CONSTRAINT `informacoesrecebimentoresposta_ibfk_2` FOREIGN KEY (`COD_PAIS`) REFERENCES `pais` (`COD_PAIS`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`informacoesrecebimentoresposta`
--

/*!40000 ALTER TABLE `informacoesrecebimentoresposta` DISABLE KEYS */;
LOCK TABLES `informacoesrecebimentoresposta` WRITE;
INSERT INTO `sistema_ouvidoria`.`informacoesrecebimentoresposta` VALUES  (1,7,1,'D43A71E1B83C5521777FF4DC4CEFD11255B9738B2CD99AB78644DE108468AA7F','645936868A07B7A3','645936868A07B7A3','B8623B780175C60C43923FE22256B8C6','AA245894327FE79B645936868A07B7A3','06EB995609817F02645936868A07B7A3'),
 (2,27,1,'B8A346245A5707D43A548B93F471136A4522BF5178C1CFF6','175425AB8B16671BAAD0E3FB0F5F8D56C385C101F9E7AC95','7A55752E535CDFE2','6D61B52A496BA8C9DD289073010358EC','57EE6416151636203EADE95000619E19','1974EBED6EB99E99645936868A07B7A3'),
 (3,24,1,'ABEDD6FCC888A7AC11327BDA134DA1665D16B2871C280557','0136D2EADE8B4640645936868A07B7A3','0A891A82231E04AC','7D122308E2644222','02DACE22611F74826DA2CC1E84E4C9E9','FD01D75415DFD24E645936868A07B7A3'),
 (4,7,1,'78D8B37200BB5483508F312AA3F811DE','E8D98E4E676CAC7C','C3E41043374DF79E','AF4D737E750E9668233CB06C3A00F632','AA245894327FE79B645936868A07B7A3','5A0D4FB08B979D0A645936868A07B7A3'),
 (5,17,1,'82FF277BE926CBF6B9C2BBAD8BCE29815A5EC163A5E9364B','74728B5189842160645936868A07B7A3','A7A49315A8FBEAE3','83D9F039233D569C573A9C143F8B777F','E712BEBD13C445C8','2F230375098D6666645936868A07B7A3');
UNLOCK TABLES;
/*!40000 ALTER TABLE `informacoesrecebimentoresposta` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`instituicao`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`instituicao`;
CREATE TABLE  `sistema_ouvidoria`.`instituicao` (
  `COD_INSTIT` int(11) NOT NULL AUTO_INCREMENT,
  `COD_CONFIG` int(11) DEFAULT NULL,
  `COD_INSTIT_PAI` int(11) DEFAULT NULL,
  `DSC_INSTIT` varchar(50) DEFAULT NULL,
  `DAT_CADAST` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DAT_INI_OPER` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DAT_FIM_OPER` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DAT_INI_CADAST` datetime DEFAULT NULL,
  `DAT_FIM_CADAST` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DAT_INI_ACNMNT` datetime DEFAULT NULL,
  `DAT_FIM_ACNMNT` datetime DEFAULT NULL,
  `DAT_INI_CONS_RESP` datetime DEFAULT NULL,
  `DAT_FIM_CONS_RESP` datetime DEFAULT NULL,
  `NOM_RESPON` varchar(50) DEFAULT NULL,
  `NUM_TEL_RESPON` varchar(15) DEFAULT NULL,
  `IND_TIPO_INSTIT` char(1) DEFAULT NULL,
  `DAT_INI_VIGENC` datetime DEFAULT NULL,
  `DAT_FIM_VIGENC` datetime DEFAULT NULL,
  `IND_SITUA_ORGAO` char(1) DEFAULT NULL,
  `DSC_DDI_RESPON` char(3) DEFAULT NULL,
  `DSC_DDD_RESPON` char(2) DEFAULT NULL,
  PRIMARY KEY (`COD_INSTIT`),
  KEY `COD_CONFIG` (`COD_CONFIG`),
  KEY `COD_INSTIT_PAI` (`COD_INSTIT_PAI`),
  CONSTRAINT `instituicao_ibfk_1` FOREIGN KEY (`COD_CONFIG`) REFERENCES `configuracoes` (`COD_CONFIG`),
  CONSTRAINT `instituicao_ibfk_2` FOREIGN KEY (`COD_INSTIT_PAI`) REFERENCES `instituicao` (`COD_INSTIT`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 10240 kB; ("COD_INSTIT_PAI") REFER "ouvidoria/i';

--
-- Dumping data for table `sistema_ouvidoria`.`instituicao`
--

/*!40000 ALTER TABLE `instituicao` DISABLE KEYS */;
LOCK TABLES `instituicao` WRITE;
INSERT INTO `sistema_ouvidoria`.`instituicao` VALUES  (42,12,NULL,'Administração das Ouvidorias','2005-02-18 13:01:44','2005-02-01 00:00:00','2100-12-01 00:00:00','2005-01-01 00:00:00','2005-01-10 00:00:00','2005-02-10 00:00:00','2100-11-30 00:00:00','2005-02-10 00:00:00','2100-12-31 00:00:00','SERPRO - Regional Rio de Janeiro','(21) 2159 3300','0',NULL,NULL,'A',NULL,NULL),
 (44,NULL,42,'Ouvidoria Interna','2006-09-05 10:58:01','2005-02-01 00:00:00','2100-12-01 00:00:00','2005-01-01 00:00:00','2005-01-10 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,'1','2006-09-04 08:00:00',NULL,NULL,NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `instituicao` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`localidadeocorrencia`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`localidadeocorrencia`;
CREATE TABLE  `sistema_ouvidoria`.`localidadeocorrencia` (
  `COD_LOCAL_OCORR` int(11) NOT NULL AUTO_INCREMENT,
  `DSC_LOCAL_OCORR` varchar(200) DEFAULT NULL,
  `DAT_CADAST` datetime DEFAULT NULL,
  `COD_INSTIT` int(11) DEFAULT NULL,
  `DAT_VIGENC` datetime DEFAULT NULL,
  PRIMARY KEY (`COD_LOCAL_OCORR`),
  KEY `COD_INSTIT` (`COD_INSTIT`),
  CONSTRAINT `localidadeocorrencia_ibfk_1` FOREIGN KEY (`COD_INSTIT`) REFERENCES `instituicao` (`COD_INSTIT`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`localidadeocorrencia`
--

/*!40000 ALTER TABLE `localidadeocorrencia` DISABLE KEYS */;
LOCK TABLES `localidadeocorrencia` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `localidadeocorrencia` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`meioenvioresposta`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`meioenvioresposta`;
CREATE TABLE  `sistema_ouvidoria`.`meioenvioresposta` (
  `COD_MEIO_ENV_RESP` int(11) NOT NULL AUTO_INCREMENT,
  `DSC_MEIO_ENV_RESP` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`COD_MEIO_ENV_RESP`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`meioenvioresposta`
--

/*!40000 ALTER TABLE `meioenvioresposta` DISABLE KEYS */;
LOCK TABLES `meioenvioresposta` WRITE;
INSERT INTO `sistema_ouvidoria`.`meioenvioresposta` VALUES  (1,'E-Mail'),
 (2,'Internet'),
 (3,'Carta'),
 (4,'Telefone'),
 (5,'Fax');
UNLOCK TABLES;
/*!40000 ALTER TABLE `meioenvioresposta` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`meioenviorespostaorgao`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`meioenviorespostaorgao`;
CREATE TABLE  `sistema_ouvidoria`.`meioenviorespostaorgao` (
  `COD_MEIO_ENVIO_RESP_ORGAO` int(11) NOT NULL AUTO_INCREMENT,
  `COD_MEIO_ENV_RESP` int(11) NOT NULL DEFAULT '0',
  `COD_INSTIT` int(11) NOT NULL DEFAULT '0',
  `DAT_VIGENC` datetime DEFAULT NULL,
  PRIMARY KEY (`COD_MEIO_ENVIO_RESP_ORGAO`),
  KEY `COD_MEIO_ENV_RESP` (`COD_MEIO_ENV_RESP`),
  KEY `COD_INSTIT` (`COD_INSTIT`),
  CONSTRAINT `meioenviorespostaorgao_ibfk_1` FOREIGN KEY (`COD_MEIO_ENV_RESP`) REFERENCES `meioenvioresposta` (`COD_MEIO_ENV_RESP`),
  CONSTRAINT `meioenviorespostaorgao_ibfk_2` FOREIGN KEY (`COD_INSTIT`) REFERENCES `instituicao` (`COD_INSTIT`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`meioenviorespostaorgao`
--

/*!40000 ALTER TABLE `meioenviorespostaorgao` DISABLE KEYS */;
LOCK TABLES `meioenviorespostaorgao` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `meioenviorespostaorgao` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`meiorecebimento`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`meiorecebimento`;
CREATE TABLE  `sistema_ouvidoria`.`meiorecebimento` (
  `COD_MEIO_RECEB` int(11) NOT NULL AUTO_INCREMENT,
  `DSC_MEIO_RECEB` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`COD_MEIO_RECEB`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`meiorecebimento`
--

/*!40000 ALTER TABLE `meiorecebimento` DISABLE KEYS */;
LOCK TABLES `meiorecebimento` WRITE;
INSERT INTO `sistema_ouvidoria`.`meiorecebimento` VALUES  (1,'E-Mail'),
 (2,'Telefone'),
 (3,'Carta'),
 (4,'Contato Pessoal'),
 (6,'Internet');
UNLOCK TABLES;
/*!40000 ALTER TABLE `meiorecebimento` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`mensagem`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`mensagem`;
CREATE TABLE  `sistema_ouvidoria`.`mensagem` (
  `COD_MSG` int(11) NOT NULL AUTO_INCREMENT,
  `COD_ASSNTO` int(11) NOT NULL DEFAULT '0',
  `DSC_TEXTO` text,
  `NOM_ARQ_ANEXO` varchar(208) DEFAULT NULL,
  `NOM_ARQ_MSG_DIGIT` varchar(208) DEFAULT NULL,
  `COD_TIPO_MSG` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`COD_MSG`),
  KEY `COD_ASSNTO` (`COD_ASSNTO`),
  KEY `COD_TIPO_MSG` (`COD_TIPO_MSG`),
  CONSTRAINT `mensagem_ibfk_1` FOREIGN KEY (`COD_ASSNTO`) REFERENCES `assunto` (`COD_ASSNTO`),
  CONSTRAINT `mensagem_ibfk_2` FOREIGN KEY (`COD_TIPO_MSG`) REFERENCES `tipomensagem` (`COD_TIPO_MSG`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`mensagem`
--

/*!40000 ALTER TABLE `mensagem` DISABLE KEYS */;
LOCK TABLES `mensagem` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `mensagem` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`pais`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`pais`;
CREATE TABLE  `sistema_ouvidoria`.`pais` (
  `COD_PAIS` int(11) NOT NULL AUTO_INCREMENT,
  `DSC_PAIS` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`COD_PAIS`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`pais`
--

/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
LOCK TABLES `pais` WRITE;
INSERT INTO `sistema_ouvidoria`.`pais` VALUES  (1,'Brasil'),
 (2,'Afeganistão'),
 (3,'África do Sul'),
 (4,'Albânia'),
 (5,'Alemanha'),
 (6,'Algéria'),
 (7,'Andorra'),
 (8,'Angola'),
 (9,'Anguilla'),
 (10,'Antártida'),
 (11,'Antígua e Barbuda'),
 (12,'Antilhas Holandesas'),
 (13,'Arábia Saudita'),
 (14,'Argentina'),
 (15,'Armênia'),
 (16,'Aruba'),
 (17,'Austrália'),
 (18,'Áustria'),
 (19,'Azerbaijão'),
 (20,'Bahamas'),
 (21,'Bahrain'),
 (22,'Bangladesh'),
 (23,'Barbados'),
 (24,'Belarus'),
 (25,'Bélgica'),
 (26,'Belize'),
 (27,'Benin'),
 (28,'Bermuda'),
 (29,'Bolívia'),
 (30,'Butão'),
 (31,'Bósnia-Herzegovina'),
 (32,'Botsuana'),
 (33,'Brunei'),
 (34,'Bulgária'),
 (35,'Burkina Faso'),
 (36,'Burundi'),
 (37,'Cabo Verde'),
 (38,'Camboja'),
 (39,'Camarões'),
 (40,'Canadá'),
 (41,'Casaquistão'),
 (42,'Chade'),
 (43,'Chile'),
 (44,'China'),
 (45,'Chipre'),
 (46,'Colômbia'),
 (47,'Camarões'),
 (48,'Congo'),
 (49,'Coréia do Norte'),
 (50,'Coréia do Sul'),
 (51,'Costa do Marfim'),
 (52,'Costa Rica'),
 (53,'Croácia'),
 (54,'Cuba'),
 (55,'Dinamarca'),
 (56,'Djibouti'),
 (57,'Dominica'),
 (58,'El Salvador'),
 (59,'Equador'),
 (60,'Egito'),
 (61,'Emirados Árabes Unidos'),
 (62,'Eritréia'),
 (63,'Espanha'),
 (64,'Eslováquia'),
 (65,'Eslovênia'),
 (66,'Estados Unidos da América'),
 (67,'Estônia'),
 (68,'Etiópia'),
 (69,'Fiji'),
 (70,'Filipinas'),
 (71,'Finlândia'),
 (72,'França'),
 (73,'Gabão'),
 (74,'Gâmbia'),
 (75,'Gana'),
 (76,'Geórgia'),
 (77,'Gibraltar'),
 (78,'Granada'),
 (79,'Grécia'),
 (80,'Groelândia'),
 (81,'Guadalupe'),
 (82,'Guam'),
 (83,'Guatemala'),
 (84,'Guiana Francesa'),
 (85,'Guiné'),
 (86,'Guiné-Bissau'),
 (87,'Guiné Equatorial'),
 (88,'Guiana'),
 (89,'Haiti'),
 (90,'Honduras'),
 (91,'Hong Kong'),
 (92,'Hungria'),
 (93,'Iêmen'),
 (94,'Ilhas Cayman'),
 (95,'Ilhas Cook'),
 (96,'Ilhas Falkland'),
 (97,'Ilhas Faroe'),
 (98,'Ilhas Heard e McDonald'),
 (99,'Ilhas Mariana do Norte'),
 (100,'Ilhas Marshall'),
 (101,'Ilhas S.Georgia S.Sandwich'),
 (102,'Ilhas Svalbard e Jan Mayen'),
 (103,'Ilhas Turks e Caicos'),
 (104,'Ilhas Virgens'),
 (105,'Ilhas Virgens Britânicas'),
 (106,'Índia'),
 (107,'Indonésia'),
 (108,'Islândia'),
 (109,'Irã'),
 (110,'Iraque'),
 (111,'Irlanda'),
 (112,'Israel'),
 (113,'Itália'),
 (114,'Iugoslávia (ex-)'),
 (115,'Jamaica'),
 (116,'Japão'),
 (117,'Jordânia'),
 (118,'Kiribati'),
 (119,'Kuwait'),
 (120,'Laos'),
 (121,'Letônia'),
 (122,'Lesoto'),
 (123,'Líbano'),
 (124,'Libéria'),
 (125,'Líbia'),
 (126,'Liechtenstein'),
 (127,'Lituânia'),
 (128,'Luxemburgo'),
 (129,'Macau'),
 (130,'Macedônia, antiga Iugoslávia'),
 (131,'Madagascar'),
 (132,'Malásia'),
 (133,'Malaui'),
 (134,'Maldivas'),
 (135,'Mali'),
 (136,'Malta'),
 (137,'Marrocos'),
 (138,'Martinica'),
 (139,'Maurício'),
 (140,'Mauritânia'),
 (141,'Mayotte'),
 (142,'México'),
 (143,'Micronésia'),
 (144,'Moçambique'),
 (145,'Moldova'),
 (146,'Mônaco'),
 (147,'Mongólia'),
 (148,'Montserrat'),
 (149,'Myanmar'),
 (150,'Nambia'),
 (151,'Nauru'),
 (152,'Nepal'),
 (153,'Holanda'),
 (154,'Nicarágua'),
 (155,'Niger'),
 (156,'Nigéria'),
 (157,'Niue'),
 (158,'Noruega'),
 (159,'Nova Caledônia'),
 (160,'Nova Zelândia'),
 (161,'Oman'),
 (162,'Palau'),
 (163,'Panamá'),
 (164,'Papua Nova Guiné'),
 (165,'Paquistão'),
 (166,'Paraguai'),
 (167,'Peru'),
 (168,'Polinésia Francesa'),
 (169,'Polônia'),
 (170,'Porto Rico'),
 (171,'Portugal'),
 (172,'Qatar'),
 (173,'Quênia'),
 (174,'Reino Unido'),
 (175,'República Centro-Africana'),
 (176,'República Dominicana'),
 (177,'República Tcheca'),
 (178,'Reunio'),
 (179,'Romênia'),
 (180,'Ruanda'),
 (181,'Rússia'),
 (182,'Saara Ocidental'),
 (183,'São Vicente e Granada'),
 (184,'Samoa'),
 (185,'Samoa Americana'),
 (186,'San Marino'),
 (187,'Santa Helena'),
 (188,'Santa Lúcia'),
 (189,'São Tomé e Príncipe'),
 (190,'Senegal'),
 (191,'Serra Leoa'),
 (192,'Seychelles'),
 (193,'Singapura'),
 (194,'Síria'),
 (195,'Somália'),
 (196,'Sri Lanka'),
 (197,'Sudão'),
 (198,'Suriname'),
 (199,'Suazilândia'),
 (200,'Suécia'),
 (201,'Suíça'),
 (202,'Tailândia'),
 (203,'Taiwan'),
 (204,'Tanzânia'),
 (205,'Timor Leste'),
 (206,'Togo'),
 (207,'Tokelau'),
 (208,'Tonga'),
 (209,'Trinidad e Tobago'),
 (210,'Tunísia'),
 (211,'Turcomenistão'),
 (212,'Turquia'),
 (213,'Tuvalu'),
 (214,'Ucrânia'),
 (215,'Uganda'),
 (216,'Uruguai'),
 (217,'Usbequistão'),
 (218,'Vanuatu'),
 (219,'Vaticano'),
 (220,'Venezuela'),
 (221,'Vietnã'),
 (222,'Zaire'),
 (223,'Zâmbia'),
 (224,'Zimbábue'),
 (225,'Territórios Franceses do Sul'),
 (226,'Ilhas costeiras dos EUA'),
 (227,'Territ Marít Índias Britânicas'),
 (228,'Ilhas Cocos'),
 (229,'Kyrgyztan'),
 (230,'Tajikistão'),
 (231,'Ilha Pitcairn'),
 (232,'Ilhas Natal'),
 (233,'Ilha Bouvet'),
 (235,'Saint Kitts e Nevis'),
 (236,'St. Pierre e Miquelon'),
 (237,'Ilha Norfolk'),
 (238,'Ilhas Wallis e Futuna');
UNLOCK TABLES;
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`parametrosgerais`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`parametrosgerais`;
CREATE TABLE  `sistema_ouvidoria`.`parametrosgerais` (
  `COD_PARAM` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_SERV_SMTP` varchar(100) NOT NULL DEFAULT '',
  `NOM_DIR_ARQ_ANEXOS` varchar(254) DEFAULT NULL,
  `QTD_TEMPO_ACESSO_BASE_FUNC` int(11) DEFAULT NULL,
  `DSC_EXTENS_MSG_DIG_PERM` varchar(254) DEFAULT NULL,
  `DSC_EXTENS_ARQ_ANEXO_NAO_PERM` varchar(254) DEFAULT NULL,
  `NUM_LIMITE_COLS_INDICA` int(11) NOT NULL DEFAULT '0',
  `QTD_MAX_FALHA_LOGIN` int(11) DEFAULT NULL,
  `QTD_TEMPO_BLOQ_LOGIN` int(11) DEFAULT NULL,
  PRIMARY KEY (`COD_PARAM`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`parametrosgerais`
--

/*!40000 ALTER TABLE `parametrosgerais` DISABLE KEYS */;
LOCK TABLES `parametrosgerais` WRITE;
INSERT INTO `sistema_ouvidoria`.`parametrosgerais` VALUES  (1,'161.148.173.216','/opt/websites/sistemaouvidoria/',9999,'jpg;gif;jpeg','doc;pdf;odt',30,5,66);
UNLOCK TABLES;
/*!40000 ALTER TABLE `parametrosgerais` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`perfil`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`perfil`;
CREATE TABLE  `sistema_ouvidoria`.`perfil` (
  `COD_PERFIL` int(11) NOT NULL AUTO_INCREMENT,
  `DSC_PERFIL` varchar(30) DEFAULT NULL,
  `DAT_CADAST` datetime DEFAULT NULL,
  `COD_FUNCIO` int(11) DEFAULT NULL,
  PRIMARY KEY (`COD_PERFIL`),
  KEY `FK_perfil` (`COD_FUNCIO`),
  CONSTRAINT `perfil_ibfk_1` FOREIGN KEY (`COD_FUNCIO`) REFERENCES `funcionalidade` (`COD_FUNCIO`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`perfil`
--

/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
LOCK TABLES `perfil` WRITE;
INSERT INTO `sistema_ouvidoria`.`perfil` VALUES  (1,'Ouvidor Geral','2004-12-09 18:06:04',45),
 (2,'Ouvidor Assistente','2004-12-09 18:06:04',45),
 (3,'Gestor do Sistema','2004-12-09 18:06:04',16),
 (4,'Gestor do Conteúdo','2004-12-09 18:06:04',38),
 (5,'Especialista','2004-12-09 18:06:04',11),
 (6,'Atendente','2004-12-09 18:06:04',7),
 (7,'Administrador','2004-12-09 18:06:04',40);
UNLOCK TABLES;
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`protocolo`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`protocolo`;
CREATE TABLE  `sistema_ouvidoria`.`protocolo` (
  `COD_PROTOC` int(11) NOT NULL AUTO_INCREMENT,
  `NUM_PROTOC` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`COD_PROTOC`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`protocolo`
--

/*!40000 ALTER TABLE `protocolo` DISABLE KEYS */;
LOCK TABLES `protocolo` WRITE;
INSERT INTO `sistema_ouvidoria`.`protocolo` VALUES  (1,100891);
UNLOCK TABLES;
/*!40000 ALTER TABLE `protocolo` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`respostaacionamento`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`respostaacionamento`;
CREATE TABLE  `sistema_ouvidoria`.`respostaacionamento` (
  `COD_RESP` int(11) NOT NULL AUTO_INCREMENT,
  `COD_TIPO_AVAL_RESP` int(11) DEFAULT NULL,
  `DSC_TITULO_RESP_ACNMNT` text,
  `DSC_RESP_ACNMNT` text,
  `DAT_RESP_ACNMNT` datetime DEFAULT NULL,
  `DAT_ENVIO_RESP` datetime DEFAULT NULL,
  `COD_SOLUC` int(11) DEFAULT NULL,
  PRIMARY KEY (`COD_RESP`),
  KEY `COD_TIPO_AVAL_RESP` (`COD_TIPO_AVAL_RESP`),
  KEY `FK_RESPOSTA_SOLUCAO` (`COD_SOLUC`),
  CONSTRAINT `FK_RESPOSTA_SOLUCAO` FOREIGN KEY (`COD_SOLUC`) REFERENCES `solucao` (`COD_SOLUC`),
  CONSTRAINT `respostaacionamento_ibfk_1` FOREIGN KEY (`COD_TIPO_AVAL_RESP`) REFERENCES `tipoavaliacaoresposta` (`COD_TIPO_AVAL_RESP`)
) ENGINE=InnoDB AUTO_INCREMENT=850 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`respostaacionamento`
--

/*!40000 ALTER TABLE `respostaacionamento` DISABLE KEYS */;
LOCK TABLES `respostaacionamento` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `respostaacionamento` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`script`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`script`;
CREATE TABLE  `sistema_ouvidoria`.`script` (
  `COD_SCRIPT` int(11) NOT NULL AUTO_INCREMENT,
  `COD_ASSNTO` int(11) NOT NULL DEFAULT '0',
  `COD_ESTADO_SCRIPT` int(11) NOT NULL DEFAULT '0',
  `DSC_TITULO_SCRIPT` varchar(100) NOT NULL DEFAULT '',
  `DSC_SCRIPT` text,
  `DAT_CADAST` datetime DEFAULT NULL,
  `DSC_OBSERV` text,
  PRIMARY KEY (`COD_SCRIPT`),
  KEY `COD_ASSNTO` (`COD_ASSNTO`),
  KEY `COD_ESTADO_SCRIPT` (`COD_ESTADO_SCRIPT`),
  CONSTRAINT `script_ibfk_1` FOREIGN KEY (`COD_ASSNTO`) REFERENCES `assunto` (`COD_ASSNTO`),
  CONSTRAINT `script_ibfk_2` FOREIGN KEY (`COD_ESTADO_SCRIPT`) REFERENCES `estadoscript` (`COD_ESTADO_SCRIPT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`script`
--

/*!40000 ALTER TABLE `script` DISABLE KEYS */;
LOCK TABLES `script` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `script` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`solucao`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`solucao`;
CREATE TABLE  `sistema_ouvidoria`.`solucao` (
  `COD_SOLUC` int(11) NOT NULL AUTO_INCREMENT,
  `COD_FUNC` int(11) DEFAULT NULL,
  `COD_ASSNTO` int(11) NOT NULL DEFAULT '0',
  `DSC_TITULO` varchar(100) NOT NULL DEFAULT '',
  `DSC_SOLUC` text NOT NULL,
  `DAT_CADAST` datetime DEFAULT NULL,
  `DAT_VIGENC` datetime DEFAULT NULL,
  `COD_ESTADO_SOLUCAO` int(11) DEFAULT NULL,
  `DSC_OBSERVACAO` text,
  PRIMARY KEY (`COD_SOLUC`),
  KEY `COD_FUNC` (`COD_FUNC`),
  KEY `COD_ASSNTO` (`COD_ASSNTO`),
  KEY `FK_ESTADO_SOLUCAO` (`COD_ESTADO_SOLUCAO`),
  CONSTRAINT `FK_ESTADO_SOLUCAO` FOREIGN KEY (`COD_ESTADO_SOLUCAO`) REFERENCES `estadosolucao` (`COD_ESTADO_SOLUCAO`),
  CONSTRAINT `solucao_ibfk_1` FOREIGN KEY (`COD_FUNC`) REFERENCES `funcionario` (`COD_FUNC`),
  CONSTRAINT `solucao_ibfk_2` FOREIGN KEY (`COD_ASSNTO`) REFERENCES `assunto` (`COD_ASSNTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`solucao`
--

/*!40000 ALTER TABLE `solucao` DISABLE KEYS */;
LOCK TABLES `solucao` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `solucao` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`tipoacionador`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`tipoacionador`;
CREATE TABLE  `sistema_ouvidoria`.`tipoacionador` (
  `COD_TIPO_ACNDOR` int(11) NOT NULL AUTO_INCREMENT,
  `DSC_TIPO_ACNDOR` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`COD_TIPO_ACNDOR`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`tipoacionador`
--

/*!40000 ALTER TABLE `tipoacionador` DISABLE KEYS */;
LOCK TABLES `tipoacionador` WRITE;
INSERT INTO `sistema_ouvidoria`.`tipoacionador` VALUES  (1,'Anônimo'),
 (2,'Pessoa Física'),
 (3,'Pessoa Jurídica'),
 (4,'Funcionário');
UNLOCK TABLES;
/*!40000 ALTER TABLE `tipoacionador` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`tipoacionadororgao`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`tipoacionadororgao`;
CREATE TABLE  `sistema_ouvidoria`.`tipoacionadororgao` (
  `COD_TIPO_ACNDOR_ORGAO` int(11) NOT NULL AUTO_INCREMENT,
  `COD_TIPO_ACNDOR` int(11) NOT NULL DEFAULT '0',
  `COD_INSTIT` int(11) NOT NULL DEFAULT '0',
  `DAT_VIGENC` datetime DEFAULT NULL,
  PRIMARY KEY (`COD_TIPO_ACNDOR_ORGAO`),
  KEY `COD_MEIO_ENV_RESP` (`COD_TIPO_ACNDOR`),
  KEY `COD_INSTIT` (`COD_INSTIT`),
  CONSTRAINT `tipoacionadororgao_ibfk_1` FOREIGN KEY (`COD_TIPO_ACNDOR`) REFERENCES `tipoacionador` (`COD_TIPO_ACNDOR`),
  CONSTRAINT `tipoacionadororgao_ibfk_2` FOREIGN KEY (`COD_INSTIT`) REFERENCES `instituicao` (`COD_INSTIT`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`tipoacionadororgao`
--

/*!40000 ALTER TABLE `tipoacionadororgao` DISABLE KEYS */;
LOCK TABLES `tipoacionadororgao` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `tipoacionadororgao` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`tipoavaliacaoresposta`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`tipoavaliacaoresposta`;
CREATE TABLE  `sistema_ouvidoria`.`tipoavaliacaoresposta` (
  `COD_TIPO_AVAL_RESP` int(11) NOT NULL AUTO_INCREMENT,
  `DSC_TIPO_AVAL_RESP` varchar(150) DEFAULT NULL,
  `DAT_CADAST` datetime DEFAULT NULL,
  `COD_INSTIT` int(11) DEFAULT NULL,
  `DAT_VIGENC` datetime DEFAULT NULL,
  `IND_TIPO_AVAL_RESP` char(1) DEFAULT NULL,
  PRIMARY KEY (`COD_TIPO_AVAL_RESP`),
  KEY `FK_tipoavaliacaoresposta_1` (`COD_INSTIT`),
  CONSTRAINT `tipoavaliacaoresposta_ibfk_1` FOREIGN KEY (`COD_INSTIT`) REFERENCES `instituicao` (`COD_INSTIT`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`tipoavaliacaoresposta`
--

/*!40000 ALTER TABLE `tipoavaliacaoresposta` DISABLE KEYS */;
LOCK TABLES `tipoavaliacaoresposta` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `tipoavaliacaoresposta` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`tipomensagem`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`tipomensagem`;
CREATE TABLE  `sistema_ouvidoria`.`tipomensagem` (
  `COD_TIPO_MSG` int(11) NOT NULL AUTO_INCREMENT,
  `QTD_PRAZO_INT` int(11) DEFAULT NULL,
  `DSC_TIPO_MSG` varchar(50) DEFAULT NULL,
  `QTD_PRAZO_EXT` int(11) DEFAULT NULL,
  `DAT_CADAST` datetime DEFAULT NULL,
  `DAT_VIGENC` datetime DEFAULT NULL,
  `COD_INSTIT` int(11) DEFAULT NULL,
  `DSC_DETALH_TIPO_MSG` text,
  PRIMARY KEY (`COD_TIPO_MSG`),
  KEY `FK_TIPOMENSAGEM` (`COD_INSTIT`),
  CONSTRAINT `tipomensagem_ibfk_1` FOREIGN KEY (`COD_INSTIT`) REFERENCES `instituicao` (`COD_INSTIT`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`tipomensagem`
--

/*!40000 ALTER TABLE `tipomensagem` DISABLE KEYS */;
LOCK TABLES `tipomensagem` WRITE;
INSERT INTO `sistema_ouvidoria`.`tipomensagem` VALUES  (1,NULL,'Elogio',NULL,'2006-09-05 12:31:56',NULL,44,'É uma mensagem com a demonstração de apreço, reconhecimento ou satisfação para com o serviço recebido.'),
 (2,NULL,'Pedido',NULL,'2006-09-05 12:32:38',NULL,44,'Solicitação de um serviço da Empresa.'),
 (3,NULL,'Reclamação',NULL,'2006-09-05 12:33:28',NULL,44,'Manifestação de desagrado ou protesto pelos serviços prestados pela Empresa; reinvindicação.'),
 (4,NULL,'Sugestão',NULL,'2006-09-05 12:34:30',NULL,44,'Fazer uma proposta, encaminhar uma idéia para apreciação/contribuição na melhoria dos processos da Empresa.');
UNLOCK TABLES;
/*!40000 ALTER TABLE `tipomensagem` ENABLE KEYS */;


--
-- Definition of table `sistema_ouvidoria`.`uf`
--

DROP TABLE IF EXISTS `sistema_ouvidoria`.`uf`;
CREATE TABLE  `sistema_ouvidoria`.`uf` (
  `COD_UF` int(11) NOT NULL AUTO_INCREMENT,
  `DSC_SIGLA_UF` char(2) DEFAULT NULL,
  `DSC_UF` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`COD_UF`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_ouvidoria`.`uf`
--

/*!40000 ALTER TABLE `uf` DISABLE KEYS */;
LOCK TABLES `uf` WRITE;
INSERT INTO `sistema_ouvidoria`.`uf` VALUES  (1,'AC','Acre'),
 (2,'AL','Alagoas'),
 (3,'AM','Amazonas'),
 (4,'AP','Amapá'),
 (5,'BA','Bahia'),
 (6,'CE','Ceará'),
 (7,'DF','Distrito Federal'),
 (9,'ES','Espírito Santo'),
 (10,'GO','Goiás'),
 (11,'MA','Maranhão'),
 (12,'MG','Minas Gerais'),
 (13,'MS','Mato Grosso do Sul'),
 (14,'MT','Mato Grosso'),
 (15,'PA','Pará'),
 (16,'PB','Paraíba'),
 (17,'PE','Pernambuco'),
 (18,'PI','Piauí'),
 (19,'PR','Paraná'),
 (20,'RJ','Rio de Janeiro'),
 (21,'RN','Rio Grande do Norte'),
 (22,'RO','Rondônia'),
 (23,'RR','Roraima'),
 (24,'RS','Rio Grande do Sul'),
 (25,'SC','Santa Catarina'),
 (26,'SE','Sergipe'),
 (27,'SP','São Paulo'),
 (28,'TO','Tocantins');
UNLOCK TABLES;
/*!40000 ALTER TABLE `uf` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
