function search() {
    var searchInput = document.getElementById('search');
    var Nome = searchInput.value;

    // Recuperar dados de usuário do localStorage
    var alunos = JSON.parse(localStorage.getItem('alunos')) || [];

    // Filtrar usuários com base no termo de pesquisa (nome)
    var searchResults = alunos.filter(function (aluno) {
        return aluno.nome.toLowerCase().includes(Nome.toLowerCase());
    });

    // Exibir os resultados da pesquisa na tabela de resultados
    displaySearchResults(searchResults);
}

function displaySearchResults(results) {
    var resultBody = document.getElementById('result-body');
    resultBody.innerHTML = '';

    results.forEach(function (aluno) {
        var row = document.createElement('tr');
        row.innerHTML = '<td>' + aluno.nome + '</td>' +
                        '<td>' + aluno.cpf + '</td>' +
                        '<td>' + aluno.cid + '</td>' +
                        '<td>' + aluno.dataNascimento + '</td>' +
                        '<td>' + aluno.telefone + '</td>' +
                        '<td>' + aluno.responsavel + '</td>' +
                        '<td>' + aluno.telResponsavel + '</td>' +
                        '<td>' + aluno.cep + '</td>' +
                        '<td>' + aluno.endereco + '</td>' +
                        '<td>' + aluno.complemento + '</td>' +
                        '<td>' + aluno.bairro + '</td>' +
                        '<td>' + aluno.cidade + '</td>';
        resultBody.appendChild(row);
    });
}


