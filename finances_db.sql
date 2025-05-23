-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://wwwmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/05/2025 às 00:26
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `finances_db`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_type` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_type`, `user_id`) VALUES
(1, 'food', NULL, NULL),
(2, 'transport', NULL, NULL),
(3, 'health', NULL, NULL),
(4, 'education', NULL, NULL),
(5, 'clothing', NULL, NULL),
(19, 'pets', NULL, 3),
(33, 'Plantas', NULL, 3),
(35, 'Planta', NULL, 3),
(36, 'Tinta', NULL, 3),
(37, 'Cabelo', NULL, 3),
(38, 'Sound', NULL, 3),
(39, 'Salário', NULL, 3),
(40, 'Mercado', NULL, 3),
(41, 'Moradia', NULL, 3),
(42, 'Lazer', NULL, 3),
(43, 'Transporte', NULL, 3),
(44, 'Freelance', NULL, 3),
(45, 'Saúde', NULL, 3),
(46, 'Internet', NULL, 3),
(47, 'Salário', NULL, 22),
(48, 'Mercado', NULL, 22),
(49, 'Moradia', NULL, 22),
(50, 'Lazer', NULL, 22),
(51, 'Transporte', NULL, 22),
(52, 'Freelance', NULL, 22),
(53, 'Saúde', NULL, 22),
(54, 'Internet', NULL, 22),
(55, 'Salário', NULL, 23),
(56, 'Mercado', NULL, 23),
(57, 'Moradia', NULL, 23),
(58, 'Lazer', NULL, 23),
(59, 'Transporte', NULL, 23),
(60, 'Freelance', NULL, 23),
(61, 'Saúde', NULL, 23),
(62, 'Internet', NULL, 23),
(63, 'Teclado', NULL, 23),
(64, 'Salário', NULL, 25),
(65, 'Mercado', NULL, 25),
(66, 'Moradia', NULL, 25),
(67, 'Lazer', NULL, 25),
(68, 'Transporte', NULL, 25),
(69, 'Freelance', NULL, 25),
(70, 'Saúde', NULL, 25),
(71, 'Internet', NULL, 25),
(72, 'Salário', NULL, 26),
(73, 'Mercado', NULL, 26),
(74, 'Moradia', NULL, 26),
(75, 'Lazer', NULL, 26),
(76, 'Transporte', NULL, 26),
(77, 'Freelance', NULL, 26),
(78, 'Saúde', NULL, 26),
(79, 'Internet', NULL, 26),
(80, 'Salário', NULL, 27),
(81, 'Mercado', NULL, 27),
(82, 'Moradia', NULL, 27),
(83, 'Lazer', NULL, 27),
(84, 'Transporte', NULL, 27),
(85, 'Freelance', NULL, 27),
(86, 'Saúde', NULL, 27),
(87, 'Internet', NULL, 27),
(88, 'salary', NULL, NULL),
(89, 'groceries', NULL, NULL),
(90, 'utilities', NULL, NULL),
(91, 'fitness', NULL, NULL),
(92, 'bonus', NULL, NULL),
(93, 'entertainment', NULL, NULL),
(94, 'coffee', NULL, NULL),
(95, 'internet', NULL, NULL),
(96, 'books', NULL, NULL),
(97, 'transport', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `recurring_bills`
--

CREATE TABLE `recurring_bills` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `due_date` date NOT NULL,
  `remind_days_before` int(11) DEFAULT 1,
  `remind_time` time DEFAULT '09:00:00',
  `repeat_interval` enum('monthly','weekly','yearly') DEFAULT 'monthly',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `recurring_bills`
--

INSERT INTO `recurring_bills` (`id`, `user_id`, `title`, `due_date`, `remind_days_before`, `remind_time`, `repeat_interval`, `created_at`) VALUES
(7, 25, 'Rent', '2025-05-23', 1, '09:00:00', 'monthly', '2025-05-19 19:08:09'),
(8, 25, 'teste toast', '2025-05-20', 1, '15:42:00', 'monthly', '2025-05-19 19:19:20'),
(9, 25, 'teste toast', '2025-05-20', 1, '16:22:00', 'monthly', '2025-05-19 19:20:07'),
(10, 25, 'teste toast', '2025-05-20', 1, '16:23:00', 'monthly', '2025-05-19 19:22:33'),
(11, 26, 'Internet', '2025-05-20', 1, '09:00:00', 'monthly', '2025-05-19 23:21:17'),
(12, 27, 'Internet', '2025-05-26', 1, '09:00:00', 'monthly', '2025-05-21 16:58:39');

-- --------------------------------------------------------

--
-- Estrutura para tabela `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` enum('income','expense') NOT NULL,
  `date` date NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `category_id`, `amount`, `type`, `date`, `description`) VALUES
(1, 3, 39, 3000.00, '', '2024-01-05', 'Salário'),
(2, 3, 40, 450.00, '', '2024-01-10', 'Mercado'),
(3, 3, 41, 1200.00, '', '2024-01-15', 'Aluguel'),
(4, 3, 42, 150.00, '', '2024-02-02', 'Restaurante'),
(5, 3, 43, 100.00, '', '2024-02-10', 'Transporte'),
(6, 3, 44, 800.00, '', '2024-02-25', 'Freelance'),
(7, 3, 42, 50.00, '', '2024-03-01', 'Cinema'),
(8, 3, 3, 120.00, '', '2024-03-05', 'Academia'),
(9, 3, 45, 70.00, '', '2024-03-10', 'Farmácia'),
(10, 3, 46, 100.00, '', '2024-03-15', 'Internet'),
(11, 3, 39, 3000.00, '', '2024-01-05', 'Salário'),
(12, 3, 40, 450.00, '', '2024-01-10', 'Mercado'),
(13, 3, 41, 1200.00, '', '2024-01-15', 'Aluguel'),
(14, 3, 42, 150.00, '', '2024-02-02', 'Restaurante'),
(15, 3, 43, 100.00, '', '2024-02-10', 'Transporte'),
(16, 3, 44, 800.00, '', '2024-02-25', 'Freelance'),
(17, 3, 42, 50.00, '', '2024-03-01', 'Cinema'),
(18, 3, 45, 120.00, '', '2024-03-05', 'Academia'),
(19, 3, 39, 3000.00, '', '2024-01-05', 'Salário'),
(20, 3, 40, 450.00, '', '2024-01-10', 'Mercado'),
(21, 3, 41, 1200.00, '', '2024-01-15', 'Aluguel'),
(22, 3, 42, 150.00, '', '2024-02-02', 'Restaurante'),
(23, 3, 43, 100.00, '', '2024-02-10', 'Transporte'),
(24, 3, 44, 800.00, '', '2024-02-25', 'Freelance'),
(25, 3, 42, 50.00, '', '2024-03-01', 'Cinema'),
(26, 3, 45, 120.00, '', '2024-03-05', 'Academia'),
(27, 3, 45, 70.00, '', '2024-03-10', 'Farmácia'),
(28, 3, 46, 100.00, '', '2024-03-15', 'Internet'),
(29, 3, 39, 3000.00, '', '2024-01-05', 'Salário'),
(30, 3, 40, 450.00, '', '2024-01-10', 'Mercado'),
(31, 3, 41, 1200.00, '', '2024-01-15', 'Aluguel'),
(32, 3, 42, 150.00, '', '2024-02-02', 'Restaurante'),
(33, 3, 43, 100.00, '', '2024-02-10', 'Transporte'),
(34, 3, 44, 800.00, '', '2024-02-25', 'Freelance'),
(35, 3, 42, 50.00, '', '2024-03-01', 'Cinema'),
(36, 3, 45, 120.00, '', '2024-03-05', 'Academia'),
(37, 3, 45, 70.00, '', '2024-03-10', 'Farmácia'),
(38, 3, 46, 100.00, '', '2024-03-15', 'Internet'),
(39, 3, 39, 3000.00, '', '2024-01-05', 'Salário'),
(40, 3, 40, 450.00, '', '2024-01-10', 'Mercado'),
(41, 3, 41, 1200.00, '', '2024-01-15', 'Aluguel'),
(42, 3, 42, 150.00, '', '2024-02-02', 'Restaurante'),
(43, 3, 43, 100.00, '', '2024-02-10', 'Transporte'),
(44, 3, 44, 800.00, '', '2024-02-25', 'Freelance'),
(45, 3, 42, 50.00, '', '2024-03-01', 'Cinema'),
(46, 3, 45, 120.00, '', '2024-03-05', 'Academia'),
(47, 3, 45, 70.00, '', '2024-03-10', 'Farmácia'),
(48, 3, 46, 100.00, '', '2024-03-15', 'Internet'),
(49, 3, 2, 3000.00, '', '2024-01-05', 'Alalala'),
(50, 3, 5, 450.00, '', '2024-01-10', 'a'),
(51, 3, 1, 1200.00, '', '2024-01-15', 'a'),
(52, 3, 19, 150.00, '', '2024-02-02', 'a'),
(53, 3, 36, 100.00, '', '2024-02-10', 'a'),
(54, 3, 2, 800.00, '', '2024-02-25', 'a'),
(55, 3, 5, 50.00, '', '2024-03-01', 'a'),
(56, 3, 2, 120.00, '', '2024-03-05', 'a'),
(57, 3, 2, 70.00, '', '2024-03-10', 'a'),
(58, 3, 19, 100.00, '', '2024-03-15', 'a'),
(59, 22, 47, 3000.00, '', '2024-01-05', 'Salário'),
(60, 22, 48, 450.00, '', '2024-01-10', 'Mercado'),
(61, 22, 49, 1200.00, '', '2024-01-15', 'Aluguel'),
(62, 22, 50, 150.00, '', '2024-02-02', 'Restaurante'),
(63, 22, 51, 100.00, '', '2024-02-10', 'Transporte'),
(64, 22, 52, 800.00, '', '2024-02-25', 'Freelance'),
(65, 22, 50, 50.00, '', '2024-03-01', 'Cinema'),
(66, 22, 53, 120.00, '', '2024-03-05', 'Academia'),
(67, 22, 53, 70.00, '', '2024-03-10', 'Farmácia'),
(68, 22, 54, 100.00, '', '2024-03-15', 'Internet'),
(69, 23, 55, 3000.00, '', '2024-01-05', 'Salário'),
(70, 23, 56, 450.00, '', '2024-01-10', 'Mercado'),
(71, 23, 57, 1200.00, '', '2024-01-15', 'Aluguel'),
(72, 23, 58, 150.00, '', '2024-02-02', 'Restaurante'),
(73, 23, 59, 100.00, '', '2024-02-10', 'Transporte'),
(74, 23, 60, 800.00, '', '2024-02-25', 'Freelance'),
(75, 23, 58, 50.00, '', '2024-03-01', 'Cinema'),
(76, 23, 61, 120.00, '', '2024-03-05', 'Academia'),
(77, 23, 61, 70.00, '', '2024-03-10', 'Farmácia'),
(78, 23, 62, 100.00, '', '2024-03-15', 'Internet'),
(79, 23, 4, 22500.00, '', '2025-05-19', 'Curso DEV'),
(80, 23, 4, 2161.00, '', '2025-05-19', 'Curso DEV2'),
(81, 23, 63, 1333.00, '', '2025-05-19', 'Teclado Gamer'),
(82, 23, 4, 350000.00, '', '2025-05-19', 'Curso DEV Caríssimo'),
(83, 23, 58, 300000.00, '', '2024-03-14', 'Curso DEV Caríssississimo'),
(84, 23, 55, 30000.00, '', '2025-05-18', 'Transaction test'),
(85, 25, 64, 3000.00, '', '2024-01-05', 'Salário'),
(86, 25, 65, 450.00, '', '2024-01-10', 'Mercado'),
(87, 25, 66, 1200.00, '', '2024-01-15', 'Aluguel'),
(88, 25, 67, 150.00, '', '2024-02-02', 'Restaurante'),
(89, 25, 68, 100.00, '', '2024-02-10', 'Transporte'),
(90, 25, 69, 800.00, '', '2024-02-25', 'Freelance'),
(91, 25, 67, 50.00, '', '2024-03-01', 'Cinema'),
(92, 25, 70, 120.00, '', '2024-03-05', 'Academia'),
(93, 25, 70, 70.00, '', '2024-03-10', 'Farmácia'),
(94, 25, 71, 100.00, '', '2024-03-15', 'Internet'),
(95, 25, 1, 20.00, '', '2025-05-19', 'Sache'),
(96, 26, 72, 3000.00, '', '2024-01-05', 'Salário'),
(97, 26, 73, 450.00, '', '2024-01-10', 'Mercado'),
(98, 26, 74, 1200.00, '', '2024-01-15', 'Aluguel'),
(99, 26, 75, 150.00, '', '2024-02-02', 'Restaurante'),
(100, 26, 76, 100.00, '', '2024-02-10', 'Transporte'),
(101, 26, 77, 800.00, '', '2024-02-25', 'Freelance'),
(102, 26, 75, 50.00, '', '2024-03-01', 'Cinema'),
(103, 26, 78, 120.00, '', '2024-03-05', 'Academia'),
(104, 26, 78, 70.00, '', '2024-03-10', 'Farmácia'),
(105, 26, 79, 100.00, '', '2024-03-15', 'Internet'),
(166, 27, 88, 2500.00, 'income', '2024-01-10', 'Freelance payment'),
(167, 27, 89, 320.00, 'expense', '2024-01-17', 'Grocery shopping'),
(168, 27, 90, 150.00, 'expense', '2024-01-24', 'Electricity bill'),
(169, 27, 91, 100.00, 'expense', '2024-01-31', 'Gym membership'),
(170, 27, 92, 500.00, 'income', '2024-02-07', 'Freelance bonus'),
(171, 27, 93, 40.00, 'expense', '2024-02-14', 'Movie ticket'),
(172, 27, 94, 25.00, 'expense', '2024-02-21', 'Coffee'),
(173, 27, 95, 120.00, 'expense', '2024-02-28', 'Internet bill'),
(174, 27, 96, 70.00, 'expense', '2024-03-06', 'Book purchase'),
(175, 27, 2, 60.00, 'expense', '2024-03-13', 'Bus pass'),
(176, 28, 88, 2500.00, 'income', '2024-01-10', 'Freelance payment'),
(177, 28, 89, 320.00, 'expense', '2024-01-17', 'Grocery shopping'),
(178, 28, 90, 150.00, 'expense', '2024-01-24', 'Electricity bill'),
(179, 28, 91, 100.00, 'expense', '2024-01-31', 'Gym membership'),
(180, 28, 92, 500.00, 'income', '2024-02-07', 'Freelance bonus'),
(181, 28, 93, 40.00, 'expense', '2024-02-14', 'Movie ticket'),
(182, 28, 94, 25.00, 'expense', '2024-02-21', 'Coffee'),
(183, 28, 95, 120.00, 'expense', '2024-02-28', 'Internet bill'),
(184, 28, 96, 70.00, 'expense', '2024-03-06', 'Book purchase'),
(185, 28, 2, 60.00, 'expense', '2024-03-13', 'Bus pass'),
(186, 3, 88, 2500.00, 'income', '2024-01-10', 'Freelance payment'),
(187, 3, 89, 320.00, 'expense', '2024-01-17', 'Grocery shopping'),
(188, 3, 90, 150.00, 'expense', '2024-01-24', 'Electricity bill'),
(189, 3, 91, 100.00, 'expense', '2024-01-31', 'Gym membership'),
(190, 3, 92, 500.00, 'income', '2024-02-07', 'Freelance bonus'),
(191, 3, 93, 40.00, 'expense', '2024-02-14', 'Movie ticket'),
(192, 3, 94, 25.00, 'expense', '2024-02-21', 'Coffee'),
(193, 3, 95, 120.00, 'expense', '2024-02-28', 'Internet bill'),
(194, 3, 96, 70.00, 'expense', '2024-03-06', 'Book purchase'),
(195, 3, 2, 60.00, 'expense', '2024-03-13', 'Bus pass'),
(196, 29, 88, 2500.00, 'income', '2024-01-10', 'Freelance payment'),
(197, 29, 89, 320.00, 'expense', '2024-01-17', 'Grocery shopping'),
(198, 29, 90, 150.00, 'expense', '2024-01-24', 'Electricity bill'),
(199, 29, 91, 100.00, 'expense', '2024-01-31', 'Gym membership'),
(200, 29, 92, 500.00, 'income', '2024-02-07', 'Freelance bonus'),
(201, 29, 93, 40.00, 'expense', '2024-02-14', 'Movie ticket'),
(202, 29, 94, 25.00, 'expense', '2024-02-21', 'Coffee'),
(203, 29, 95, 120.00, 'expense', '2024-02-28', 'Internet bill'),
(204, 29, 96, 70.00, 'expense', '2024-03-06', 'Book purchase'),
(205, 29, 2, 60.00, 'expense', '2024-03-13', 'Bus pass'),
(206, 62, 88, 2500.00, 'income', '2024-01-10', 'Freelance payment'),
(207, 62, 89, 320.00, 'expense', '2024-01-17', 'Grocery shopping'),
(208, 62, 90, 150.00, 'expense', '2024-01-24', 'Electricity bill'),
(209, 62, 91, 100.00, 'expense', '2024-01-31', 'Gym membership'),
(210, 62, 92, 500.00, 'income', '2024-02-07', 'Freelance bonus'),
(211, 62, 93, 40.00, 'expense', '2024-02-14', 'Movie ticket'),
(212, 62, 94, 25.00, 'expense', '2024-02-21', 'Coffee'),
(213, 62, 95, 120.00, 'expense', '2024-02-28', 'Internet bill'),
(214, 62, 96, 70.00, 'expense', '2024-03-06', 'Book purchase'),
(215, 62, 2, 60.00, 'expense', '2024-03-13', 'Bus pass');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `firebase_uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `finantial_objective` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `cpf`, `email`, `phone`, `firebase_uid`, `created_at`, `finantial_objective`) VALUES
(2, 'Sem nome', NULL, 'test@test.com', NULL, 'EBYtZknPDmNb02abSJcUzWIK70Q2', '2025-05-05 18:58:07.895262', NULL),
(3, 'Vini', NULL, 'test1@test.com', NULL, 'L1o4qCO5BQWsG1XjiKHBDaCL9Ar1', '2025-05-06 12:31:30.383828', 'adsd'),
(4, 'Teste ', NULL, 'test2@test.com', NULL, 'AfM97iAe2Cal0E5mCE2FnNrNmWl2', '2025-05-06 13:05:07.555729', NULL),
(7, 'dfg', NULL, 'test4@test4.com', NULL, 'KZ8KeKpdCKV0uXOTkYepVCzWUJu2', '2025-05-07 17:40:20.891196', 'dfg'),
(10, 'Test', NULL, 'test5@test.com', NULL, 'jxiOzNaih6WU49YTwt6MzwbXhj92', '2025-05-07 17:48:17.516503', '123'),
(12, 'TEste', NULL, 'test555@test.com', NULL, 'JlGlZsuV8LQrdscCkIeyEfzkMAF3', '2025-05-07 18:24:40.211170', '2 pila'),
(13, 'Teste Interno', NULL, 'teste135@test.com', NULL, 'aQa5bUvQ0mXlPEd5yl5BfeXy2zd2', '2025-05-07 19:02:14.666295', '12 pila'),
(14, '', NULL, 'testefinal@teste.com', NULL, 'ukKF5VSfF0S6ETQSpKqXCdtNsRI2', '2025-05-19 13:57:24.031597', NULL),
(16, 'Teste Interno Finall', NULL, 'testefinal2@teste.com', NULL, '9cfxEtPnWVhE7GRor652Y3BpCcJ2', '2025-05-19 14:00:31.040208', 'Juntar 1 pila'),
(19, 'Teste Interno Finala', NULL, 'testefinal3@teste.com', NULL, 'vTF7BK1uCOfuXlMhEgu7OD1hQ7g1', '2025-05-19 14:06:03.930083', 'juntar 4 pila'),
(21, 'Teste Interno Finalkkkk', NULL, 'testefinal4@teste.com', NULL, 'yGaYHdfEuPN2D0sO25hWPO6IsLh1', '2025-05-19 14:14:52.112785', 'Juntar 56 pila'),
(22, 'Teste Interno Finalb', NULL, 'testefinal5@teste.com', NULL, 'HxzBGJnfMzZJ99B8GWuL27JYlS03', '2025-05-19 14:26:20.968929', 'juntar a pila'),
(23, 'Teste Interno Finalc', NULL, 'teste6@teste.com', NULL, 'ZPojLGBukYXl3MAAzIkWzyYmoNE2', '2025-05-19 14:36:56.759265', 'Juntar 8 pila'),
(24, 'Chico', NULL, 'chico@teste.com', NULL, 'PZVJyoaQpuWvTNARzhqMbJNhmhz1', '2025-05-19 15:59:31.984240', 'Juntar 40 pila'),
(25, 'Gamora', NULL, 'gamora@test.com', NULL, 'z4ImE9d0bJgOE8QS8iErompqtV72', '2025-05-19 16:04:28.525561', 'juntar sache de ração'),
(26, 'Livinhah', NULL, 'teste12313@test.com', NULL, 'QBrex8oe8BOHQG2X8hLj6K04qED2', '2025-05-19 23:19:42.115196', 'juntar'),
(27, 'Bebel Teste', NULL, 'teste@bebel.com', NULL, 'aDWvf3tzvaPJovzJsuPjAgGxzfd2', '2025-05-20 22:28:48.004839', NULL),
(28, 'Gamora Teste', NULL, 'gamora@teste02.com', NULL, 'ytFLwstLoBXNgk722TieaceKk4C3', '2025-05-21 19:31:16.909696', NULL),
(29, 'Chiquinho Teste', NULL, 'chico@teste1.com', NULL, '6HDVc3ByNeMh23wgt3H0EeJpgcy2', '2025-05-21 20:01:33.311477', NULL),
(30, 'Liviah Teste', NULL, 'liviah@teste1.com', NULL, 'kRQyAIkh2na4kaokHa5TMFVLskA3', '2025-05-21 20:05:32.158158', NULL),
(31, 'Teste James', NULL, 'james@teste.com', NULL, 'Cpl5Lb24TwhP5P3qhpoUxdRZoS72', '2025-05-21 20:56:49.109725', NULL),
(32, 'Bebel Teste1', NULL, 'teste@testb.com', NULL, 'Q5vbvdzursQSWtt5UFBeNIXl36m2', '2025-05-21 21:12:10.343893', NULL),
(33, 'Teste Vamo', NULL, 'teste@testtst.com', NULL, '8TyycygzIXcK7ZbEdJDCzhRybkh2', '2025-05-21 21:15:30.967823', NULL),
(34, 'New User Test', NULL, 'test01@test.com', NULL, 'Q3smn0OrSSSap6u1q9jsk2uer0X2', '2025-05-22 13:59:38.484483', NULL),
(35, 'Test User 02', NULL, 'test@testuser.com', NULL, 'bg1WfKnU9yTurSAwkA166xDOM9X2', '2025-05-22 14:06:08.879990', NULL),
(36, 'New User Test 01 ', NULL, 'test@testuser2.com', NULL, 'AyP80p8FftSeQQD49WHpiwTHzO12', '2025-05-22 14:26:58.750257', NULL),
(37, 'Test user 02', NULL, 'test.test@test.com', NULL, 'a0t37NAQrCgqHZWffXCShgcEnVj1', '2025-05-22 14:33:03.762904', NULL),
(38, 'new uset test ', NULL, 'test.t@test.com', NULL, 'b2NdB2jSKpdVQPIhOYqAcF0ZGH12', '2025-05-22 14:34:06.995388', NULL),
(39, 'Test user James', NULL, 'james@testec.com', NULL, 'u2P1WcZaTbWTwVPtmzBUpgnevhm1', '2025-05-22 14:38:12.523708', NULL),
(40, 'Test user Gamora', NULL, 'gamora@test1.com', NULL, '2NskgoqwUDeXQKxlhntVl8QYig22', '2025-05-22 14:43:15.658119', NULL),
(41, 'Test Bebel1', NULL, 'bebel@teste.com', NULL, '7DEOmuwSjoUtLjoin3xkUNdVBsD2', '2025-05-22 14:46:44.480569', NULL),
(42, 'Bebelis', NULL, 'bebe@teste.com', NULL, 'sryG0FE8ykXdkU4jrT7Epor8mn53', '2025-05-22 14:47:37.563449', NULL),
(43, 'Teste Chico', NULL, 'chisco@teste.com', NULL, 'CZywCK9uh0P1lgEP8AGi84DdA7Y2', '2025-05-22 14:57:03.731853', NULL),
(44, 'Teste JW', NULL, 'jw@test.com', NULL, '23EDL5xbLcRlVhmUtzGOrRNHw3V2', '2025-05-22 14:59:14.713633', NULL),
(45, 'chiquo', NULL, 'chiquinho@chico.com', NULL, 'qXdh9NximBN46LCnjeDIGRux0zo2', '2025-05-22 15:00:24.714674', NULL),
(46, 'Teste Final PFVR', NULL, 'pfvr@vamo.com', NULL, '8zTryDceI9VcKcq6KRKPKMWEbYw1', '2025-05-22 15:00:58.169293', NULL),
(47, 'User Vamo', NULL, 'vamo@vamo.com', NULL, 'SNCLfMrVVNRJdsaxoeBanIfglTl2', '2025-05-22 15:05:49.004894', NULL),
(48, 'Pelo amor', NULL, 'vamo@porfavo.com', NULL, 'UqI1HyUSkRRFwcppgIMD6ETRGxo1', '2025-05-22 15:08:24.775193', NULL),
(49, 'tESTE FINALO?', NULL, 'finalo@final.com', NULL, 'KpDQFWuFx8cNAw9RoQhfkD3wwuI3', '2025-05-22 15:09:02.124050', NULL),
(50, 'TEste VAMOOO', NULL, 'teste@vamo.com', NULL, 'M01v4KpWvqbP68XPx9n0yN5mlAD2', '2025-05-22 15:21:04.283671', NULL),
(51, 'Teste', NULL, 'testevamo@teste.com', NULL, 'tmfmYAGmWSaSdWuLgK5rl30JPt82', '2025-05-22 15:21:47.071025', NULL),
(52, 'Interno', NULL, 'interno@teste.com', NULL, '1GZwOVhuMCQzwMskywrZc3U5hBI2', '2025-05-22 15:30:08.881024', NULL),
(53, 'Terte Final', NULL, 'terte@final.com', NULL, 'DMOFjz9AkmdFbls8edpQIAZqXZt1', '2025-05-22 15:34:09.845848', NULL),
(54, 'Teste da Silva', NULL, 'silva@teste.com', NULL, 'VxFUAIfVcePlbc5gOin0mTgmpu52', '2025-05-22 15:34:53.738972', NULL),
(55, 'teute', NULL, 'teute@teste.com', NULL, '5ieRHT9KtsgbGQwMTbOW7TaKxYj2', '2025-05-22 15:36:55.546354', NULL),
(56, 'Ué', NULL, 'teste@ue.com', NULL, 'gvX8vGb1XWQmynPwTtgHwmaCdbp1', '2025-05-22 15:39:49.556667', NULL),
(57, 'Teste Finalzao', NULL, 'final@teste.com', NULL, '9c5gqB40J4b0TRn9J4eYlrOFBQo2', '2025-05-22 15:42:58.724261', NULL),
(58, 'User2', NULL, 'test@user.com', NULL, 'FtjlGQxBNtRTm4bHNXGLzpsxaOA2', '2025-05-22 15:44:01.549170', NULL),
(59, 'User4', NULL, 'uset@teste.com', NULL, '36VLhJvDtKUbpxNrEk6d85eKDQn2', '2025-05-22 15:45:30.666049', NULL),
(60, 'Tessssssss', NULL, 'tesss@teste.com', NULL, 'DZ8i8OBxqnU4zKaC8jpU0GxLbS62', '2025-05-22 15:50:07.885876', NULL),
(61, 'Por favvvv', NULL, 'pfbr@teste.cin', NULL, 'Xn57rKPVQENWQngxCpJskUMZH4X2', '2025-05-22 16:21:48.373757', NULL),
(62, 'Vini1', NULL, 'test@tetst.com', NULL, 'oAe1ZJhhfkgY0Yy8jMrH91196AL2', '2025-05-22 16:34:48.384608', NULL),
(63, 'Testttttttt', NULL, 'tetstst@test.com', NULL, 'NO5F6FmqshMz8J1nm12wkPmOERq1', '2025-05-22 16:59:54.622367', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_category` (`user_id`,`category_name`);

--
-- Índices de tabela `recurring_bills`
--
ALTER TABLE `recurring_bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `firebase_uid` (`firebase_uid`),
  ADD UNIQUE KEY `firebase_uid_2` (`firebase_uid`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de tabela `recurring_bills`
--
ALTER TABLE `recurring_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_categories_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Restrições para tabelas `recurring_bills`
--
ALTER TABLE `recurring_bills`
  ADD CONSTRAINT `recurring_bills_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
