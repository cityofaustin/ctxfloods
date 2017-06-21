begin;

alter sequence floods.person_id_seq restart with 1;
SELECT floods.register_person(text 'Stevie',text 'Ray',text 'srv@double.trouble',text 'texasfloods');
alter sequence floods.person_id_seq restart with 2;

insert into floods.crossing (id, name) values
  (1, 'Crossing at the park'),
  (2, 'Crossing at the school'),
  (3, 'Crossing at the library'),
  (4, 'Crossing at the capitol'),
  (5, 'Crossing at city hall'),
  (6, 'Crossing at the coffee shop');

alter sequence floods.crossing_id_seq restart with 7;

insert into floods.status (id, name) values
  (1, 'open'),
  (2, 'closed');

alter sequence floods.status_id_seq restart with 3;

insert into floods.status_update (id, author_id, crossing_id, status_id, created_at) values
  (1, 1, 1, 1, '2017-05-03T09:27:57Z'),
  (2, 1, 1, 2, '2017-05-04T09:27:57Z'),
  (3, 1, 2, 1, '2017-05-06T09:27:57Z'),
  (4, 1, 3, 1, '2017-05-08T09:27:57Z'),
  (5, 1, 5, 1, '2017-05-11T09:27:57Z'),
  (6, 1, 2, 2, '2017-05-09T09:27:57Z'),
  (7, 1, 1, 1, '2017-05-09T09:27:57Z'),
  (8, 1, 3, 2, '2017-05-12T09:27:57Z'),
  (9, 1, 4, 1, '2017-05-14T09:27:57Z'),
  (10, 1, 1, 2, '2017-05-12T09:27:57Z'),
  (11, 1, 5, 2, '2017-05-17T09:27:57Z'),
  (12, 1, 6, 1, '2017-05-19T09:27:57Z'),
  (13, 1, 5, 1, '2017-05-19T09:27:57Z'),
  (14, 1, 5, 1, '2017-05-20T09:27:57Z'),
  (15, 1, 4, 1, '2017-05-20T09:27:57Z'),
  (16, 1, 3, 1, '2017-05-20T09:27:57Z'),
  (17, 1, 1, 1, '2017-05-19T09:27:57Z'),
  (18, 1, 4, 1, '2017-05-23T09:27:57Z'),
  (19, 1, 5, 2, '2017-05-25T09:27:57Z'),
  (20, 1, 3, 2, '2017-05-24T09:27:57Z'),
  (21, 1, 2, 1, '2017-05-24T09:27:57Z'),
  (22, 1, 5, 1, '2017-05-28T09:27:57Z'),
  (23, 1, 1, 2, '2017-05-25T09:27:57Z'),
  (24, 1, 6, 2, '2017-05-31T09:27:57Z'),
  (25, 1, 1, 1, '2017-05-27T09:27:57Z'),
  (26, 1, 1, 2, '2017-05-28T09:27:57Z'),
  (27, 1, 2, 2, '2017-05-30T09:27:57Z'),
  (28, 1, 3, 1, '2017-06-01T09:27:57Z'),
  (29, 1, 5, 2, '2017-06-04T09:27:57Z'),
  (30, 1, 2, 1, '2017-06-02T09:27:57Z');

alter sequence floods.status_update_id_seq restart with 31;

commit;
