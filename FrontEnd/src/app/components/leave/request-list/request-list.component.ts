import { Component, OnInit } from '@angular/core';

import { GlobalService } from 'src/app/services/global/global.service';
import { LeaveService } from 'src/app/services/leave/leave.service';
import { MessageService } from 'src/app/services/message/message.service';

import { Leave } from 'src/app/shared/types/leave';
import { Message } from 'src/app/shared/types/message';
import { Common } from 'src/app/shared/common';

@Component({
    selector: 'app-request-list',
    templateUrl: './request-list.component.html',
    styleUrls: ['./request-list.component.css'],
    standalone: false
})
export class RequestListComponent implements OnInit {

  leaveList: Leave[] = [];

  // pagination, NOTE: pagination is by 10 in server side and can't be set from client
  listCount: number = 0;
  currentPage: number = 1;
  totalPage: number = 1;

  constructor(private leaveService: LeaveService, private messageService: MessageService, private globalService: GlobalService) { }

  ngOnInit(): void {
    this.getLeaveRequestList();
  }

  getLeaveRequestList(): void {
    this.leaveService.getRequestLeaveList(this.currentPage).subscribe({
      next: (v) => {
        // console.log('MyListComponent: ' + JSON.stringify(v));
        let leaveList: Leave[] = JSON.parse(JSON.parse(JSON.stringify(v)).leave_list);
        this.listCount = JSON.parse(JSON.parse(JSON.stringify(v)).count);
        this.totalPage = Math.ceil(this.listCount / Common.PAGE_SIZE);

        leaveList.forEach(element => {
          if (element) {
            this.leaveList.push(element);
            // console.log('MyListComponent: id ' + element.id + ':' + element.name);
          }
        });
      }
    });
  }

  onItemSelected(item: Leave): void {
    this.leaveService.setCurrentLeave(item);
    this.globalService.navigate('leave/detail');
  }

  onApprove(index: number): void {
    // console.log('RequestListComponent: index: ' + index + ': ' + this.leaveList[index].title);
    this.leaveService.approveLeave(this.leaveList[index].id).subscribe(data => {
      let msg: Message = JSON.parse(JSON.stringify(data));
      this.messageService.add(msg.detail);
      // update local data
      this.leaveList.splice(index, 1);
    });
  }

  onFirstClick(): void {
    this.currentPage = 1;
    this.getLeaveRequestList();
  }

  onLastClick(): void {
    this.currentPage = this.totalPage;
    this.getLeaveRequestList();
  }

  onPreviousClick(): void {
    --this.currentPage;
    this.getLeaveRequestList();
  }

  onNextClick(): void {
    ++this.currentPage;
    this.getLeaveRequestList();
  }

  hasNextPage(): boolean {
    return !(this.currentPage * Common.PAGE_SIZE >= this.totalPage);
  }

  hasPreviousPage(): boolean {
    return (this.currentPage * Common.PAGE_SIZE > Common.PAGE_SIZE);
  }

}
