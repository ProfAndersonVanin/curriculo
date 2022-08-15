-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Ago-2022 às 14:53
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto`
--
CREATE DATABASE IF NOT EXISTS `projeto` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `projeto`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `competencias`
--

CREATE TABLE `competencias` (
  `id_comp` int(11) NOT NULL,
  `competencia` varchar(255) DEFAULT NULL,
  `id_curr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `competencias`
--

INSERT INTO `competencias` (`id_comp`, `competencia`, `id_curr`) VALUES
(1, 'Lider de Equipe', 4),
(2, 'Lider de Equipe', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `curriculo`
--

CREATE TABLE `curriculo` (
  `id_curr` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `curso` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `curriculo`
--

INSERT INTO `curriculo` (`id_curr`, `nome`, `email`, `telefone`, `curso`) VALUES
(1, 'ANDERSON VANIN', 'teste@email.com', '11999998888', 'Teste de curso'),
(3, 'ALUNO DA SILVA', 'aluno@email.com', '(11)9 8765-432', 'ARQUITETURA'),
(4, 'CICLANO DA SILVA', 'ciclano@email.com', '(11)9 8765-432', 'ARQUITETURA'),
(5, 'Julia', 'julia@email.com', '(11)9 9999-999', 'dfasdfasdf'),
(6, 'Criatura', 'criatura@email.com', '(11)8 9745-642', 'ENGENHARIA DE SOFTWARE');

-- --------------------------------------------------------

--
-- Estrutura da tabela `educacao`
--

CREATE TABLE `educacao` (
  `id_educ` int(11) NOT NULL,
  `instituicao` varchar(255) DEFAULT NULL,
  `curso` varchar(255) DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `fim` date DEFAULT NULL,
  `id_curr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `educacao`
--

INSERT INTO `educacao` (`id_educ`, `instituicao`, `curso`, `inicio`, `fim`, `id_curr`) VALUES
(1, 'Josephina Hernandez', 'Ensino Fundamental', '2018-02-01', '2019-12-31', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `experiencia`
--

CREATE TABLE `experiencia` (
  `id_exp` int(11) NOT NULL,
  `empresa` varchar(255) DEFAULT NULL,
  `ocupacao` varchar(255) DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `fim` date DEFAULT NULL,
  `id_curr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `habilidades`
--

CREATE TABLE `habilidades` (
  `id_hab` int(11) NOT NULL,
  `habilidade` varchar(255) DEFAULT NULL,
  `id_curr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `habilidades`
--

INSERT INTO `habilidades` (`id_hab`, `habilidade`, `id_curr`) VALUES
(1, 'bom de papo', 3),
(2, 'COMUNICATIVO', 4),
(3, 'espontâneo', 4),
(4, 'Ser muito bom no que faz', 4),
(5, 'Torço para o palmeiras', 5),
(6, 'jhdsaljkhfjhasdjlfh', 5),
(7, 'SoU MUITO felIZ', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `cpf`, `tipo`) VALUES
(1, 'ANDERSON VANIN', 'teste@email.com', '81dc9bdb52d04dc20036dbd8313ed055', '111.222.333-44', 1),
(2, 'ALUNO DA SILVA', 'aluno@email.com', '81dc9bdb52d04dc20036dbd8313ed055', '111.222.333-44', 2),
(3, 'CICLANO DA SILVA', 'ciclano@email.com', '81dc9bdb52d04dc20036dbd8313ed055', '111.222.333-44', 2),
(4, 'MARIAZINHA DA SILVA', 'maria@email.com', '81dc9bdb52d04dc20036dbd8313ed055', '111.222.333-44', 2),
(5, 'Julia', 'julia@email.com', '81dc9bdb52d04dc20036dbd8313ed055', '111.222.333-44', 2),
(6, 'aluno etec', 'aluno@email.com', 'd93591bdf7860e1e4ee2fca799911215', '111.222.333-44', 2),
(7, 'Criatura', 'criatura@email.com', '81dc9bdb52d04dc20036dbd8313ed055', '111.222.333-44', 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `competencias`
--
ALTER TABLE `competencias`
  ADD PRIMARY KEY (`id_comp`),
  ADD KEY `id_curr` (`id_curr`);

--
-- Índices para tabela `curriculo`
--
ALTER TABLE `curriculo`
  ADD PRIMARY KEY (`id_curr`);

--
-- Índices para tabela `educacao`
--
ALTER TABLE `educacao`
  ADD PRIMARY KEY (`id_educ`),
  ADD KEY `id_curr` (`id_curr`);

--
-- Índices para tabela `experiencia`
--
ALTER TABLE `experiencia`
  ADD PRIMARY KEY (`id_exp`),
  ADD KEY `id_curr` (`id_curr`);

--
-- Índices para tabela `habilidades`
--
ALTER TABLE `habilidades`
  ADD PRIMARY KEY (`id_hab`),
  ADD KEY `id_curr` (`id_curr`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `competencias`
--
ALTER TABLE `competencias`
  MODIFY `id_comp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `curriculo`
--
ALTER TABLE `curriculo`
  MODIFY `id_curr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `educacao`
--
ALTER TABLE `educacao`
  MODIFY `id_educ` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `experiencia`
--
ALTER TABLE `experiencia`
  MODIFY `id_exp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `habilidades`
--
ALTER TABLE `habilidades`
  MODIFY `id_hab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `competencias`
--
ALTER TABLE `competencias`
  ADD CONSTRAINT `competencias_ibfk_1` FOREIGN KEY (`id_curr`) REFERENCES `curriculo` (`id_curr`);

--
-- Limitadores para a tabela `educacao`
--
ALTER TABLE `educacao`
  ADD CONSTRAINT `educacao_ibfk_1` FOREIGN KEY (`id_curr`) REFERENCES `curriculo` (`id_curr`);

--
-- Limitadores para a tabela `experiencia`
--
ALTER TABLE `experiencia`
  ADD CONSTRAINT `experiencia_ibfk_1` FOREIGN KEY (`id_curr`) REFERENCES `curriculo` (`id_curr`);

--
-- Limitadores para a tabela `habilidades`
--
ALTER TABLE `habilidades`
  ADD CONSTRAINT `habilidades_ibfk_1` FOREIGN KEY (`id_curr`) REFERENCES `curriculo` (`id_curr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
