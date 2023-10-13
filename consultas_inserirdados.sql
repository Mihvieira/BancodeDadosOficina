use oficina;

-- inserindo dados fictícios

insert into pessoaFisica (CPF, PNome, MNome, UNome, DataNascimento)
values (123467890, 'Maria', 'M', 'Silva', 19851008),
		(9876543210, 'Matheus','O', 'Pimentel', 19621109),
        (456789130, 'Ricardo','F', 'Silva', 19901210),
        (789123456, 'Julia', 'S', 'França', 19911201),
        (987456631, 'Roberta', 'G', 'Assis', 20000505),
        (654789123, 'Isabela', 'M', 'Cruz', 19991109),
        (56789100000, 'Maria', 'A', 'Oliveira', 19851008);

insert into pessoaJuridica (CNPJ, RazãoSocial) 
values (123456655912345, 'Almeida e filhos'),
		(854519679914345, 'Silva Locadora'),
		(934567893934695, 'Escola A'),
		(123457894563210, 'Transporte B'),
		(000000123456789, 'B Peças'),
		(123456789101215,  'Kids World'),
        (000000000000003, 'Barbie');
        
	select*from pessoafisica;
insert into cliente (IdPF, endereço, telefone) 
values (1, 'rua silva de prata 29, carangola-cidade das flores', 12345678900),
		(2, 'rua alemeda 289, centro-cidade das flores', 23456789100),
        (3, 'avenida alemeda vinha 1009, centro-cidade das flores', 34567891230),
        (4, 'rua larejeiras 861, centro-cidade das flores', 45678912364),
        (5, 'avenida koller 19, centro-cidade das flores', 56789123456),
        (6, 'rua alemeda das flores, 28, centro-cidade das flores', 78912345697);
select* from pessoaJuridica;
insert into cliente (idPJ, endereço, telefone) 
values(1, 'rua silva de prata 29, carangola-cidade das flores', 12345678900),
		(2, 'rua alemeda 289, centro-cidade das flores', 23456789100),
		(3, 'avenida alemeda vinha 1009, centro-cidade das flores', 34567891230),
		(4, 'rua larejeiras 861, centro-cidade das flores', 45678912364 ),
		(5, 'avenida koller 19, centro-cidade das flores', 56789123456),
		(6, 'rua alemeda das flores, 28, centro-cidade das flores', 78912345697);


-- nova entrada de dados
insert into cliente (IdPF, IdPJ, endereço, telefone) 
values(7, null, 'rua silva de prata 29, carangola-cidade das flores', 12345678900);
insert into cliente (IdPF, IdPJ, endereço, telefone) 
values(null, 7, 'rua silva de prata 29, carangola-cidade das flores', 12345678900);


insert into veiculos (IdCliente, Modelo, Ano_Fabricação, Placa, Marca, DataProxRevisão)
values(1, 'Fiesta', 2000, 1234567, 'Ford', 20250425),
	(2, 'Onix', 2021, 2345678, 'Chevrolet', 20240626),
	(3, 'Onix', 2023, 3456789, 'Chevrolet', 20240626);
 
 insert into serviço (IdVeiculos, Tipo, DataInicio, DataPrevFim, DataFim, AlterouOrçamento, TrocaPeça,  MecanicoResp)
 values (1, 'Em processamento', 20220122, 20220505, 20221120, 'Sim', 'Sim', 'A'),
		(2, 'Concluído', 20230220, 20230301, 20230302, default, 'Sim', 'A'),
        (2, 'Concluído', 20230622, 20230701, 20230701, default, default, 'B'),
        (2, 'Em Processamento', 20231001, 20231011, null, 'Sim', 'Sim', 'B'),
        (3, 'Em processamento', 20231001, 20231011, null, default, default, 'B');

insert into pagamentos (IdServiço, IdCliente, Tipo, ValorMaterialPeça, MãodeObra,  Descontos,  Parcelas, dataRecebimento)
values (1, 1, 'Dinheiro', 500, 500, 0.1, default, 20220122),
		(2, 2, 'Cartão de crédito', 200, 600, default, default, 20230220),
        (3, 2, 'Cartão de crédito', 100, 10000, default, default, 20230220),
        (4, 2,'Cartão de crédito', 5000, 10000, default, default, 20230701),
        (5, 3, 'Cartão de crédito', 5000, 10000, default, default, 20231011);
 
 insert into fornecedor (CNPJ, Endereço, NomeFantasia, RazãoSocial, Telefone)
values (123456655912345, 'rua silva de prata 29, carangola-cidade das flores', null, 'Almeida e filhos', 12345678900),
		(854519679914345, 'rua alemeda 289, centro-cidade das flores', null, 'Silva Peças', 23456789100),
		(934567893934695, 'rua alemeda 289, centro-cidade das flores', null, 'A', 23456789100),
		(123457894563210, 'rua larejeiras 861, centro-cidade das flores', null, 'T', 45678912364),
		(000000000000003, 'rua alemeda das flores, 28, centro-cidade das flores', null, 'C', 56789123456);
      

insert into estoque (IdFornecedor, Tipo, Nome, Quantidade, LocalE, ValorUnitario)
values (1, 'Peças', 'A', 200, 'a', 10),
		(2, 'Materiais diversos', 'B', 30, 'c', 20),
        (3, 'Peças', 'C', 2, 'b', 30);

insert into Material_Serviço(IdServiço, IdEstoque, Quantidade)
values (1, 1, 10);

-- queries
select * from cliente;
select *from pessoafisica;
select * from pessoaJuridica;
-- consultando id e nomes de clientes pessoa física ordenado por idCliente;
select c.Idcliente, f.Pnome from cliente c, pessoaFisica f where c.IdPf = f.IdPf order by c.idCliente;

-- consultando nomes e veículos dos clientes pessoa física;
select c.Idcliente, f.Pnome, v.modelo from pessoaFisica f, veiculos v, Cliente c where c.idPf = f.IdPF and v.IdCliente = c.IdCliente;

-- consultando serviços por veículo
select s.IdServiço, v.IdVeiculos from serviço s, veiculos v where s.Idveiculos = v.Idveiculos;
-- contando serviços por veículo
select Idveiculos, count(IdServiço) from serviço group by Idveiculos;

-- contando veículos que fizeram mais de 1 serviço
select Idveiculos, count(IdServiço) from serviço group by Idveiculos having count(IdServiço) > 1;


-- vendo modelo de veículo que fez mais de 1 serviço
select v.modelo, count(s.IdServiço) from serviço s, veiculos v where s.Idveiculos = v.Idveiculos group by s.Idveiculos having count(s.IdServiço) > 1;

-- visualizando coluna pagamentos
select * from pagamentos;

-- visualizando o maior valor pago
select max(valorFinal) from pagamentos;

-- os meios de pagamentos mais usados
select tipo, count(tipo) from pagamentos group by tipo;

-- visualizando endereço e telefone por nome do cliente
select c.IdCliente, f.Pnome, c.endereço, c.telefone from Cliente c, pessoaFisica f where c.idPF = f.IdPF group by IdCliente;

-- visualizando nome do cliente com veículo cadastrado
select f.Pnome, v.modelo as Nome_cliente from Cliente c, pessoaFisica f, veiculos v where v.IdCliente = c.IdCliente and c.idPF = f.IdPF;

-- Veículos por cliente que fizeram serviços
select IdCliente, modelo, count(IdCliente) from veiculos inner join serviço on serviço.Idveiculos = veiculos.Idveiculos group by serviço.Idveiculos;
