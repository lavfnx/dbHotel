/* mostrar os bancos existentes*/ 
show databases;

/* criar um novo banco */
create database dbHotel;

/* detrmina onde a tabela está sendo criada e selecionar o banco */
use dbHotel;

/* exclui a tabela*/
drop table funcionarios;

/* adicionar o campo email á tabela funcionarios */
alter table funcionarios add column email varchar(50) not null;

/* modificar o campo email para que se torne obrigatório, não nulo (not null) */
alter table funcionarios modify column email varchar(50) not null;

/* excluir um campo da tabela */
alter table funcionarios drop column email;

/* reposicionar o campo email para que elee fique após o login */
alter table funcionarios modify column email varchar(50) not null after login;


/* criar uma nova tabela */
create table funcionarios (
/* int se refere ao tipo do campo na tabela (variável) 
primary key determina que o campo idFunc seja uma chave primária e será reponsável por identificar cada funcionário 
auto_increment determina que o MySQL dê um novo id a cada cadastro */
idFunc int primary key auto_increment,
/*varchar é a quantidade variável de caracteres no nome (nesse caso, até 100 caracteres) 
not null determina que o campo seja obrigatório */
/*
nomeFunc varchar (100) not null,
*/
/* unique determina que o campo seja único e não possa se repetir */
login varchar (20) not null unique,
senha varchar (255) not null,
cargo varchar (20)
);

/* mostra as tabelas criadas */
show tables;

/* descreve os campos da tabela funcionarios */
describe funcionarios;

/* CREATE */
/* inserir um novo usuário, com nome, login, senha criptografada e cargo */
insert into funcionarios(nomeFunc, login, senha, cargo) values ("Administrador","admin", md5("admin"), "Administrador"); 
insert into funcionarios(nomeFunc, login, senha, cargo) values ("Pamella Pereto", "pamellapereto", md5("123@senac"), "TI");
insert into funcionarios(nomeFunc, login, senha, cargo) values ("Breno Silva", "brenosilva", md5("123@senac"), "Contabilidade");
insert into funcionarios(nomeFunc, login, senha, cargo) values ("Victória Cardoso", "victoriacarsoso", md5("123@senac"), "RH");
insert into funcionarios(nomeFunc, login, senha) values ("Laura Lopes", "lauralopes", md5("123@senac"));
insert into funcionarios(nomeFunc, login, senha) values ("Fellipe Coelho", "fellipe", md5("123@senac"));

/* adicionar um novo funcionario, email not null */
insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("Nathan Raphael", "nathanraphael", "nathanraphael@gmail.com", md5("123@senac"), "Gerência");


/* READ */
/* ler/buscar as informações da tabela funcionários */
select * from funcionarios;

/* Buscar login e a senha da tabela funcionarios em que logins eja admin e senha seja admin */
select login as Login, senha from funcionarios where login = "admin" and senha = md5("admin");

/* Buscar o ID e o nome do fucnionario da tabela funcionarios ordenando o nome alfabeticamente (ascendente, de A a Z) */
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc asc;

/* Buscar o ID e o nome do fucnionario da tabela funcionarios ordenando o nome alfabeticamente (descendente, de Z a A) */
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc desc;

/* Buscar os campos idFunc com o apelido ID_Funcionarios, nomeFunc com o apelido Nome_Funcionarios, cargo com o apelido Cargo_Funcionario, da tabela funcionarios, ordenando de forma descendente (com maior ID parao menor) */ 
select idFunc as ID_Funcionarios, nomeFunc as Nome_Funcionarios, cargo as Cargo_Funcionario from funcionarios order by idFunc desc; 

/* Buscar os campos idFunc com o apelido ID_Funcionarios, nomeFunc com o apelido Nome_Funcionarios, cargo com o apelido Cargo_Funcionario, da tabela funcionarios, onde cargo seja diferente de nulo, ordenando de forma descendente o ID (com maior ID parao menor) */ 
select idFunc as ID_Funcionarios, nomeFunc as Nome_Funcionarios, cargo as Cargo_Funcionario from funcionarios where cargo <> "null" order by idFunc desc; 

/* Buscar todos os dados dos funcionários com o cargo de gerência */
select * from funcionarios where cargo = "Gerência";


/* UPDATE */
/* atualizar o campo login na tabela funcionarios especificando o id */
update funcionarios set login = "fellipecoelho" where idFunc = 6;

update funcionarios set cargo = "Gerência" where idFunc = 4;

/* atualizar a tabela funcionários adicionando email a cada um dos funcionários cadastrados */
update funcionarios set email = "pamellapereto@gmail.com" where idFunc = 2;
update funcionarios set email = "brenosilva@gmail.com" where idFunc = 3;
update funcionarios set email = "victoriacardoso@gmail.com" where idFunc = 4;
update funcionarios set email = "lauralopes@gmail.com" where idFunc = 5;
update funcionarios set email = "fellipecoelho@gmail.com" where idFunc = 6;


/* DELETE */

delete from funcionarios where idFunc = 6;


create table quartos (
idQuarto int primary key auto_increment,
andar varchar(10) not null,
numeroQuarto varchar(20) not null,
tipoQuarto varchar(50) not null,
ocupacaoMax int not null,
situacao char(3) not null,
nome varchar(50) not null,
descricao text,
preco decimal (10,2) not null,
tipoCama varchar(20),
varanda char(3)
);

describe quartos;

alter table quartos add column numeroQuarto varchar(10) not null after andar;

alter table quartos add column cafeDaManha char(3) not null after preco;
alter table quartos add column foto varchar(255) not null after descricao;

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values ("5°", "505", "Superoior Premier", "3", "não", "Familiar", "O quarto de 42m² com piso frio, varanda - Vista para o mar. Oferece ar-condicionado inidvidual, TV LCD 42, wi-fi grátis, cofre digital, frigobar abastecido e banheiro com secador de cabelo", " ", 750.90, "sim", "Queen size", "sim");

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values ("4°", "402", "Suíte Casal", "2", "sim", "Familiar", "O quarto de 32m² com piso frio, varanda - Vista para o mar. Oferece ar-condicionado, wi-fi grátis, frigobar abastecido e banheiro com hidromassagem", "https://www.hotelgarance.com/_novaimg/galleria/342681.jpg", 820.90, "sim", "Queen size", "sim");
insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values ("3°", "320", "Suíte Solitário", "1", "sim", "Familiar", "O quarto de 34m², varanda - Vista para o mar. Oferece ar-condicionado, wi-fi grátis, frigobar abastecido e banheiro com secador de cabelo", "https://www.hotelunique.com/wp-content/uploads/2019/04/053_Hotel-Unique_Standard-e1555526412538-571x718.jpg", 490.90, "não", "Queen size", "sim");
insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values ("4°", "413", "Suíte Casal", "2", "não", "Familiar", "O quarto de 36m², varanda - Vista para o mar. Oferece ar-condicionado individual, wi-fi grátis, frigobar abastecido e banheiro com secador de cabelo", "https://www.hplus.com.br/wp-content/uploads/2019/08/quarto-luxo-hotel-fusion-hplus-em-brasilia-13.jpg", 690.90, "sim", "Queen size", "sim");

update quartos set cafeDaManha = "sim" where idQuarto = 7;
update quartos set foto = "https://www.hotelunique.com/wp-content/uploads/2019/04/053_Hotel-Unique_Standard-e1555526412538-571x718.jpg " where idQuarto = 7;

select * from quartos;

select * from quartos where situacao = "não";
select * from quartos where cafeDaManha = "sim" and situacao = "não";
select * from quartos where varanda = "sim" and cafeDaManha = "sim" and situacao = "não";
select * from quartos where preco <700 and situacao = "não";
select * from quartos where situacao = "não" order by preco asc;

delete from quartos where idQuarto = 7;

create table clientes (
idCliente int primary key auto_increment,
nome varchar(100) not null,
cpf char(14) not null unique,
rg char(12) not null unique,
email varchar(50) unique,
celular varchar(20) not null,
numeroCartao varchar(20) not null unique,
nomeTitular varchar(100) not null,
validade date not null,
cvv char(3) not null,
checkin datetime not null,
checkout datetime not null
);

describe clientes;

/* verififcar quartos disponíveis */
select * from quartos where situacao = "não";

insert into clientes (nome, cpf, rg, email, celular) values 
("José de Assis", "829.942.570-09", "48.353.888-7", "josedeassis@gmail.com", "(96) 99338-2803");

insert into clientes (nome, cpf, rg, email, celular) values 
("Victória Cardoso", "863.923.231-56", "43.879.433-1", "victoriacardoso@gmail.com", "(11) 93690-8421");

select * from clientes;

/* Buscar todas as informações da tabela quartos que está vinculada a tabela clientes pelo campo idQuarto */
select * from quartos inner join clientes
on quartos.idQuarto = clientes.idQuarto;

/* Buscar o nome completo e o celular do cliente que alugou o quarto de número 505, pois a tabela quartos está vinculada a tabela clientes pelo campo idQuarto */
select clientes.nome, clientes.celular
from quartos inner join clientes on quartos.idQuarto = clientes.idQuarto where numeroQuarto = 505;

/* Buscar o nome completo e data/horário do checkout do cliente que alugou o quarto de número 505*/
select clientes.nome, clientes.checkout from quartos inner join clientes on quartos.idQuarto = clientes.idQuarto where numeroQuarto = 505;

select clientes.nome as Nome, date_format(clientes.checkout,'%d%m%Y - %H:%i') as Checkout from quartos inner join clientes
on quartos.idQuarto = clientes.idQuarto where numeroQuarto = 505;

drop table clientes;

/* dataPedido timestamp default current_timestamp significa que a data do pedido será a mesma do sistema, a data atual*/
/* statusPedido significa que a situação do pedido será uma das seguintes opções: Pendentes, Finalizado, Cancelado */
create table pedidos (
	idPedido int primary key auto_increment,
	dataPedido timestamp default current_timestamp,
	statusPedido enum("Pendente", "Finalizado", "Cancelado") not null,
	idCliente int not null,
	foreign key (idCliente) references clientes(idCliente)
);

/* ABERTURA DE PEDIDOS */
insert into pedidos (statusPedido, idCliente) values ("Pendente", 1);
insert into pedidos (statusPedido, idCliente) values ("Finalizado", 2);

select * from pedidos;

select * from pedidos inner join clientes on pedidos.idCliente = clientes.idCliente;


create table reservas (
	idReserva int primary key auto_increment,
    idPedido int not null,
    idQuarto int not null,
    foreign key (idPedido) references pedidos(idPedido),
    foreign key(idQuarto) references quartos(idQuarto)
);

alter table reservas add column checkin datetime not null;
alter table reservas add column checkout datetime not null;

select * from reservas;
insert into reservas (idPedido, idQuarto, checkin, checkout) values (1, 7, "2023-11-02 14:00:00", "2023-11-05 14:00:00"); 
insert into reservas (idPedido, idQuarto, checkin, checkout) values (1, 9, "2023-11-02 14:00:00", "2023-11-05 14:00:00";

select reservas.idReserva, pedidos.idPedido, quartos.idQuarto, quartos.nome, quartos.andar, quartos.numeroQuarto
from (reservas inner join pedidos on reservas.idPedido = pedidos.idPedido)
inner join quartos on reservas.idQuarto = quartos.idQuarto; 


select * from reservas;



