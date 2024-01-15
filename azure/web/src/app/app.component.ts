import { Component } from '@angular/core';
import { clearToken, getToken } from './auth/auth.token';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'web';
  get isLoggedIn() { return getToken() != null }

  constructor(private router: Router) {

  }

  logout() {
    clearToken();
    this.router.navigate(['/login'])
  }
}
