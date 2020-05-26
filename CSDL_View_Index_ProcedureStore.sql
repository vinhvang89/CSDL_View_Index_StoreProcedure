create database VIP_practice ;
use VIP_practice;
create table products(
    Product_ID int auto_increment,
    Product_Name varchar(255) not null ,
    Product_Price double not null ,
    check ( Product_Price > 0 ),
    Product_Description varchar(255),
    Product_Status varchar(255),
    primary key (Product_ID)

);
insert into products (Product_Name, Product_Price, Product_Description, Product_Status) values
('Lockheed Martin F-22',29000000,'Raptor','Available');
insert into products (Product_Name, Product_Price, Product_Description, Product_Status) values
    ('Lockheed Martin F-35B',75000000,'Lightning','Available');
insert into products (Product_Name, Product_Price, Product_Description, Product_Status) values
    ('Sukhoi SU57',50000000,'T50','Available');
insert into products (Product_Name, Product_Price, Product_Description, Product_Status) values
    ('Boeing F18E',22000000,'Super Hornet','Available');
insert into products (Product_Name, Product_Price, Product_Description, Product_Status) values
    ('Yamato Warship',1200000000,'Proud of Japanese Marine','Down');
select * from products;
CREATE UNIQUE INDEX id_index ON products ( Product_ID);
create index name_price on products (Product_Name,Product_Price);
explain select * from products where Product_ID = 4;
select * from products where  Product_ID = 4;
create view view_product as select Product_ID , Product_Name , Product_Price, Product_Status from products;
select  * from view_product;
create or replace view view_product as select Product_ID , product_name from products;
drop view vip_practice.view_product;
delimiter //
create procedure showProduct()
begin
    select * from products;
end //
delimiter ;

delimiter //
create  procedure newProduct(
 in name varchar(255), in price double, in description varchar(255) , in status varchar(255)
)
begin
    insert into products (Product_Name, Product_Price, Product_Description, Product_Status)
    values ( name , price , description , status);
end //
delimiter ;

delimiter //
create procedure editProductNameByID(in id int ,in name varchar(255) )
begin
    update products set Product_Name = name where Product_ID = id;
end //
delimiter ;

delimiter //
create  procedure removeProductByID( in id int)
begin
    delete from products where Product_ID = id;
end //
delimiter ;
call showProduct();
call newProduct('Iphone',1200,'11 ProMax','Available');
call editProductNameByID(6,'BPhone');
call removeProductByID(6);