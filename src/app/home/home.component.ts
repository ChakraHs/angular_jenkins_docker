import { Component, Inject, NgModule, inject } from '@angular/core';
import { HousingLocationComponent } from '../housing-location/housing-location.component';
import { HousingLocation } from '../housing-location';
import { CommonModule } from '@angular/common';
import { HousingService } from '../housing.service';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [HousingLocationComponent,CommonModule],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent {
  housingService:HousingService = inject(HousingService);
  housingLocationList: HousingLocation[] = [];
  constructor(){
    this.housingLocationList=this.housingService.getAllHousingLocations();
  }
}