 -- *roles*
use supermercado;

select
r.idRol, r.rol, o.idOpcion, o.opcion
from  asignacionRolesOpciones a
join roles r on a.idRol=r.idRol
join opciones o on a.idopcion=o.idOpcion
order by r.idRol, o.idOpcion;


-- *CREACION DE ROLES*
create role if not exists 'SysAdmin';
create role if not exists 'Director';
create role if not exists 'Docente';
create role if not exists 'RRHH';


