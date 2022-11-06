import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { Observable } from 'rxjs';

import { Common } from '../../shared/common';
import { Inventory } from 'src/app/shared/types/inventory';

@Injectable({
  providedIn: 'root'
})
export class InventoryService {

  private common: Common = new Common(this.http);

  private currentInventory: Inventory = {
    id: 0,
    name: '',
    count: 0,
    unit: '',
  };

  private baseUrl: string = this.common.getBaseUrl().concat('inventory/');
  private chartlistUrl: string = this.baseUrl.concat('inventory_list/');
  private quickEditUrl: string = this.baseUrl.concat('quick_edit/');
  private createUrl: string = this.baseUrl.concat('create/');
  private editUrl: string = this.baseUrl.concat('edit/');

  constructor(private http: HttpClient) { }

  getInventoryList(page: number = 1): Observable<string> {
    let listUrl = this.baseUrl.concat('?page=' + page);
    return this.http.get<string>(listUrl, this.common.getHttpHeader());
  }

  getInventoryChartList(): Observable<string> {
    return this.http.get<string>(this.chartlistUrl);
  }

  getEditInfo(item: number): Observable<string> {
    let editItemUrl: string = this.editUrl.concat(item + '/');
    return this.http.get<string>(editItemUrl, this.common.getHttpHeader());
  }

  createInventoryItem(item: Inventory): Observable<string> {
    return this.http.post<string>(this.createUrl, {
      name: item.name,
      description: item.description,
      unit: item.unit,
      count: item.count,
    }, this.common.getHttpHeader());
  }

  inventoryQuickUpdate(id: number, count: number): Observable<string> {
    return this.http.post<string>(this.quickEditUrl, {
      pk: id,
      amount: count,
    }, this.common.getHttpHeader());
  }

  updateInventory(item: Inventory): Observable<string> {
    let editItemUrl: string = this.editUrl.concat(item.id + '/');
    return this.http.post<string>(editItemUrl, {
      count: item.count,
      description: item.description,
    }, this.common.getHttpHeader());
  }

  setCurrentInventory(item: Inventory): void {
    this.currentInventory = item;
  }

  getCurrentInventory(): Inventory {
    return this.currentInventory;
  }

}
