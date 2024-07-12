-- Crear tabla de estados
create table state(
    id_state serial primary key,
    name varchar(100) not null
);

-- Crear tabla de ciudades
create table town(
    id_town serial primary key,
    id_state integer not null,
    zipcode integer,
    constraint fk_state
    foreign key(id_state)
    references state(id_state)
);

-- Crear tabla de direcciones
create table adress(
    id_adress serial primary key,
    street_1 varchar (100) not null,
    street_2 varchar (100) not null,
    id_town integer not null,
    constraint fk_town
    foreign key (id_town)
    references town(id_town)
);

-- Crear tabla de tipos de usuarios
create table usertype(
    id_usertype serial primary key,
    description varchar(100),
    value boolean 
);

-- Crear tabla de usuarios
create table users(
    id_user serial primary key,
    name varchar (100) not null,
    lastname varchar(100) not null,
    email varchar(100) not null,
    password varchar(200) not null,
    age integer not null,
    phoneNumber varchar (100) not null,
    idUserType int not null,
    constraint fk_usertype
    foreign key (idUserType)
    references usertype(id_usertype)
);

-- Crear tabla de proveedores
create table providers(
    id_provider serial primary key,
    id_user integer not null,
    skill varchar (1000) not null, 
    experienceYears varchar(300),
    workShopName varchar (500),
    worckShopPhoneNumber varchar (20),
    idAdress int not null,
    constraint fk_id_user
    foreign key (id_user)
    references users(id_user),
    constraint fk_adress
    foreign key (idAdress)
    references adress(id_adress)
);

-- Crear tabla de conversaciones
create table conversation(
    id_conversation serial primary key,
    id_userOrigen int not null,
    id_userDestino int not null,
    creationDate date,
    constraint fk_userOrigen
    foreign key  (id_userOrigen)
    references users(id_user),
    constraint fk_userDestino
    foreign key  (id_userDestino)
    references users(id_user)
);

-- Crear tabla de mensajes
create table messages(
    id_message serial primary key,
    id_conversation int not null,
    content varchar (100),
    sendDate date,
    constraint fk_conversation
    foreign key (id_conversation)
    references conversation(id_conversation)
);

-- Crear tabla de estados de citas
create table statusAppointment (
    id_statusAppointment serial primary key,
    descripcion varchar (200),
    value boolean
);

-- Crear tabla de citas
create table appointment(
    id_appointment serial primary key,
    id_customer int not null,
    creationDate date not null,
    id_statusAppointment int not null,
    appointmentDate date, 
    appointmentLocation varchar(500),
    constraint fk_customer
    foreign key  (id_customer)
    references users(id_user),
    constraint fk_statusAppointment
    foreign key(id_statusAppointment)
    references statusAppointment(id_statusAppointment)
);

-- Crear tabla de acuerdos
create table agreements (
    id_agreements serial primary key,
    id_appointment int not null,
    id_provider int not null,
    description varchar(200),
    creationDate date,
    constraint fk_id_appointment
    foreign key  (id_appointment)
    references appointment(id_appointment),
    constraint fk_id_provider
    foreign key  (id_provider)
    references providers(id_provider)
);

-- Crear tabla de estados de servicios
create table statusService(
    id_statusService serial primary key,
    value boolean
);

-- Crear tabla de servicios
create table services (
    id_services serial primary key,
    id_agreements int not null,
    description varchar(500),
    creationDate date,
    id_statusService integer not null,
    constraint fk_id_statusService
    foreign key (id_statusService)
    references statusService(id_statusService)
);
