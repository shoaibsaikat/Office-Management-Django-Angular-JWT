import { Component, OnInit } from '@angular/core';
import { Validators, FormBuilder, FormGroup, FormControl, FormArray, ValidatorFn, ValidationErrors, AbstractControl } from '@angular/forms';

import { GlobalService } from 'src/app/services/global/global.service';
import { AccountService } from '../../../services/account/account.service';

@Component({
  selector: 'app-password',
  templateUrl: './password.component.html',
  styleUrls: ['./password.component.css']
})
export class PasswordComponent implements OnInit {

  passwordForm = new FormGroup({
    oldPassword: new FormControl('', [Validators.required]),
    newPassword1: new FormControl('', [Validators.required]),
    newPassword2: new FormControl('', [Validators.required]),
  }, {
    validators: [this.passwordMatchValidation()],
  });
  get oldPassword() { return this.passwordForm.get('oldPassword'); }
  get newPassword1() { return this.passwordForm.get('newPassword1'); }
  get newPassword2() { return this.passwordForm.get('newPassword2'); }

  constructor(private globalService: GlobalService, private accountService: AccountService) { }

  ngOnInit(): void {
  }

  onSubmit(): void {
    if (this.oldPassword?.errors || this.newPassword1?.errors || this.newPassword2?.errors) {
      return;
    }

    this.accountService.setPassword(this.passwordForm.value.oldPassword, this.passwordForm.value.newPassword1).subscribe(data =>  {
      // console.log('PasswordComponent: ' + data.detail);
      this.globalService.navigate('');
    });
  }

  passwordMatchValidation(): ValidatorFn {
    return (control:AbstractControl): ValidationErrors | null => {
      if (!this.passwordForm || !this.passwordForm.get('newPassword1') || !this.passwordForm.get('newPassword2')) {
        return null;
      }

      if (this.passwordForm.get('newPassword1')?.value != this.passwordForm.get('newPassword2')?.value) {
        return { noMatch: true };
      }
      return null;
    };
  }

}
