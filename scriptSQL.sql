/* mostrar os bancos existentes*/ 
show databases;

/* criar um novo banco */
create database dbHotel;

/* detrmina onde a tabela está sendo criada */
use dbHotel;

/* exclui a tabela*/
drop table funcionarios;

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
insert into funcionarios(nomeFunc, login, senha) values ("Fellipe Coelho", "fellipe", md5("1234@senac"));

/* READ */
/* ler/buscar as informações da tabela funcionários */
select * from funcionarios;

/* UPDATE */
/* atualizar o campo login na tabela funcionarios especificando o id */
update funcionarios set login = "fellipecoelho" where idFunc = 6;

update funcionarios set cargo = "Gerência" where idFunc = 4;
