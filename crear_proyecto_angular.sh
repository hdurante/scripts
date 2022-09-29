ng new proyecto
ng serve --open
ng generate component people
ng generate component people/people-list
ng generate component people/people-add-edit
ng generate component people/people-delete
ng generate service shared
echo ------------------------------------------------------
echo #edita app/app.modules.ts para agregar 
echo import {SharedService} from './shared.service'
echo #y modificar providers: [], por
echo providers: [SharedService],
echo import {HttpClientModule} from '@angular/common/http'
echo import { FormsModule,ReactiveFormsModule } from '@angular/forms'
echo En imports agregar
echo HttpClientModule,
echo FormsModule,
echo ReactiveFormsModule,
echo
echo ------------------------------------------------------
echo En shared.service.ts modificar
echo import { HttpClient } from '@angular/common/http';
echo import { Observable } from 'rxjs';
echo constructor(private http:HttpClient) { }
echo y agregar
echo  getPeopleList():Observable<any[]>{
echo    return this.http.get<any[]>(this.urlApiPeoples+'/people/')
echo  }
echo 
echo  addPeople(val:any){
echo    return this.http.post(this.urlApiPeoples+'/people/',val)
echo  }
echo 
echo  updatePeople(val:any){
echo    return this.http.put(this.urlApiPeoples+'/people/',val)
echo  }
echo 
echo  deletePeople(val:any){
echo    return this.http.delete(this.urlApiPeoples+'/people/',val)
echo  }
echo ------------------------------------------------------
echo Agregar Charts.js
npm install chart.js ng2-charts
echo agregar en app.modules.ts
echo import { NgChartsModule } from 'ng2-charts';
echo y en imports 
echo NgChartsModule,
echo en la vista agregar ViewChild al import de angular
echo import { NgModule, Component, OnInit, ViewChild } from '@angular/core';
echo @ViewChild('chartNombre') chartNombre: any;
echo GeneraReporte() {
echo     let canvas = this.chartNombre.nativeElement;
echo     let ctx = canvas.getContext('2d');

echo     new Chart(ctx, {
echo       type: 'bar',
echo       data: {
echo         labels: ['Label1','Label2','Label3']
echo         datasets: [{
echo           label: 'Titulo Reporte',
echo           data: ['Valor1','Valor2','Valor3'],
echo           backgroundColor: [
echo             'rgba(54, 162, 235, 0.2)'

echo           ],
echo           borderColor: [
echo             'rgba(54, 162, 235, 1)'

echo           ],
echo           borderWidth: 1
echo         }]
echo       },
echo       options: {
echo         scales: {
echo           y: {
echo             beginAtZero: true
echo           }
echo         }
echo       }
echo     });
echo   }
