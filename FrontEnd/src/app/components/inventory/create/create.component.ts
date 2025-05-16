import { Component, OnInit } from '@angular/core';

import { UntypedFormGroup, UntypedFormControl, Validators } from '@angular/forms';

import { GlobalService } from 'src/app/services/global/global.service';
import { InventoryService } from 'src/app/services/inventory/inventory.service';
import { MessageService } from 'src/app/services/message/message.service';

import { Message } from '../../../shared/types/message';
import { Inventory } from 'src/app/shared/types/inventory';

@Component({
    selector: 'app-create',
    templateUrl: './create.component.html',
    styleUrls: ['./create.component.css'],
    standalone: false
})
export class CreateComponent implements OnInit {

  inventoryForm: UntypedFormGroup = new UntypedFormGroup({
    name: new UntypedFormControl('', [Validators.required, ]),
    unit: new UntypedFormControl('', [Validators.required, ]),
    count: new UntypedFormControl('', [Validators.required, ]),
    description: new UntypedFormControl(),
  });
  get name() { return this.inventoryForm.get('name'); }
  get unit() { return this.inventoryForm.get('unit'); }
  get count() { return this.inventoryForm.get('count'); }
  get description() { return this.inventoryForm.get('description'); }

  constructor(private inventoryService: InventoryService, private messageService: MessageService, private globalService: GlobalService) { }

  ngOnInit(): void {
  }

  onSubmit(): void {
    let item: Inventory = {
      id: -1,
      name: this.name?.value,
      count: this.count?.value,
      unit: this.unit?.value,
      description: this.description?.value,
    }
    // console.log('CreateComponent: item.name: ' + this.name?.value);
    this.inventoryService.createInventoryItem(item).subscribe(data => {
      let msg: Message = JSON.parse(JSON.stringify(data));
      this.messageService.add(msg.detail);
      this.globalService.navigate('/inventory/list');
    });

  }

}
