CREATE TABLE [dbo].[Atendimentos](
	[NumeroAtendimento] [int] IDENTITY(1,1) NOT NULL,
	[Solicitante] [varchar](255) NULL,
	[ResponsavelAtendimento] [varchar](255) NULL,
	[ResultadoAtendimento] [text] NULL,
	[DataAtendimento] [date] NULL,
	[Advertencia] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NumeroAtendimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[DadosCadastrais](
	[id_aluno] [int] IDENTITY(1,1) NOT NULL,
	[CPF] [varchar](11) NULL,
	[Nome] [varchar](255) NULL,
	[DataNascimento] [date] NULL,
	[CID] [varchar](10) NULL,
	[Responsavel] [varchar](255) NULL,
	[Telefone] [varchar](20) NULL,
	[TelefoneResponsavel] [varchar](20) NULL,
	[CEP] [varchar](8) NULL,
	[Endereco] [varchar](255) NULL,
	[Bairro] [varchar](100) NULL,
	[Cidade] [varchar](100) NULL,
	[Complemento] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_aluno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CPF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[DadosContratuais](
	[id_contrato] [int] IDENTITY(1,1) NOT NULL,
	[StatusID] [int] NULL,
	[Turma] [int] NULL,
	[Matricula] [varchar](20) NULL,
	[CBO] [varchar](100) NULL,
	[IdAluno] [int] NULL,
	[InicioContrato] [date] NULL,
	[FimContrato] [date] NULL,
	[Concomitancia] [varchar](50) NULL,
	[Empresa] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_contrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DadosContratuais]  WITH CHECK ADD FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([id_status])
GO

ALTER TABLE [dbo].[DadosContratuais]  WITH CHECK ADD FOREIGN KEY([IdAluno])
REFERENCES [dbo].[DadosCadastrais] ([id_aluno])
GO

ALTER TABLE [dbo].[DadosContratuais]  WITH CHECK ADD FOREIGN KEY([Turma])
REFERENCES [dbo].[Turma] ([TurmaId])
GO

CREATE TABLE [dbo].[Status](
	[id_status] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[descricao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Turma](
	[TurmaId] [int] IDENTITY(1,1) NOT NULL,
	[Orientador] [varchar](100) NULL,
	[NomeTurma] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[TurmaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO