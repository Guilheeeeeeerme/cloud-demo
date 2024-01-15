const key = 'token';

export const setToken = (token: string): void => {
    localStorage.setItem(key, token);
}

export const clearToken = (): void => {
    localStorage.removeItem(key);
}

export const getToken = (): string | null => {
    return localStorage.getItem(key);
}