import { Component, OnInit } from '@angular/core';

import { FormGroup, FormControl, Validators } from '@angular/forms';

import { GlobalService } from 'src/app/services/global/global.service';
import { DriverService } from 'src/app/services/driver/driver.service';

import { User } from 'src/app/shared/types/user';

@Component({
  selector: 'app-edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.css']
})
export class EditComponent implements OnInit {

  driver:User = this.driverService.getCurrentDriver();

  driverForm: FormGroup = new FormGroup({
    phone1: new FormControl('', [Validators.required, ]),
    phone2: new FormControl('', []),
    image: new FormControl('', []),
    description: new FormControl(),
  });
  get phone1() { return this.driverForm.get('phone1'); }
  get phone2() { return this.driverForm.get('phone2'); }
  get image() { return this.driverForm.get('image'); }

  constructor(
    private driverService: DriverService,
    private globalService: GlobalService
  ) { }

  ngOnInit(): void {
    this.driverForm.get('phone1')?.setValue('0' + this.driver.phone1);
    if (this.driver.phone2) {
      this.driverForm.get('phone2')?.setValue('0' + this.driver.phone2);
    }
  }

  onSubmit(): void {
    this.driver.phone1 = this.phone1?.value;
    this.driver.phone2 = this.phone2?.value;
    console.log('EditComponent: phone 1: ' + this.phone1?.value);
    this.driverService.updateDriver(this.driver).subscribe(data => {
      // console.log('ManagerComponent: ' + data.detail);
      this.globalService.navigate('driver/list');
    });

  }

}
