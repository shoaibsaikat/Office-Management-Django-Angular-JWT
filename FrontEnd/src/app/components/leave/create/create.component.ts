import { Component, OnInit } from '@angular/core';

import { UntypedFormGroup, UntypedFormControl, Validators } from '@angular/forms';

import { GlobalService } from 'src/app/services/global/global.service';
import { LeaveService } from 'src/app/services/leave/leave.service';
import { MessageService } from 'src/app/services/message/message.service';

import { Message } from '../../../shared/types/message';

@Component({
  selector: 'app-create',
  templateUrl: './create.component.html',
  styleUrls: ['./create.component.css']
})
export class CreateComponent implements OnInit {

  leaveForm: UntypedFormGroup = new UntypedFormGroup({
    title: new UntypedFormControl('', [Validators.required, ]),
    start: new UntypedFormControl('', [Validators.required, ]),
    end: new UntypedFormControl('', [Validators.required, ]),
    comment: new UntypedFormControl('', [Validators.required, ]),
  });
  get title() { return this.leaveForm.get('title'); }
  get start() { return this.leaveForm.get('start'); }
  get end() { return this.leaveForm.get('end'); }
  get comment() { return this.leaveForm.get('comment'); }

  days: number = 0;

  constructor(private leaveService: LeaveService, private messageService: MessageService, private globalService: GlobalService) { }

  ngOnInit(): void {
    this.leaveService.getLeaveCreationData().subscribe({
        next: (v) => { }, error: (e) => {
          this.globalService.navigate('account/manager');
        }, complete: () => { }
    });
  }

  areDatesInvalid(): boolean {
    let current = new Date();
    let start = new Date(this.start?.value);
    let end = new Date(this.end?.value);
    if (start && end &&
      start <= end &&
      (start.getMonth() > current.getMonth() || (start.getMonth() == current.getMonth() && start.getDate() >= current.getDate()))) {
      this.days = this.getDays();
      return false;
    }
    return true;
  }

  getDays(): number {
    let start = new Date(this.start?.value);
    let end = new Date(this.end?.value);
    let differenceInTime = end.getTime() - start.getTime();
    return (differenceInTime / (1000 * 3600 * 24)) + 1;
  }

  onSubmit(): void {
    this.days = this.getDays();
    let leave: any = {
      title: this.title?.value,
      start: this.start?.value,
      end: this.end?.value,
      days: this.days,
      comment: this.comment?.value,
    }
    this.leaveService.createLeave(leave).subscribe(data => {
      let msg: Message = JSON.parse(JSON.stringify(data));
      this.messageService.add(msg.detail);
      this.globalService.navigate('/leave/my_list');
    });

  }

}
