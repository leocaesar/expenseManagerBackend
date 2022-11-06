create table balance
(
    id      int auto_increment
        primary key,
    balance int not null
);

create table expense_categories
(
    id   int auto_increment
        primary key,
    name varchar(50) not null
)
    auto_increment = 4;

create table expense
(
    id               int auto_increment
        primary key,
    date             datetime     not null,
    description      varchar(100) not null,
    amount           int          not null,
    category_expense int          not null,
    constraint expense_expense_categories_id_fk
        foreign key (category_expense) references expense_categories (id)
)
    auto_increment = 2;

create table income_categories
(
    id   int auto_increment
        primary key,
    name varchar(50) not null
);

create table income
(
    id              int auto_increment
        primary key,
    date            date         not null,
    description     varchar(100) not null,
    amount          int          not null,
    category_income int          not null,
    constraint income_income_categories_id_fk
        foreign key (category_income) references income_categories (id)
);

create table users
(
    id       int auto_increment
        primary key,
    username varchar(150) not null,
    password varchar(150) not null,
    role     varchar(150) not null,
    enabled  int          not null
);

