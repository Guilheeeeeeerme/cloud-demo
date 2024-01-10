import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { getToken } from '../auth.token';

export const notLoggedInGuard: CanActivateFn = (route, state) => {
  let token = getToken()

  return token != null
    ? true
    : inject(Router).navigate(['/login']);
};
