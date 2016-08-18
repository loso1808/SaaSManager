

insert into "user" ("id","username","firstName","lastName") values (0, 'app','app','server');

Insert into "role" ("id","name","description") values (4,'viewer','Can view data in the shared Peony repo');
Insert into "role" ("id","name","description") values (5,'contributor','Can add data into the shared Peony repo');
Insert into "role" ("id","name","description") values (1,'editor','Can edit their own non-shared data');
Insert into "role" ("id","name","description") values (2,'admin','Full access to all app functionality.');
Insert into "role" ("id","name","description") values (3,'user_manager','Can manage users and assign roles.');

insert into "user" ("id","username","firstName","lastName", "password", "activated", "activeFlag") 
values (1, 'admin','Admin','User', '$2a$10$a3BOTytYHBko.I4aKpAPR.4b6Sr3s93mUH.UNwMyDGhdxo42sm.GW', 1, 1);
insert into "user" ("id","username","firstName","lastName", "password", "activated", "activeFlag") 
values (2, 'tnrich','Thomas','Rich', '$2a$10$a3BOTytYHBko.I4aKpAPR.4b6Sr3s93mUH.UNwMyDGhdxo42sm.GW', 1, 1);
insert into "user" ("id","username","firstName","lastName", "password", "activated", "activeFlag") 
values (3, 'rpavez','Rodrigo','Pavez', '$2a$10$a3BOTytYHBko.I4aKpAPR.4b6Sr3s93mUH.UNwMyDGhdxo42sm.GW', 1, 1);
insert into "user" ("id","username","firstName","lastName", "password", "activated", "activeFlag") 
values (4, 'kcraft','Kyle','Craft', '$2a$10$a3BOTytYHBko.I4aKpAPR.4b6Sr3s93mUH.UNwMyDGhdxo42sm.GW', 1, 1);
insert into "user" ("id","username","firstName","lastName", "password", "activated", "activeFlag") 
values (5, 'athomas','Adam','Thomas', '$2a$10$a3BOTytYHBko.I4aKpAPR.4b6Sr3s93mUH.UNwMyDGhdxo42sm.GW', 1, 1);
insert into "user" ("id","username","firstName","lastName", "password", "activated", "activeFlag") 
values (6, 'eli','Ethan','Li', '$2a$10$a3BOTytYHBko.I4aKpAPR.4b6Sr3s93mUH.UNwMyDGhdxo42sm.GW', 1, 1);
insert into "user" ("id","username","firstName","lastName", "password", "activated", "activeFlag") 
values (7, 'jashby','Joe','Ashby', '$2a$10$a3BOTytYHBko.I4aKpAPR.4b6Sr3s93mUH.UNwMyDGhdxo42sm.GW', 1, 1);
insert into "user" ("id","username","firstName","lastName", "password", "activated", "activeFlag") 
values (8, 'sd2','Sam','DeNicola', '$2a$10$a3BOTytYHBko.I4aKpAPR.4b6Sr3s93mUH.UNwMyDGhdxo42sm.GW', 1, 1);
insert into "user" ("id","username","firstName","lastName", "password", "activated", "activeFlag") 
values (9, 'tnrich2','Thomas','Rich', '$2a$10$a3BOTytYHBko.I4aKpAPR.4b6Sr3s93mUH.UNwMyDGhdxo42sm.GW', 1, 1);
insert into "user" ("id","username","firstName","lastName", "password", "activated", "activeFlag") 
values (10, 'rpavez2','Rodrigo','Pavez', '$2a$10$a3BOTytYHBko.I4aKpAPR.4b6Sr3s93mUH.UNwMyDGhdxo42sm.GW', 1, 1);
insert into "user" ("id","username","firstName","lastName", "password", "activated", "activeFlag") 
values (11, 'kcraft2','Kyle','Craft', '$2a$10$a3BOTytYHBko.I4aKpAPR.4b6Sr3s93mUH.UNwMyDGhdxo42sm.GW', 1, 1);
insert into "user" ("id","username","firstName","lastName", "password", "activated", "activeFlag") 
values (12, 'athomas2','Adam','Thomas', '$2a$10$a3BOTytYHBko.I4aKpAPR.4b6Sr3s93mUH.UNwMyDGhdxo42sm.GW', 1, 1);
insert into "user" ("id","username","firstName","lastName", "password", "activated", "activeFlag") 
values (13, 'eli2','Ethan','Li', '$2a$10$a3BOTytYHBko.I4aKpAPR.4b6Sr3s93mUH.UNwMyDGhdxo42sm.GW', 1, 1);
insert into "user" ("id","username","firstName","lastName", "password", "activated", "activeFlag") 
values (14, 'jashby2','Joe','Ashby', '$2a$10$a3BOTytYHBko.I4aKpAPR.4b6Sr3s93mUH.UNwMyDGhdxo42sm.GW', 1, 1);
insert into "user" ("id","username","firstName","lastName", "password", "activated", "activeFlag") 
values (15, 'sd','Sam','DeNicola', '$2a$10$a3BOTytYHBko.I4aKpAPR.4b6Sr3s93mUH.UNwMyDGhdxo42sm.GW', 1, 1);
insert into "user" ("id","username","firstName","lastName", "password", "activated", "activeFlag") 
values (16, 'tgreen','Taoh','Green', '$2a$10$a3BOTytYHBko.I4aKpAPR.4b6Sr3s93mUH.UNwMyDGhdxo42sm.GW', 1, 1);
insert into "user" ("id","username","firstName","lastName", "password", "activated", "activeFlag") 
values (17, 'tgreen2','Taoh','Green', '$2a$10$a3BOTytYHBko.I4aKpAPR.4b6Sr3s93mUH.UNwMyDGhdxo42sm.GW', 1, 1);

insert into "user_role" ("user_id", "role_id") values (1, 2);
insert into "user_role" ("user_id", "role_id") values (2, 2);
insert into "user_role" ("user_id", "role_id") values (3, 2);
insert into "user_role" ("user_id", "role_id") values (4, 2);
insert into "user_role" ("user_id", "role_id") values (5, 2);
insert into "user_role" ("user_id", "role_id") values (6, 2);
insert into "user_role" ("user_id", "role_id") values (7, 2);
insert into "user_role" ("user_id", "role_id") values (8, 2);
insert into "user_role" ("user_id", "role_id") values (9, 2);
insert into "user_role" ("user_id", "role_id") values (10, 2);
insert into "user_role" ("user_id", "role_id") values (11, 2);
insert into "user_role" ("user_id", "role_id") values (12, 2);
insert into "user_role" ("user_id", "role_id") values (13, 2);
insert into "user_role" ("user_id", "role_id") values (14, 2);
insert into "user_role" ("user_id", "role_id") values (15, 2);
insert into "user_role" ("user_id", "role_id") values (16, 2);
insert into "user_role" ("user_id", "role_id") values (17, 2);

commit;
