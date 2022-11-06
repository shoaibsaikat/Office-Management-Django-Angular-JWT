import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { Observable, of } from 'rxjs';

import { User } from '../../shared/types/user';
import { SignIn } from '../../shared/types/signin';
import { Message } from '../../shared/types/message';
import { Common } from '../../shared/common';


@Injectable({
  providedIn: 'root'
})

export class AccountService {

  private common: Common = new Common(this.http);

  private baseUrl: string = this.common.getBaseUrl().concat('user/');
  private logInUrl: string = this.common.getBaseUrl().concat('token/');
  private refreshUrl: string = this.common.getBaseUrl().concat('token/refresh/');
  private logOutUrl: string = this.baseUrl.concat('signout/');
  private profileUrl: string = this.baseUrl.concat('change_profile/');
  private managerUrl: string = this.baseUrl.concat('change_manager/');
  private passwordUrl: string = this.baseUrl.concat('change_password/');
  private userUrl: string = this.baseUrl.concat('get/');

  constructor(private http: HttpClient) { }

  logIn(user: SignIn): Observable<string> {
    return this.http.post<string>(this.logInUrl, {
      username: user.username,
      password: user.password1,
    });
  }

  getAccessToken(refreshToken: string): Observable<string> {
    return this.http.post<string>(this.refreshUrl, {
      refresh: refreshToken,
    });
  }

  logOut(): Observable<Message> {
    return this.http.post<Message>(this.logOutUrl, null, this.common.getHttpHeader());
  }

  getUserInfo(): Observable<User> {
    return this.http.get<User>(this.userUrl, this.common.getHttpHeader());
  }

  changeInfo(user: User): Observable<Message> {
    return this.http.post<Message>(this.profileUrl, {
      first_name: user.first_name,
      last_name: user.last_name,
      email: user.email || '',
    }, this.common.getHttpHeader());
  }

  getMangerList(): Observable<string> {
    return this.http.get<string>(this.managerUrl, this.common.getHttpHeader());
  }

  setManger(id: number): Observable<Message> {
    return this.http.post<Message>(this.managerUrl, {
      manager: id,
    }, this.common.getHttpHeader());
  }

  setPassword(last_pass: string, new_pass: string): Observable<Message> {
    return this.http.post<Message>(this.passwordUrl, {
      lastpassword: last_pass,
      newpassword: new_pass,
    }, this.common.getHttpHeader());
  }

}
