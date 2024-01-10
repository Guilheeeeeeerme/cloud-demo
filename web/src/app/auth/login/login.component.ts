import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { clearToken, setToken } from '../auth.token';
import { LoginService } from '../login.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent {
  loginForm = new FormGroup({
    username: new FormControl('', [Validators.required]),
    password: new FormControl('', [Validators.required]),
  });

  constructor(private loginService: LoginService, private router: Router) {

  }

  signIn(event: any) {
    const model = this.loginForm.value;

    if (model.username && model.password) {
      this.loginService.login(model.username, model.password).subscribe({
        next: (response) => {
          setToken(response.access_token);
          this.router.navigate(['/'])
        },
        error: () => {
          clearToken();
          this.router.navigate(['/login'])
        }
      });
    }

  }
}
