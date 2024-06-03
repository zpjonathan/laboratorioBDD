-- CONSULTAS SQL 
-- Realizar 2 consultas, que lleven al menos, un campo definido y WHERE.

  select*from cliente
  where nombreCliente='juan';
  
   select *from  cliente
   where  apellidocliente = 'perez';
   -- Realizar 2 actualizaciones que lleven al menos, un campo definido y WHERE.
   
 update empleado
 set nombreEmpleado = 'peter', apellidoEmpleado='lopwz'-- antes  pedro hernandes
 where idEmpleado= 1;
 select*from empleado;
 
  update empleado
  set DUIEmpleado= 12345677,correoEmpleado= 'lopws@eaproace.com' -- antes pedro@e´proace.com
  where idEmpleado=1;
  select*from empleado;
  -- Realizar 2 eliminaciones que lleven WHERE.
  select*from direccion;
  
delete from  direccion where  idDireccion=2;
delete from direcion where idDireccion =  4;
   
  