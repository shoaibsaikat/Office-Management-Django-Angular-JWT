import { HttpClient, HttpHeaders } from '@angular/common/http';

export class Common {

    private baseUrl: string = 'http://127.0.0.1:8000/api/';

    static readonly DETAIL_NORMAL: number = 0;
    static readonly DETAIL_APPROVAL: number = 1;
    static readonly DETAIL_DISTRIBUTION: number = 2;
    static readonly PAGE_SIZE = 10;
    static readonly TOKEN_INTERVAL: number = 4 * 60 * 1000 + 50 * 1000;

    constructor(private http: HttpClient) { }

    getBaseUrl(): string {
        return this.baseUrl;
    }

    getHttpHeader(): {} {
        return {
          headers: new HttpHeaders({
          'Content-Type':  'application/json',
          'Authorization': 'Bearer ' + localStorage.getItem('access_token'),
        })}
    }

}