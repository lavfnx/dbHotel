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


