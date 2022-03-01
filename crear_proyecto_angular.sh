ng new proyecto
ng serve --open
ng generate component people
ng generate component people/people-list
ng generate component people/people-add-edit
ng generate component people/people-delete
ng generate service shared
echo #edita app/app.modules.ts para agregar 
echo import {SharedService} from './shared.service'
echo #y modificar providers: [], por
echo providers: [SharedService],

