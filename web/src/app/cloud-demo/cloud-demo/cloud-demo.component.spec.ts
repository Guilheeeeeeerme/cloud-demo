import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CloudDemoComponent } from './cloud-demo.component';

describe('CloudDemoComponent', () => {
  let component: CloudDemoComponent;
  let fixture: ComponentFixture<CloudDemoComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [CloudDemoComponent]
    });
    fixture = TestBed.createComponent(CloudDemoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
