import { Component, OnInit } from '@angular/core';

import { ChartType } from 'angular-google-charts';

import { GlobalService } from 'src/app/services/global/global.service';
import { InventoryService } from 'src/app/services/inventory/inventory.service';
import { MessageService } from 'src/app/services/message/message.service';

import { Inventory } from 'src/app/shared/types/inventory';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  title = 'Inventory';
  type = ChartType.BarChart;
  data: any[] = [];
  columnNames = ['Item', 'Amount'];
  options = { 'is3D': true, colors: ['#81E1F5', '#EF666D'] };
  // width = 800;
  height = 500;

  constructor(private inventoryService: InventoryService, private messageService: MessageService, private globalService: GlobalService) {
    this.getData();
  }

  ngOnInit(): void {
    this.getData();
  }

  getData(): void {
    this.inventoryService.getInventoryChartList().subscribe({
      next: (v) => {
        // console.log('HomeComponent: ' + JSON.stringify(v));
        this.data = [];
        let objInventoryList: Inventory[] = JSON.parse(JSON.parse(JSON.stringify(v)).inventory_list);
        objInventoryList.forEach(element => {
          if (element) {
            let tmp = [];
            tmp.push(element.name);
            tmp.push(element.count);
            this.data.push(tmp);
          }
        });
      }
    });
  }

}
