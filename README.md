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

usuario(id_, premiumId, nombre, apellido, dni, fechaNacimiento, saldo, password);
    USUARIO_PK(id);
    USUARIO_FK(premiumId) REFERENCES(premium.id);

vetado(idUsuario_);
    VETADO_PK(idUsuario);
    
juego(id_, nombre);
    JUEGO_PK(id);

partida(id_, idJuego, idUsuario, apuesta, balance, fechaHora);
    PARTIDA_PK(id);
    PARTIDA_FK(idJuego) REFERENCES(juego.id);
    PARTIDA_FK(idUsuario) REFERENCES(usuario.id);
   
 
Normalization 2NF-3NF:

ventajas(id_,cantidadRecuperable, avatares);
        VENTAJAS_PK(id);

premium(id_, ventajasId, cuota);
    PREMIUM_PK(id);
    PREMIUM_FK(ventajasId) REFERENCES(ventajas.id)

datosUsuario(dni_, nombre, apellido, fechaNacimiento, saldo);
    DATOSUSUARIO_PK(dni);

usuario(id_, premiumId,dni);
    USUARIO_PK(id);
    USUARIO_FK(premiumId) REFERENCES(premium.id);
    USUARIO_FK(dni) REFERENCES(datosUsuario.dni);

vetado(idUsuario_, veto, comentario);
    VETADO_PK(idUsuario);
    VETADO_FK(idUsuario) REFERENCES(usuario.id);

juego(id_, nombre);
    JUEGO_PK(id);

partida(id_, idJuego, idUsuario, apuesta, balance, fechaHora);
    PARTIDA_PK(id);
    PARTIDA_FK(idJuego) REFERENCES(juego.id);
    PARTIDA_FK(idUsuario) REFERENCES(usuario.id);
