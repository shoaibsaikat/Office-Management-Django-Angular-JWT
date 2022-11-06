import { Component, OnInit } from '@angular/core';

import { AssetService } from 'src/app/services/asset/asset.service';

import { Asset } from 'src/app/shared/types/asset';
import { AssetViewModel } from 'src/app/shared/types/asset-view-model';

import { Common } from 'src/app/shared/common';

@Component({
  selector: 'app-all-list',
  templateUrl: './all-list.component.html',
  styleUrls: ['./all-list.component.css']
})
export class AllListComponent implements OnInit {

  assetList: AssetViewModel[] = [];
  statusList: Map<number, string> = new Map<number, string>();
  typeList: Map<number, string> = new Map<number, string>();

  // pagination, NOTE: pagination is by 10 in server side and can't be set from client
  listCount: number = 0;
  currentPage: number = 1;
  totalPage: number = 1;

  constructor(private assetService: AssetService) { }

  ngOnInit(): void {
    this.updateAllList();
  }

  updateAllList(): void {
    this.assetService.getAllAssetList(this.currentPage).subscribe({
      next: (v) => {
        // console.log('MyListComponent: ' + JSON.stringify(v));
        let assetList: Asset[] = JSON.parse(JSON.parse(JSON.stringify(v)).asset_list);
        let statusList: string[] = JSON.parse(JSON.parse(JSON.stringify(v)).status);
        let typeList: string[] = JSON.parse(JSON.parse(JSON.stringify(v)).type);
        this.listCount = JSON.parse(JSON.parse(JSON.stringify(v)).count);
        this.totalPage = Math.ceil(this.listCount / Common.PAGE_SIZE);

        statusList.forEach(element => {
          if (element) {
            let status = element.toString().split(',');
            // console.log('AllListComponent: ' + status[0] + ': ' + status[1] + '\n');
            this.statusList.set(Number(status[0]), status[1]);
          }
        });

        typeList.forEach(element => {
          if (element) {
            let type = element.toString().split(',');
            // console.log('AllListComponent: ' + type[0] + ': ' + type[1] + '\n');
            this.typeList.set(Number(type[0]), type[1]);
          }
        });

        assetList.forEach(element => {
          if (element) {
            let assetViewModel: AssetViewModel = {
              id: element.id,
              model: element.model,
              name: element.name,
              purchase_date: element.purchase_date,
              serial: element.serial,
              status: this.statusList.get(element.status) || '',
              type: this.typeList.get(element.type) || '',
              user: element.user,
              user_first_name: element.user_first_name,
              user_last_name: element.user_last_name,
              warranty: element.warranty,
              description: element.description,
              next_user: element.next_user,
            }
            this.assetList.push(assetViewModel);
            // console.log('AllListComponent: id:' + assetViewModel.id + ', user:' + element.user, ', status:' + assetViewModel.status);
          }
        });
      }
    });
  }

  onFirstClick(): void {
    this.currentPage = 1;
    this.updateAllList();
  }

  onLastClick(): void {
    this.currentPage = this.totalPage;
    this.updateAllList();
  }

  onPreviousClick(): void {
    --this.currentPage;
    this.updateAllList();
  }

  onNextClick(): void {
    ++this.currentPage;
    this.updateAllList();
  }

  hasNextPage(): boolean {
    return !(this.currentPage * Common.PAGE_SIZE >= this.totalPage);
  }

  hasPreviousPage(): boolean {
    return (this.currentPage * Common.PAGE_SIZE > Common.PAGE_SIZE);
  }

}
