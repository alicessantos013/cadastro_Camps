function login(): void {
    const usernameInput = document.getElementById('username') as HTMLInputElement;
    const passwordInput = document.getElementById('password') as HTMLInputElement;

    const username = usernameInput.value;
    const password = passwordInput.value;

    if (validateRegistration(username, password)) {
        alert('Bem-Vindo!');

    } else {
        alert('Erro no login. Verifique as informações inseridas.');
    }
}

function validateRegistration(username: string, password: string): boolean {

    if (!username || !password) {
        alert('Preencha todos os campos.');
        return false;
    }
    return true;
}