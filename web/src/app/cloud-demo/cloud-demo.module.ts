import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { CloudDemoComponent } from './cloud-demo/cloud-demo.component';



@NgModule({
  declarations: [
    CloudDemoComponent
  ],
  imports: [
    CommonModule
  ],
  exports: [
    CloudDemoComponent
  ]
})
export class CloudDemoModule { }
