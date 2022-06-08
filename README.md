# DataBases

Proyecto : Casino

Integrantes: Diego Morro, Huberto Martín, Carlos Herrera

El trabajo realizado para la asignatura de bases de datos nos lo hemos repartido de la siguiente manera:
- Modelo entidad-relación --> Carlos Herrera
- Modelo relacional --> Carlos Herrera
- Normalización --> Carlos Herrera
- Script inicial --> Carlos Herrera
- Procedures --> Diego Morro
- Triggers --> Diego Morro
- Despliegue de MySQL en servidor--> Diego Morro

## Modelo entidad-relación:
![EntidadRelación](https://user-images.githubusercontent.com/106917473/172675979-73298138-d731-4b94-a023-90ff6e7841cc.jpg)


## Modelo relacional y normalización:

usuario(id_, premiumId, nombre, apellido, dni, fechaNacimiento, saldo, password);<br>
    USUARIO_PK(id);<br>
    USUARIO_FK(premiumId) REFERENCES(premium.id);<br>

vetado(idUsuario_);<br>
    VETADO_PK(idUsuario);<br>
    
juego(id_, nombre);<br>
    JUEGO_PK(id);<br>

partida(id_, idJuego, idUsuario, apuesta, balance, fechaHora);<br>
    PARTIDA_PK(id);<br>
    PARTIDA_FK(idJuego) REFERENCES(juego.id);<br>
    PARTIDA_FK(idUsuario) REFERENCES(usuario.id);<br>
   
 
Normalization 2NF-3NF:

datosUsuario(dni_, nombre, apellido, fechaNacimiento, saldo);<br>
    DATOSUSUARIO_PK(dni);

usuario(id_, premiumId,dni);<br>
    USUARIO_PK(id);<br>
    USUARIO_FK(premiumId) REFERENCES(premium.id);<br>
    USUARIO_FK(dni) REFERENCES(datosUsuario.dni);<br>

vetado(idUsuario_, veto, comentario);<br>
    VETADO_PK(idUsuario);<br>
    VETADO_FK(idUsuario) REFERENCES(usuario.id);<br>
    
password(idUsuario_, password);<br>
    PASSWORD_PK(idUsuario);<br>
    PASSWORD_FK(idUsuario) REFERENCES(usuario.id);<br>

juego(id_, nombre);<br>
    JUEGO_PK(id);<br>

partida(id_, idJuego, idUsuario, apuesta, balance, fechaHora);<br>
    PARTIDA_PK(id);<br>
    PARTIDA_FK(idJuego) REFERENCES(juego.id);<br>
    PARTIDA_FK(idUsuario) REFERENCES(usuario.id);<br>
