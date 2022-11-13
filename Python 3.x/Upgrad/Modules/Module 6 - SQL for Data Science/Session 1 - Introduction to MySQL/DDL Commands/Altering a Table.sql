
show tables;

#checking the metadata of table before adding a new column
desc persons;

#adding a new column and then checking the metadata
alter table persons add extra text;
desc persons;

#modifying an existing column and checking the metadata
alter table persons modify extra varchar(30);
desc persons;

#renaming a column and checking the metadata
alter table persons rename column extras to Feedback;
desc persons;

#dropping columns from a table and checking the metadata
alter table persons drop age, drop Feedback;
desc persons;









