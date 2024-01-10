import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './auth/login/login.component';
import { isLoggedInGuard } from './auth/guards/is-logged-in.guard';
import { notLoggedInGuard } from './auth/guards/not-logged-in.guard';
import { CloudDemoComponent } from './cloud-demo/cloud-demo/cloud-demo.component';

const routes: Routes = [
  { path: 'login', canActivate: [isLoggedInGuard], component: LoginComponent },
  { path: 'cloud-demo', canActivate: [notLoggedInGuard], component: CloudDemoComponent },
  { path: '',   redirectTo: '/cloud-demo', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
