  --Create
  --insert

  --Read
  --listar

  --Update
  --update

  --Delete
  --delete
  
  
create procedure spINSDadosCadastrais  
   
@CPF varchar(11),  
@Nome VARCHAR(255),  
@DataNascimento DATE,  
@CID VARCHAR(10),  
@Responsavel VARCHAR(255),  
@Telefone VARCHAR(20),  
@TelefoneResponsavel VARCHAR(20),  
@CEP VARCHAR(8),  
@Endereco VARCHAR(255),  
@Bairro VARCHAR(100),  
@Cidade VARCHAR(100),  
@Complemento VARCHAR(255)  
as begin  
insert into DadosCadastrais  
(CPF,Nome,DataNascimento,CID,Responsavel,Telefone,TelefoneResponsavel,Endereco,CEP,Bairro,Cidade,Complemento)  
values   
(@CPF,@Nome,@DataNascimento,@CID,@Responsavel,@Telefone,@TelefoneResponsavel,@Endereco,@CEP,@Bairro,@Cidade,@Complemento)  
end ;

  
  
CREATE PROCEDURE spINSDadosContratuais  
    @StatusID INT,  
    @Turma INT,  
    @Matricula VARCHAR(20),  
    @CBO VARCHAR(100),  
    @IdAluno INT,  
    @InicioContrato DATE,  
    @FimContrato DATE,  
    @Concomitancia VARCHAR(50),  
    @Empresa VARCHAR(255)  
AS  
BEGIN  
    INSERT INTO DadosContratuais (StatusID, Turma, Matricula, CBO, IdAluno, InicioContrato, FimContrato, Concomitancia, Empresa)  
    VALUES (@StatusID, @Turma, @Matricula, @CBO, @IdAluno, @InicioContrato, @FimContrato, @Concomitancia, @Empresa);  
END;  

Create procedure spINSTurma 
@Orientador Varchar(100),
@NomeTurma Varchar(100)
as 
begin

insert into Turma (Orientador,NomeTurma)
values (@Orientador,@NomeTurma)
end;
  
  create procedure spINSAtendimentos
@Solicitante varchar(255),
@ResponsavelAtendimento varchar(255),
@ResultadoAtendimento text,
@DataAtendimento date,
@Advertencia bit

as 
begin 

insert into Atendimentos(Solicitante,ResponsavelAtendimento,ResultadoAtendimento,DataAtendimento,Advertencia)
values (@Solicitante,@ResponsavelAtendimento,@ResultadoAtendimento,@DataAtendimento,@Advertencia)
end 

CREATE PROCEDURE spLSTDadosCadastrais  
  
@CPF varchar(11),  
@Nome varchar(255)  
AS  
BEGIN  
    SELECT  
        id_aluno,  
        CPF,  
        Nome,  
        DataNascimento,  
        CID,  
        Responsavel,  
        Telefone,  
        TelefoneResponsavel,  
        Endereco,  
        CEP,  
        Bairro,  
        Cidade,  
        Complemento  
    FROM  
        DadosCadastrais  
  Where   
  CPF = @CPF and   
  Nome = @Nome   
END;

  
  
CREATE PROCEDURE spLSTDadosContratuais  
  
@Matricula VARCHAR(20)  
  
AS  
BEGIN  
    SELECT  
        id_contrato,  
        StatusID,  
        Turma,  
        Matricula,  
        CBO,  
        IdAluno,  
        InicioContrato,  
        FimContrato,  
        Concomitancia,  
        Empresa  
    FROM  
        DadosContratuais  
 where   
 Matricula = @Matricula  
END;  

Create procedure spLSTTurma
@Orientador varchar(100),
@NomeTurma varchar(100) 
as
begin

select * from Turma with(nolock)
where Orientador = @Orientador and NomeTurma = @NomeTurma
end

  
Create Procedure spLSTAtendimentos
@ResponsavelAtendimento varchar(255),
@DataAtendimento date 

as
begin

select * from Atendimentos with(nolock)
where 
ResponsavelAtendimento = @ResponsavelAtendimento and
DataAtendimento = @DataAtendimento
end

  
create procedure spUPDDadosCadastrais  
    @id_aluno INT,  
    @CPF VARCHAR(11),  
    @Nome VARCHAR(255),  
    @DataNascimento DATE,  
    @CID VARCHAR(10),  
    @Responsavel VARCHAR(255),  
    @Telefone VARCHAR(20),  
    @TelefoneResponsavel VARCHAR(20),  
    @Endereco VARCHAR(255),  
    @CEP VARCHAR(8),  
    @Bairro VARCHAR(100),  
    @Cidade VARCHAR(100),  
    @Complemento VARCHAR(255)  
AS  
BEGIN  
    UPDATE DadosCadastrais  
    SET  
        CPF = @CPF,  
        Nome = @Nome,  
        DataNascimento = @DataNascimento,  
        CID = @CID,  
        Responsavel = @Responsavel,  
        Telefone = @Telefone,  
        TelefoneResponsavel = @TelefoneResponsavel,  
        Endereco = @Endereco,  
        CEP = @CEP,  
        Bairro = @Bairro,  
        Cidade = @Cidade,  
        Complemento = @Complemento  
    WHERE  
        id_aluno = @id_aluno;  
END;  

  
  
CREATE PROCEDURE spUPDDadosContratuais  
    @id_contrato INT,  
    @StatusID INT,  
    @Turma INT,  
    @Matricula VARCHAR(20),  
    @CBO VARCHAR(100),  
    @IdAluno INT,  
    @InicioContrato DATE,  
    @FimContrato DATE,  
    @Concomitancia VARCHAR(50),  
    @Empresa VARCHAR(255)  
AS  
BEGIN  
    UPDATE DadosContratuais  
    SET  
        StatusID = @StatusID,  
        Turma = @Turma,  
        Matricula = @Matricula,  
        CBO = @CBO,  
        IdAluno = @IdAluno,  
        InicioContrato = @InicioContrato,  
        FimContrato = @FimContrato,  
        Concomitancia = @Concomitancia,  
        Empresa = @Empresa  
    WHERE  
        id_contrato = @id_contrato;  
END;

Create procedure spUPDTurma
@Orientador varchar(100),
@NomeTurma varchar(100),
@TurmaId int 

as
begin 
Update Turma
set 
Orientador = @Orientador,
NomeTurma  = @NomeTurma

where 
TurmaId = @TurmaId
end



Create Procedure spUPDAtendimentos
@NumeroAtendimento int,
@Solicitante varchar(255),
@ResponsavelAtendimento varchar(255),
@ResultadoAtendimento text,
@DataAtendimento date,
@Advertencia bit

as
begin 

Update Atendimentos
set 
Solicitante				= @Solicitante,			
ResponsavelAtendimento  = @ResponsavelAtendimento, 
ResultadoAtendimento	= @ResultadoAtendimento,	
DataAtendimento			= @DataAtendimento,		
Advertencia				= @Advertencia		

where NumeroAtendimento = @NumeroAtendimento
end

CREATE PROCEDURE spDELDadosCadastrais  
    @id_aluno INT  
AS  
BEGIN  
    DELETE FROM DadosCadastrais  
    WHERE id_aluno = @id_aluno;  
END;  


  
  
CREATE PROCEDURE spDELDadosContratuais  
   
    @id_contrato INT  
AS  
BEGIN  
    DELETE FROM DadosContratuais  
    WHERE id_contrato = @id_contrato;  
END;


Create procedure spDELTurma
@TurmaId int 
as 
begin

Delete from Turma
where TurmaId = @TurmaId
end
Use AulaCamps
go

Create procedure spDELAtendimentos
@NumeroAtendimento int

as 
begin

delete from Atendimentos
where NumeroAtendimento = @NumeroAtendimento
end