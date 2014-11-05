-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 05-Nov-2014 às 19:05
-- Versão do servidor: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sistemarh`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `advertencias`
--

CREATE TABLE IF NOT EXISTS `advertencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `motivo` varchar(45) DEFAULT NULL,
  `data_advertencia` varchar(45) DEFAULT NULL,
  `anexo` varchar(255) DEFAULT NULL,
  `caminho` varchar(45) DEFAULT NULL,
  `obs` text,
  `funcionario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_advertencias_funcionarios1_idx` (`funcionario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atestados`
--

CREATE TABLE IF NOT EXISTS `atestados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(45) DEFAULT NULL,
  `data_atestado` date DEFAULT NULL,
  `dias_afastamento` varchar(45) DEFAULT NULL,
  `anexo` varchar(45) DEFAULT NULL,
  `caminho` varchar(45) DEFAULT NULL,
  `funcionario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_atestados_funcionarios1_idx` (`funcionario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresas`
--

CREATE TABLE IF NOT EXISTS `empresas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_fantasia` varchar(45) DEFAULT NULL,
  `razao_social` varchar(45) DEFAULT NULL,
  `cnpj` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcao_funcionarios`
--

CREATE TABLE IF NOT EXISTS `funcao_funcionarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE IF NOT EXISTS `funcionarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `rg` varchar(45) DEFAULT NULL,
  `cep` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `pispasep` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `data_admissao` date DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `estado_civil` varchar(45) DEFAULT NULL,
  `data_nascimento` varchar(45) DEFAULT NULL,
  `foto` varchar(245) DEFAULT NULL,
  `caminho` varchar(45) DEFAULT NULL,
  `empresa_id` int(11) NOT NULL,
  `funcao_funcionario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_funcionarios_empresas_idx` (`empresa_id`),
  KEY `fk_funcionarios_funcao_funcionarios1_idx` (`funcao_funcionario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `senpensoes`
--

CREATE TABLE IF NOT EXISTS `senpensoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `motivo` varchar(45) DEFAULT NULL,
  `data_suspensao` date DEFAULT NULL,
  `qtd` varchar(45) DEFAULT NULL,
  `anexo` varchar(45) DEFAULT NULL,
  `caminho` varchar(45) DEFAULT NULL,
  `obs` text,
  `funcionario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_senpensoes_funcionarios1_idx` (`funcionario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `advertencias`
--
ALTER TABLE `advertencias`
  ADD CONSTRAINT `fk_advertencias_funcionarios1` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `atestados`
--
ALTER TABLE `atestados`
  ADD CONSTRAINT `fk_atestados_funcionarios1` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `fk_funcionarios_empresas` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_funcionarios_funcao_funcionarios1` FOREIGN KEY (`funcao_funcionario_id`) REFERENCES `funcao_funcionarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `senpensoes`
--
ALTER TABLE `senpensoes`
  ADD CONSTRAINT `fk_senpensoes_funcionarios1` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
