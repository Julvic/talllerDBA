CREATE DATABASE universidadTDBA;
USE universidadTDBA;
drop table if exists equipo;
CREATE TABLE equipo
(
    idEq integer primary key auto_increment not null,
    nombre varchar(50)not null,
    categoria varchar(15) not null,
    idCamp  integer not null ,
    foreign key (idCamp) references  campeonato(idCamp)
);
insert into equipo(nombre, categoria,idCamp) VALUES ('Unifranz','varones',1);
insert into equipo(nombre, categoria,idCamp) VALUES ('Univalle','mujeres',1);
drop table if exists jugadores;
CREATE TABLE jugadores
(
    idJug integer primary key auto_increment not null,
    nombre varchar(50)not null,
    apellido varchar(50) not null,
    edad integer,
    idEq integer not null,
    foreign key (idEq) references equipo(idEq)
);

insert into jugadores(nombre, apellido, edad, idEq)
values  ('Juan','Perez',22,1);
insert into jugadores(nombre, apellido, edad, idEq)
values  ('Pedro','Ramoz',23,1);
insert into jugadores(nombre, apellido, edad, idEq)
values  ('Juana','Quiroz',25,2);
insert into jugadores(nombre, apellido, edad, idEq)
values  ('ana','Perez',20,2);

CREATE TABLE campeonato
(
    idCamp integer primary key auto_increment not null,
    nombre varchar(50)
);
insert into campeonato(nombre) values ('Unifranzito 2020');

select jug.nombre, eq.nombre, camp.nombre
from equipo as eq
inner join  jugadores as jug on eq.idEq = jug.idEq
inner join campeonato as camp on eq.idCamp = camp.idCamp
where eq.nombre='Univalle';

create function maxEdadJugadores() returns integer
begin
    declare maxEdad integer;
    set maxEdad=0;
    select max(jug.edad) into maxEdad
from jugadores as jug;
    return maxEdad;
end;

select maxEdadJugadores() as maxEdadJug;

create function agregarRegistro(nombreTabla text) returns integer
begin
    if nombreTabla = 'jugadores'
        then
        insert into jugadores(nombre, apellido, edad, idEq) 
        values ('pepito2','Perez2',30,1);
    end if;
    if nombreTabla = 'equipo'
        then
        insert into equipo(idEq, nombre, categoria, idCamp) 
        values ('not Fornd','juan','varones',30,1);
    end if;

end;
select agregarRegistro('equipo');