import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

import { FormGroup, FormControl, Validators } from '@angular/forms';

import { GlobalService } from 'src/app/services/global/global.service';
import { AssetService } from 'src/app/services/asset/asset.service';

import { Asset } from 'src/app/shared/types/asset';

@Component({
  selector: 'app-edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.css']
})
export class EditComponent implements OnInit {

  id: number = 0;

  assetForm: FormGroup = new FormGroup({
    name: new FormControl('', [Validators.required, ]),
    warranty: new FormControl('', [Validators.required, ]),
    status: new FormControl('', [Validators.required, ]),
    description: new FormControl(),
  });
  get name() { return this.assetForm.get('name'); }
  get warranty() { return this.assetForm.get('warranty'); }
  get status() { return this.assetForm.get('status'); }
  get description() { return this.assetForm.get('description'); }

  statusList: Map<number, string> = new Map<number, string>();

  constructor(private activatedRoute: ActivatedRoute, private assetService: AssetService, private globalService: GlobalService) { }

  ngOnInit(): void {

    this.activatedRoute.paramMap.subscribe(params => {
        this.id = Number(params.get('id'));
        // console.log('EditComponent: ' + this.id);

        this.assetService.getEditInfo(this.id).subscribe({
          next: (v) => {
            // console.log('EditComponent: ' + JSON.stringify(v));
            let objAsset: Asset = JSON.parse(JSON.parse(JSON.stringify(v)).asset);
            let objStatusList: [{}] = JSON.parse(JSON.parse(JSON.stringify(v)).status);
            // console.log('EditComponent: ' + JSON.stringify(objAsset));
            objStatusList.forEach(element => {
              if (element) {
                let status = element.toString().split(',');
                // console.log('EditComponent: ' + status[0] + ': ' + status[1] + '\n');
                this.statusList.set(Number(status[0]), status[1]);
              }
            });
            this.name?.setValue(objAsset.name);
            this.warranty?.setValue(objAsset.warranty);
            this.description?.setValue(objAsset.description);
            this.status?.setValue(objAsset.status);
          }
        });
    });
  }

  onSubmit(): void {
    let asset = {
      id: this.id,
      name: this.name?.value,
      warranty: this.warranty?.value,
      status: this.status?.value,
      description: this.description?.value || '',
    };

    this.assetService.updateAsset(asset).subscribe(data => {
      // console.log('ManagerComponent: ' + data.detail);
      this.globalService.navigate('asset/all_list');
    });
    // console.log('EditComponent: ' + asset.description + ', ' + asset.status + ', ' + asset.warranty);
  }

  checkIfSelected(item: number): boolean {
    // console.log('EditComponent: checkIfSelected()' + item + ', ' + this.status?.value);
    return true ? item == this.status?.value : false;
  }

}
