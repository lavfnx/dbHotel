/* Banco de dados para gerenciamento de um hotel */

create database dbHotel;

show databases;

show tables;

use dbHotel;


create table funcionarios (
idFunc int primary key auto_increment,
nomeFunc varchar(100) not null,
login varchar (20) not null unique,
email varchar(50) not null,
senha varchar(255) not null,
cargo varchar(20)
);

describe funcionarios;

insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("Administrador","admin", "admin@gmail.com", md5("admin"), "Administrador"); 
insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("Pamella Pereto", "pamellapereto", "pamellapereto@gmail.com", md5("123@senac"), "TI");
insert into funcionarios(nomeFunc, login, email,  senha, cargo) values ("Breno Silva", "brenosilva", "brenosilva@gmail.com", md5("123@senac"), "Contabilidade");
insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("Victória Cardoso", "victoriacarsoso", "victoriacardoso@gmail.com", md5("123@senac"), "Gerência");
insert into funcionarios(nomeFunc, login, email, senha) values ("Lauraa Lopes", "lauralopes", "lauralopes@gmail.com", md5("123@senac"));
insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("Nathan Raphael", "nathanraphael", "nathanraphael@gmail.com", md5("123@senac"), "Gerência");

select * from funcionarios;

select login as Login, senha from funcionarios where login = "admin" and senha = md5("admin");
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc asc;
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc desc; 
select idFunc as ID_Funcionarios, nomeFunc as Nome_Funcionarios, cargo as Cargo_Funcionario from funcionarios order by idFunc desc; 
select idFunc as ID_Funcionarios, nomeFunc as Nome_Funcionarios, cargo as Cargo_Funcionario from funcionarios where cargo <> "null" order by idFunc desc; 
select * from funcionarios where cargo = "Gerência" order by nomeFunc desc;


create table quartos (
idQuarto int primary key auto_increment,
andar varchar(10) not null,
numeroQuarto varchar(10) not null,
tipoQuarto varchar(50) not null,
ocupacaoMax int not null,
situacao char(3) not null,
nome varchar(50) not null,
descricao text,
foto varchar(255) not null,
preco decimal (10,2) not null,
cafeDaManha char(3) not null,
precoCafe decimal(10,2),
tipoCama varchar(20),
varanda char(3)
);

describe quartos;

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, precoCafe, tipoCama, varanda) values ("5°", "505", "Superoior Premier", "3", "não", "Familiar", "O quarto de 42m² com piso frio, varanda - Vista para o mar. Oferece ar-condicionado inidvidual, TV LCD 42, wi-fi grátis, cofre digital, frigobar abastecido e banheiro com secador de cabelo", "https://www.hotelunique.com/wp-content/uploads/2019/04/053_Hotel-Unique_Standard-e1555526412538-571x718.jpg", 750.90, "sim", 60.00, "Queen size", "sim");
insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, precoCafe, tipoCama, varanda) values ("4°", "402", "Suíte Casal", "2", "sim", "Familiar", "O quarto de 32m² com piso frio, varanda - Vista para o mar. Oferece ar-condicionado, wi-fi grátis, frigobar abastecido e banheiro com hidromassagem", "https://www.hotelgarance.com/_novaimg/galleria/342681.jpg", 820.90, "sim", 60.00, "Queen size", "sim");
insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values ("3°", "320", "Suíte Solitário", "1", "sim", "Familiar", "O quarto de 34m², varanda - Vista para o mar. Oferece ar-condicionado, wi-fi grátis, frigobar abastecido e banheiro com secador de cabelo", "https://www.hotelunique.com/wp-content/uploads/2019/04/053_Hotel-Unique_Standard-e1555526412538-571x718.jpg", 490.90, "não", "Queen size", "sim");
insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, precoCafe, tipoCama, varanda) values ("4°", "413", "Suíte Casal", "2", "não", "Familiar", "O quarto de 36m², varanda - Vista para o mar. Oferece ar-condicionado individual, wi-fi grátis, frigobar abastecido e banheiro com secador de cabelo", "https://www.hplus.com.br/wp-content/uploads/2019/08/quarto-luxo-hotel-fusion-hplus-em-brasilia-13.jpg", 690.90, "sim", 60.00, "Queen size", "sim");

select * from quartos;

select * from quartos where situacao = "não";
select * from quartos where cafeDaManha = "sim" and situacao = "não";
select * from quartos where varanda = "sim" and cafeDaManha = "sim" and situacao = "não";
select * from quartos where preco <700 and situacao = "não";
select * from quartos where situacao = "não" order by preco asc;


create table clientes (
idCliente int primary key auto_increment,
nome varchar(100) not null,
cpf char(14) not null unique,
rg char(12) not null unique,
email varchar(50) unique,
celular varchar(20) not null
);

describe clientes;

insert into clientes (nome, cpf, rg, email, celular) values ("José de Assis", "829.942.570-09", "48.353.888-7", "josedeassis@gmail.com", "(96) 99338-2803");
insert into clientes (nome, cpf, rg, email, celular) values ("Victória Cardoso", "863.923.231-56", "43.879.433-1", "victoriacardoso@gmail.com", "(11) 93690-8421");

select * from clientes;


create table pedidos (
	idPedido int primary key auto_increment,
	dataPedido timestamp default current_timestamp,
	statusPedido enum("Pendente", "Finalizado", "Cancelado") not null,
	idCliente int not null,
	foreign key (idCliente) references clientes(idCliente)
);

describe pedidos;

insert into pedidos (statusPedido, idCliente) values ("Pendente", 1);
insert into pedidos (statusPedido, idCliente) values ("Finalizado", 2);

select * from pedidos;
select * from pedidos inner join clientes on pedidos.idCliente = clientes.idCliente;


create table reservas (
	idReserva int primary key auto_increment,
    idPedido int not null,
    idQuarto int not null,
	checkin datetime not null,
    checkout datetime not null,
    foreign key (idPedido) references pedidos(idPedido),
    foreign key(idQuarto) references quartos(idQuarto)
);

describe reservas;

insert into reservas (idPedido, idQuarto, checkin, checkout) values (1, 7, "2023-11-02 14:00:00", "2023-11-05 14:00:00"); 
insert into reservas (idPedido, idQuarto, checkin, checkout) values (1, 9, "2023-11-02 14:00:00", "2023-11-05 14:00:00");
insert into reservas (idPedido, idQuarto, checkin, checkout) values (2, 10, "2023-10-17 16:00:00", "2023-10-21 16:00:00");

select * from reservas;

select reservas.idReserva, pedidos.idPedido, quartos.idQuarto, quartos.nome, quartos.andar, quartos.numeroQuarto
from (reservas inner join pedidos on reservas.idPedido = pedidos.idPedido)
inner join quartos on reservas.idQuarto = quartos.idQuarto; 

/*OBJETIVO: selecionar o nome do cliente, seu cpf e email, o id do pedido do cliente, e data do pedido, 
 quais quartos fazem parte desse pedido, os tipos dos quartos e seus nomes assim como os anadares em que estão, os números de cada quarto, seus preços e suas datas de checkin e checkout. */

select clientes.nome, clientes.cpf, clientes.email, pedidos.idPedido, pedidos.dataPedido, quartos.tipoQuarto, quartos.nome, quartos.andar, quartos.numeroQuarto, quartos.preco, reservas.checkin, reservas.checkout from 
clientes inner join pedidos on clientes.idCliente = pedidos.idCliente inner join
reservas on reservas.idPedido = pedidos.idPedido inner join quartos
on reservas.idQuarto = quartos.idQuarto;

/* soma total do pedido feito pela cliente Victória */
select sum(quartos.preco) as Total from reservas inner join quartos on reservas.idQuarto = quartos.idQuarto where idPedido =2;
