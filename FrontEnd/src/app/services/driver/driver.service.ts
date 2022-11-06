import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { Observable } from 'rxjs';

import { Common } from '../../shared/common';
import { User } from 'src/app/shared/types/user';

@Injectable({
  providedIn: 'root'
})
export class DriverService {

  private common: Common = new Common(this.http);

  private currentDriver: User = {
    'id': 0,
    'username': '',
    'first_name': '',
    'last_name': '',
    'email': '',
    'type': 0,
    'phone1': 0,
    'phone2': 0,
    'image': '',
  };

  private baseUrl: string = this.common.getBaseUrl().concat('driver/');
  private listUrl: string = this.baseUrl.concat('list/');
  private editUrl: string = this.baseUrl.concat('edit/');

  constructor(private http: HttpClient) { }

  getDriverList(page: number = 1): Observable<string> {
    let listUrl = this.listUrl.concat('?page=' + page);
    return this.http.get<string>(listUrl, this.common.getHttpHeader());
  }

  setCurrentDriver(item: User): void {
    this.currentDriver = item;
  }

  getCurrentDriver(): User {
    return this.currentDriver;
  }

  updateDriver(item: User): Observable<string> {
    let editItemUrl: string = this.editUrl.concat(item.id + '/');
    return this.http.post<string>(editItemUrl, {
      phone1: item.phone1,
      phone2: item.phone2,
      image: '',
    }, this.common.getHttpHeader());
  }

}
