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
echo En componentes agregar
echo HttpClientModule,
echo FormsModule,
echo ReactiveFormsModule,
echo
echo ------------------------------------------------------
echo En shared.service.ts agregar
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
