import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';

type LoginResponse = { access_token: string }

@Injectable({
  providedIn: 'root'
})
export class LoginService {

  private apiUrl = environment.apiUrl;

  constructor(private http: HttpClient) {

  }

  login(username: string, password: string) {
    return this.http.post<LoginResponse>(this.apiUrl + "/auth/login", {
      username: username,
      password: password,
    })
  }
}
