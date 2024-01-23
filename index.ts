function register(): void {
    const nameInput = document.getElementById('name') as HTMLInputElement;
    const emailInput = document.getElementById('email') as HTMLInputElement;
    const usernameInput = document.getElementById('username') as HTMLInputElement;
    const passwordInput = document.getElementById('password') as HTMLInputElement;

    const name = nameInput.value;
    const email = emailInput.value;
    const username = usernameInput.value;
    const password = passwordInput.value;

    if (validateRegistration(name, email, username, password)) {
        alert('Cadastro bem-sucedido. Faça o login agora.');

    } else {
        alert('Erro no cadastro. Verifique as informações inseridas.');
    }
}

function validateRegistration(name: string, email: string, username: string, password: string): boolean {

    if (!name || !email || !username || !password) {
        alert('Preencha todos os campos.');
        return false;
    }
    return true;
}
