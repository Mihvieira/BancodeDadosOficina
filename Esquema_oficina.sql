create database oficina;

use oficina;

create table pessoaFisica(
	IdPF int primary key auto_increment,
	CPF char(11)  unique,
	PNome varchar(10),
    MNome varchar(3),
    UNome varchar(20),
    DataNascimento date
);

create table pessoaJuridica(
	IdPJ int primary key auto_increment,
    CNPJ char(15) unique,
    DataCriação date,
    RazãoSocial varchar(45),
    NomeFantasia varchar (255)
    );
    
create table Cliente(
	IdCliente int primary key auto_increment,
    IdPF int unique,
    IdPJ int unique,
    endereço varchar (255),
    telefone varchar(11),
    e_mail varchar(20),
    constraint fk_cliente_pf foreign key (IdPF) references pessoaFisica(IdPF),
    constraint fk_cliente_pj foreign key (IdPJ) references pessoaJuridica(IdPJ),
    CONSTRAINT CHK_CPF_clients check (IdPF is not null and IdPJ is NULL or 
					IdPJ is not null and IdPF is NULL)
    );
    
create table Veiculos(
	IdVeiculos int primary key auto_increment,
    IdCliente int,
    Placa varchar(7) unique,
    Modelo varchar(45),
    Marca varchar(10),
    Ano_fabricação int,
    DataProxRevisão date,
   	constraint fk_v_client foreign key (IdCliente) references Cliente(idCliente)
	);

create table serviço(
	IdServiço int primary key auto_increment,
    IdVeiculos int,
    Tipo ENUM('Em Processamento', 'Concluído') default 'Em Processamento',
    DataInicio date not null,
    DataPrevFim date not null,
    DataFim date,
    Descrição varchar(45),
    TrocaPeça enum('Sim', 'não') default 'Não',
    MecanicoResp varchar(45),
    constraint fk_s_v foreign key (IdVeiculos) references Veiculos(IdVeiculos)
);

create table pagamentos(
	IdPagamento int primary key	auto_increment,
    IdServiço int not null unique,
    IdCliente int,
    Tipo Enum('Dinheiro', 'Cartão de Crédito', 'Cartão de débito', 'Dois cartões', 'Boleto') default 'Dinheiro',
	ValorMaterialPeça float,
    MãodeObra float,
    Descontos float default 0,
    Parcelas Enum('0','1','2','3') default '0',
    dataRecebimento date,
    ValorSoma float as (ValorMaterialPeça + MãodeObra),
    valorDesconto float as ((ValorMaterialPeça + MãodeObra)*Descontos),
    valorFinal float as (ValorSoma - ValorDesconto),
    constraint fk_O_S foreign key(IdServiço) references serviço(IdServiço),
    constraint fk_p_C foreign key (IdCliente) references Cliente(IdCliente),
    constraint chk_valor check (valorFinal > 0)
);

create table fornecedor(
	IdFornecedor int primary key auto_increment,
    CNPJ char(15) unique not null,
    Endereço varchar(255),
    NomeFantasia varchar(45),
    RazãoSocial varchar(45),
    Telefone char(11)
);

create table estoque (
	IdEstoque int primary key auto_increment,
    IdFornecedor int not null,
    Tipo Enum('Peças', 'Materiais Diversos'),
    Nome char(20),
    Quantidade int,
    LocalE Enum('a', 'b', 'c'),
    ValorUnitario float,
    constraint fk_e_f foreign key (IdFornecedor) references Fornecedor(IdFornecedor)
);

create table Material_Serviço(
	IdServiço int,
    IdEstoque int,
    Quantidade int,
    constraint fk_M_S foreign key (IdServiço) references Serviço(IdServiço),
    constraint fk_M_E foreign key (IdEstoque) references Estoque(IdEstoque)
);

alter table cliente auto_increment = 1;
alter table veiculos auto_increment = 1;
alter table estoque auto_increment = 1;
alter table fornecedor auto_increment = 1;
alter table pagamentos auto_increment = 1;
alter table serviço auto_increment = 1;