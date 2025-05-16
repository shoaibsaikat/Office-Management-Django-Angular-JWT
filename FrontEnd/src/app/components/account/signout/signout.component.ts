import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';

import { GlobalService } from 'src/app/services/global/global.service';
import { AccountService } from '../../../services/account/account.service';
import { MessageService } from 'src/app/services/message/message.service';

@Component({
    selector: 'app-signout',
    templateUrl: './signout.component.html',
    styleUrls: ['./signout.component.css'],
    standalone: false
})
export class SignoutComponent implements OnInit {

  constructor(private globalService: GlobalService, private accountService: AccountService, private messageService: MessageService) { }

  ngOnInit(): void {
  }

  signout(): void  {
    this.accountService.logOut().subscribe(data => {
      // console.log('SignoutComponent: ' + data.detail);
      this.globalService.logOut();
    });
  }

}
