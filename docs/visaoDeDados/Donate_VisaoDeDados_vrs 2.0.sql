drop database if exists donate;
create database donate;

\c donate;

create table cidade (
    id serial primary key,
    nome character varying(100) not null,
    estado character varying(2) not null,
    unique (nome, estado),
    check(estado in (
        'RS', 'SC', 'PR', 'SP', 'MG', 'RJ', 'ES', 'MS', 
        'MT', 'GO', 'DF', 'BA', 'SE', 'AL', 'PE', 'PB',
        'RN', 'CE', 'MA', 'PI', 'PA', 'AP', 'RR', 'AM',
        'RO', 'AC', 'TO'))
);

create table usuario (
    id serial primary key,
    nome character varying(100) not null,
    idade integer not null,
    cpf character varying(11) not null unique,
    telefone character varying(15),
    historico_de_compartilhamento character varying(500) not null,
    foto bytea,
    email character varying(100) not null unique,
    usuario character varying(50) not null,
    senha character varying(50) not null,
    tipo_sanguineo character varying(3) not null check (tipo_sanguineo in ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
    fator_rh character varying(3) not null check (fator_rh in ('+','-')),
    doador boolean not null,
    receptor boolean not null,
    latitude character varying(50) not null,
    longitude character varying(50) not null,
    cidade_id integer not null references cidade(id) on update cascade
);

create table buscar_donate (
    id serial primary key,
    tempo_limite timestamp without time zone not null default now(),
    tipo_anuncio character varying(20) not null check (tipo_anuncio in ('Oferecer_doacao','Solicar_doacao')),
    tipo_sanguineo character varying(3) not null check (tipo_sanguineo in ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
    fator_rh character varying(3) not null check (fator_rh in ('+','-')), 
    latitude character varying(50) not null,
    longitude character varying(50) not null,
    descricao character varying(500) not null,
    usuario_id integer not null references usuario(id) on update cascade,
    unique (latitude, longitude, descricao)
);

create table notificacao (
    id serial primary key,
    codigo character varying(50) not null unique,
    data_hora_envio timestamp without time zone not null default now(),
    usuario_id integer not null references usuario(id) on update cascade
);

create table chat (
    id serial primary key,
    data_hora_criacao timestamp without time zone not null default now(),
    usuario_id integer not null references usuario(id) on update cascade,
    unique(usuario_id,data_hora_criacao)
);

create table mensagem (
    id serial primary key,
    texto character varying(500) not null,
    data_hora timestamp without time zone not null default now(),
    lidas boolean not null,
    chat_id integer not null references chat(id) on update cascade,
    usuario_id integer not null references usuario(id) on update cascade,
    unique(usuario_id, chat_id) 
);

commit;