Create table Wilaya
    (
        Code smallint primary key,
        Designation varchar(30) unique
    );

Create table Equipe
    (
        Sigle varchar(8) primary key,
        NomEqp varchar(50) unique not null,
        Couleurs varchar(30) not null,
        Wilaya smallint not null references Wilaya (Code) on update cascade on delete cascade
    );

Create table Joueur
    (
        Numero smallint,
        Nom varchar(50) not null,
        Equipe varchar(8) not null references Equipe (Sigle) on update cascade on delete cascade,
        primary key (Numero,Equipe)
    );

Create table Stade
    (
        ID int primary key,
        NomStade varchar(50) not null,
        Wilaya smallint not null,
        foreign key (Wilaya) references Wilaya (Code) on update cascade on delete cascade
    );

Create table Rencontre
    (
        NumeroRencontre int primary key,
        EquipeA varchar(8) not null references Equipe (Sigle)on update cascade on delete cascade,
        ButsEquipeA smallint default 0  check (ButsEquipeA>=0),
        ButsEquipeB smallint  default 0 check (ButsEquipeB>=0),
        EquipeB varchar(8) not null references Equipe (Sigle)on update cascade on delete cascade,
        Stade int not null references Stade (ID)on update cascade on delete cascade,
        DateRencontre DATETIME,
        check (EquipeA<>EquipeB)
    );

Create table Marquer
    (
        Rencontre int not null references Rencontre (NumeroRencontre),
        Equipe varchar(8) not null,
        NumeroJoueur smallint not null,
        MinuteBut int not null,
        primary key (Rencontre,Equipe,NumeroJoueur,MinuteBut),
        foreign key (numeroJoueur,Equipe) references Joueur (numero,Equipe) on update cascade on delete cascade
    );
