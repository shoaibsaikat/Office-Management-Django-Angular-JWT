import { Component, OnInit } from '@angular/core';

import { FormGroup, FormControl } from '@angular/forms';

import { GlobalService } from 'src/app/services/global/global.service';
import { DriverService } from 'src/app/services/driver/driver.service';
import { MessageService } from 'src/app/services/message/message.service';

import { Message } from 'src/app/shared/types/message';
import { User } from 'src/app/shared/types/user';
import { Common } from 'src/app/shared/common';

@Component({
  selector: 'app-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css']
})
export class ListComponent implements OnInit {

  driverList: User[] = [];

  // pagination, NOTE: pagination is by 10 in server side and can't be set from client
  listCount: number = 0;
  currentPage: number = 1;
  totalPage: number = 1;

  constructor(private driverService: DriverService, private messageService: MessageService, private globalService: GlobalService) { }

  ngOnInit(): void {
    this.updateDriverList();
  }

  updateDriverList(): void {
    this.driverService.getDriverList(this.currentPage).subscribe({
      next: (v) => {
        // console.log('ListComponent: ' + JSON.stringify(v));
        let objDriverList: User[] = JSON.parse(JSON.parse(JSON.stringify(v)).driver_list);
        this.listCount = JSON.parse(JSON.parse(JSON.stringify(v)).count);
        this.totalPage = Math.ceil(this.listCount / Common.PAGE_SIZE);

        objDriverList.forEach(element => {
          if (element) {
            this.driverList.push(element);
            // console.log('ListComponent: id ' + element.id + ':' + element.username);
          }
        });
      }
    });
  }

  onClick(item: User): void {
    this.driverService.setCurrentDriver(item);
    this.globalService.navigate('driver/edit');
  }

  onFirstClick(): void {
    this.currentPage = 1;
    this.updateDriverList();
  }

  onLastClick(): void {
    this.currentPage = this.totalPage;
    this.updateDriverList();
  }

  onPreviousClick(): void {
    --this.currentPage;
    this.updateDriverList();
  }

  onNextClick(): void {
    ++this.currentPage;
    this.updateDriverList();
  }

  hasNextPage(): boolean {
    return !(this.currentPage * Common.PAGE_SIZE >= this.totalPage);
  }

  hasPreviousPage(): boolean {
    return (this.currentPage * Common.PAGE_SIZE > Common.PAGE_SIZE);
  }

}
