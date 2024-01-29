USE AulaCamps
go


Create table CadastroUsuario (
UsuarioId	int identity(1,1) primary key,
Nome		varchar(100),
email		varchar(255),
Usuario		varchar(100),
Senha		varchar(100)
)


Create procedure spINSCadastroUsuario
@Nome varchar(100),
@email varchar(255),
@Usuario varchar(100),
@Senha varchar(100)

as 
begin 
insert into CadastroUsuario (Nome,email,Usuario,Senha)
Values (@Nome,@email,@Usuario,@Senha)
end

Create procedure spLSTCadastroUsuario
@Usuario varchar(100),
@Nome varchar(100)
as
begin 
select * from CadastroUsuario with(nolock)
where Usuario = @Usuario and Nome = @Nome
end

Create procedure spUPDCadastroUsuario 
@UsuarioId int,
@Nome varchar(100),
@email varchar(255),
@Usuario varchar(100),
@Senha varchar(100)
as
begin
	Update CadastroUsuario
	Set 	
	Nome		= @Nome	,	
	email		= @email,		
	Usuario		= @Usuario,		
	Senha		= @Senha	
	where 
	UsuarioId = @UsuarioId
	end


Create procedure spDELCadastroUsuario
@UsuarioId int

as 
begin 

Delete from CadastroUsuario
where UsuarioId = @UsuarioId
end
