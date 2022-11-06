import { Component, OnInit } from '@angular/core';

import { FormGroup, FormControl, Validators } from '@angular/forms';

import { GlobalService } from 'src/app/services/global/global.service';
import { DriverService } from 'src/app/services/driver/driver.service';
import { MessageService } from 'src/app/services/message/message.service';

import { Message } from '../../../shared/types/message';
import { Route } from '../../../shared/types/route';

@Component({
  selector: 'app-route-create',
  templateUrl: './route-create.component.html',
  styleUrls: ['./route-create.component.css']
})
export class RouteCreateComponent implements OnInit {

  routeForm: FormGroup = new FormGroup({
    name: new FormControl('', [Validators.required, ]),
    description: new FormControl(),
  });
  get name() { return this.routeForm.get('name'); }
  get description() { return this.routeForm.get('description'); }

  constructor(private routeService: DriverService, private messageService: MessageService, private globalService: GlobalService) { }

  ngOnInit(): void {
  }

  onSubmit(): void {
    // let item: Route = {
    //   id: -1,
    //   name: this.name?.value,
    //   description: this.description?.value,
    // }
    // console.log('CreateComponent: item.name: ' + this.name?.value);
    // this.routeService.createRoute(item).subscribe(data => {
    //   let msg: Message = JSON.parse(JSON.stringify(data));
    //   this.messageService.add(msg.detail);
    //   this.globalService.navigate('/driver/route_list');
    // });
  }

}
