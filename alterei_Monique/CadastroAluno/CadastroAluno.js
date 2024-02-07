function register() {
    var nomeInput = document.getElementById('nome');
    var cpfInput = document.getElementById('cpf');
    var dataNascimentoInput = document.getElementById('data-nascimento');
    var telefoneInput = document.getElementById('telefone');
    var telResponsavelInput = document.getElementById('tel-responsavel');
    var enderecoInput = document.getElementById('endereco');
    var bairroInput = document.getElementById('bairro');
    var cidInput = document.getElementById('cid');
    var responsavelInput = document.getElementById('responsavel');
    var cepInput = document.getElementById('cep');
    var complementoInput = document.getElementById('complemento');
    var cidadeInput = document.getElementById('cidade');

    var nome = nomeInput.value;
    var cpf = cpfInput.value;
    var dataNascimento = dataNascimentoInput.value;
    var telefone = telefoneInput.value;
    var telResponsavel = telResponsavelInput.value;
    var endereco = enderecoInput.value;
    var bairro = bairroInput.value;
    var cid = cidInput.value;
    var responsavel = responsavelInput.value;
    var cep = cepInput.value;
    var complemento = complementoInput.value;
    var cidade = cidadeInput.value;

    if (validateRegistration(nome, cpf, dataNascimento, telefone, telResponsavel, endereco, bairro, cid, responsavel, cep, complemento, cidade)) {
        // Salvar informações do usuário no localStorage
        saveUserInfo(nome, cpf, dataNascimento, telefone, telResponsavel, endereco, bairro, cid, responsavel, cep, complemento, cidade);

        alert('Cadastro bem-sucedido. Faça o login agora.');
        
        nomeInput.value = '';
        cpfInput.value = '';
        dataNascimentoInput.value = '';
        telefoneInput.value = '';
        telResponsavelInput.value = '';
        enderecoInput.value = '';
        bairroInput.value = '';
        cidInput.value = '';
        responsavelInput.value = '';
        cepInput.value = '';
        complementoInput.value = '';
        cidadeInput.value = '';
    } else {
        alert('Erro no cadastro. Verifique as informações inseridas.');
    }
}

function validateRegistration(nome, cpf, dataNascimento, telefone, telResponsavel, endereco, bairro, cid, responsavel, cep, complemento, cidade) {
    if (!nome || !cpf || !dataNascimento || !telefone || !telResponsavel || !endereco || !bairro || !cid || !responsavel || !cep || !cidade) {
        alert('Preencha todos os campos.');
        return false;
    }
    return true;
}

function saveUserInfo(nome, cpf, dataNascimento, telefone, telResponsavel, endereco, bairro, cid, responsavel, cep, complemento, cidade) {
    // Recuperar dados de usuários existentes do localStorage ou inicializar um array vazio
    var alunos = JSON.parse(localStorage.getItem('alunos')) || [];

    // Adicionar novos dados do aluno ao array
    alunos.push({
        nome: nome,
        cpf: cpf,
        dataNascimento: dataNascimento,
        telefone: telefone,
        telResponsavel: telResponsavel,
        endereco: endereco,
        bairro: bairro,
        cid: cid,
        responsavel: responsavel,
        cep: cep,
        complemento: complemento,
        cidade: cidade
    });

    // Salvar o array atualizado de volta no localStorage
    localStorage.setItem('alunos', JSON.stringify(alunos));
}
