import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HTTP_INTERCEPTORS, provideHttpClient, withInterceptorsFromDi } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { GoogleChartsModule } from 'angular-google-charts'; 
import { RequestInterceptor } from './shared/request-interceptor';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SigninComponent } from './components/account/signin/signin.component';
import { SignoutComponent } from './components/account/signout/signout.component';
import { HomeComponent } from './components/home/home.component';
import { ProfileComponent } from './components/account/profile/profile.component';
import { ManagerComponent } from './components/account/manager/manager.component';
import { PasswordComponent } from './components/account/password/password.component';
import { MessageComponent } from './components/message/message.component';
import { MyListComponent as AssetMyListComponent } from './components/asset/my-list/my-list.component';
import { AllListComponent as AssetAllListComponent } from './components/asset/all-list/all-list.component';
import { PendingListComponent as AssetPendingListComponent } from './components/asset/pending-list/pending-list.component';
import { CreateComponent as AssetCreateComponent } from './components/asset/create/create.component';
import { EditComponent as AssetEditComponent } from './components/asset/edit/edit.component';
import { ListComponent as InventoryListComponent } from './components/inventory/list/list.component';
import { CreateComponent as InventoryCreateComponent } from './components/inventory/create/create.component';
import { EditComponent as InventoryEditComponent } from './components/inventory/edit/edit.component';
import { CreateComponent as RequisitionCreateComponent } from './components/requisition/create/create.component';
import { HistoryComponent as RequisitionHistoryComponent } from './components/requisition/history/history.component';
import { MyListComponent as RequisitionMyListComponent } from './components/requisition/my-list/my-list.component';
import { DetailComponent as RequisitionDetailComponent } from './components/requisition/detail/detail.component';
import { PendingApprovalComponent as RequisitionPendingApprovalComponent } from './components/requisition/pending-approval/pending-approval.component';
import { PendingDistributionComponent as RequisitionPendingDistributionComponent } from './components/requisition/pending-distribution/pending-distribution.component';
import { MyListComponent as LeaveMyListComponent } from './components/leave/my-list/my-list.component';
import { DetailComponent as LeaveDetailComponent } from './components/leave/detail/detail.component';
import { RequestListComponent as LeaveRequestListComponent } from './components/leave/request-list/request-list.component';
import { SummaryComponent as LeaveSummaryComponent } from './components/leave/summary/summary.component';
import { CreateComponent as LeaveCreateComponent } from './components/leave/create/create.component';
import { LoadingComponent } from './components/loading/loading.component';

@NgModule({ declarations: [
        AppComponent,
        SigninComponent,
        SignoutComponent,
        HomeComponent,
        ProfileComponent,
        ManagerComponent,
        PasswordComponent,
        MessageComponent,
        AssetMyListComponent,
        AssetAllListComponent,
        AssetPendingListComponent,
        AssetCreateComponent,
        AssetEditComponent,
        InventoryListComponent,
        InventoryCreateComponent,
        InventoryEditComponent,
        RequisitionCreateComponent,
        RequisitionHistoryComponent,
        RequisitionMyListComponent,
        RequisitionDetailComponent,
        RequisitionPendingApprovalComponent,
        RequisitionPendingDistributionComponent,
        LeaveMyListComponent,
        LeaveDetailComponent,
        LeaveRequestListComponent,
        LeaveSummaryComponent,
        LeaveCreateComponent,
        LoadingComponent,
    ],
    bootstrap: [AppComponent], imports: [BrowserModule,
        FormsModule,
        ReactiveFormsModule,
        AppRoutingModule,
        GoogleChartsModule], providers: [
        { provide: HTTP_INTERCEPTORS, useClass: RequestInterceptor, multi: true },
        provideHttpClient(withInterceptorsFromDi())
    ] })
export class AppModule { }
