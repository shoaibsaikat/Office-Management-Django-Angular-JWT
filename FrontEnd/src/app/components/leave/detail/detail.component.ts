import { Component, OnInit } from '@angular/core';

import { GlobalService } from 'src/app/services/global/global.service';
import { LeaveService } from 'src/app/services/leave/leave.service';
import { MessageService } from 'src/app/services/message/message.service';

import { Leave } from '../../../shared/types/leave';
import { User } from 'src/app/shared/types/user';
import { Message } from 'src/app/shared/types/message';

@Component({
    selector: 'app-detail',
    templateUrl: './detail.component.html',
    styleUrls: ['./detail.component.css'],
    standalone: false
})
export class DetailComponent implements OnInit {

  leave: Leave = this.leaveService.getEmptyLeave();
  user: User = this.globalService.getUser();

  constructor(private leaveService: LeaveService, private messageService: MessageService, private globalService: GlobalService) { }

  ngOnInit(): void {
    this.leave = this.leaveService.getCurrentLeave();
  }

  onApprove(): void {
    // console.log('RequestListComponent: index: ' + index + ': ' + this.leaveList[index].title);
    this.leaveService.approveLeave(this.leave.id).subscribe(data => {
      let msg: Message = JSON.parse(JSON.stringify(data));
      this.messageService.add(msg.detail);
      // update local data
      this.leave = this.leaveService.getEmptyLeave();
    });
  }

}
