import { Component, OnInit } from '@angular/core';

import { UntypedFormGroup, UntypedFormControl, Validators } from '@angular/forms';

import { GlobalService } from 'src/app/services/global/global.service';
import { InventoryService } from 'src/app/services/inventory/inventory.service';

import { Inventory } from 'src/app/shared/types/inventory';

@Component({
    selector: 'app-edit',
    templateUrl: './edit.component.html',
    styleUrls: ['./edit.component.css'],
    standalone: false
})
export class EditComponent implements OnInit {

  id: number = 0;
  unit: string = '';
  name: string = '';
  inventoryForm: UntypedFormGroup = new UntypedFormGroup({
    count: new UntypedFormControl('', [Validators.required, ]),
    description: new UntypedFormControl(),
  });
  get count() { return this.inventoryForm.get('count'); }
  get description() { return this.inventoryForm.get('description'); }

  constructor(
    private inventoryService: InventoryService,
    private globalService: GlobalService) { }

  ngOnInit(): void {
    let item = this.inventoryService.getCurrentInventory();
    this.id = item.id;
    this.name = item.name;
    this.unit = item.unit;
    this.inventoryForm.get('count')?.setValue(item.count);
    this.inventoryForm.get('description')?.setValue(item.description);
  }

  onSubmit(): void {
    let item:Inventory = {
      id: this.id,
      name: this.name,
      count: this.count?.value,
      unit: this.unit,
      description: this.description?.value,
    }
    // console.log('EditComponent: item.name: ' + this.name?.value);
    this.inventoryService.updateInventory(item).subscribe(data => {
      // console.log('ManagerComponent: ' + data.detail);
      this.globalService.navigate('inventory/list');
    });

  }

}
