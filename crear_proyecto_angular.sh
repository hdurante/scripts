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
echo ---------------------------------------------------------------
echo En app-routing.module.ts agregar al final (con esto ya no usara el # como parte de la ruta)
echo export const APP_ROUTES = RouterModule.forRoot( routes, { useHash: true });
echo En el mismo archivo por cada component que queramos acceder web agregar  su import y su path
echo import { PeopleComponent } from './people/people.component';
echo import { PeopleListComponent } from './people/people-list/people-list.component';
echo const routes: Routes = [
echo   {path: 'people', component:PeopleComponent},
echo   {path: 'peoplelist', component:PeopleListComponent}
echo ];
echo 
echo  ---------------------------------------------------------------
echo app.component.html es nuestra pagina principal si tiene cargado el html demo eliminar todo el contenido para continuar 
echo en app.component.html se agrega la navegacion (no se agrega diseño personalizar) asi como el router-outlet que permite inscrustra la pagina 
echo <div>
echo   <h3>Mi proyecto </h3>
echo   <nav>
echo   <ul>
echo     <li>
echo       <button routerLink="people">Personas</button>
echo     </li>   
echo     <li>
echo       <button routerLink="peoplelist">Lista de personas</button>
echo     </li>        
echo   </ul>
echo   </nav>
echo 
echo <router-outlet></router-outlet>
echo 
echo </div>
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
