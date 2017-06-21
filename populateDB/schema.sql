begin;

create schema floods;
create schema floods_private;

create table floods.person (
  id               serial primary key,
  first_name       text not null check (char_length(first_name) < 80),
  last_name        text check (char_length(last_name) < 80),
  created_at       timestamp default now()
);

comment on table floods.person is 'A user of the flood tracking applicaiton.';
comment on column floods.person.id is 'The primary unique identifier for the person.';
comment on column floods.person.first_name is 'The person’s first name.';
comment on column floods.person.last_name is 'The person’s last name.';
comment on column floods.person.created_at is 'The time this person was created.';

create table floods.crossing (
  id               serial primary key,
  name             text not null check (char_length(name) < 80)
);

comment on table floods.crossing is 'A road crossing that might flood.';
comment on column floods.crossing.id is 'The primary unique identifier for the crossing.';
comment on column floods.crossing.name is 'The name of the crossing.';

create table floods.status (
  id               serial primary key,
  name             text not null check (char_length(name) < 80)
);

comment on table floods.crossing is 'A status a crossing might be in.';
comment on column floods.crossing.id is 'The primary unique identifier for the status.';
comment on column floods.crossing.name is 'The name of the status.';

create table floods.status_update (
  id               serial primary key,
  author_id        integer not null references floods.person(id),
  crossing_id      integer not null references floods.crossing(id),
  status_id        integer not null references floods.status(id),
  created_at       timestamp default now()
);

comment on table floods.status_update is 'A status update of a crossing.';
comment on column floods.status_update.id is 'The primary key for the status update.';
comment on column floods.status_update.author_id is 'The id of the author user.';
comment on column floods.status_update.crossing_id is 'The id of the crossing.';
comment on column floods.status_update.status_id is 'The id of the status.';
comment on column floods.status_update.created_at is 'The time this update was made.';

create function floods.crossing_latest_status(crossing floods.crossing) returns floods.status_update as $$
  select status_update.*
  from floods.status_update as status_update
  where status_update.crossing_id = crossing.id
  order by created_at desc
  limit 1
$$ language sql stable;

comment on function floods.crossing_latest_status(floods.crossing) is 'Gets the latest status of a given crossing.';

alter table floods.person add column updated_at timestamp default now();
alter table floods.status_update add column updated_at timestamp default now();

create function floods_private.set_updated_at() returns trigger as $$
begin
  new.updated_at := current_timestamp;
  return new;
end;
$$ language plpgsql;

create trigger person_updated_at before update
  on floods.person
  for each row
  execute procedure floods_private.set_updated_at();

create trigger status_update_updated_at before update
  on floods.status_update
  for each row
  execute procedure floods_private.set_updated_at();

create table floods_private.person_account (
  person_id        integer primary key references floods.person(id) on delete cascade,
  email            text not null unique check (email ~* '^.+@.+\..+$'),
  password_hash    text not null
);

comment on table floods_private.person_account is 'Private information about a person’s account.';
comment on column floods_private.person_account.person_id is 'The id of the person associated with this account.';
comment on column floods_private.person_account.email is 'The email address of the person.';
comment on column floods_private.person_account.password_hash is 'An opaque hash of the person’s password.';

create extension if not exists "pgcrypto";

create function floods.register_person(
  first_name text,
  last_name text,
  email text,
  password text
) returns floods.person as $$
declare
  person floods.person;
begin
  insert into floods.person (first_name, last_name) values
    (first_name, last_name)
    returning * into person;

  insert into floods_private.person_account (person_id, email, password_hash) values
    (person.id, email, crypt(password, gen_salt('bf')));

  return person;
end;
$$ language plpgsql strict security definer;

comment on function floods.register_person(text, text, text, text) is 'Registers a single user and creates an account.';

create role floods_postgraphql login password 'xyz';

create role floods_anonymous;
grant floods_anonymous to floods_postgraphql;

create role floods_person;
grant floods_person to floods_postgraphql;

create type floods.jwt_token as (
  role text,
  person_id integer
);

create function floods.authenticate(
  email text,
  password text
) returns floods.jwt_token as $$
declare
  account floods_private.person_account;
begin
  select a.* into account
  from floods_private.person_account as a
  where a.email = $1;

  if account.password_hash = crypt(password, account.password_hash) then
    return ('floods_person', account.person_id)::floods.jwt_token;
  else
    return null;
  end if;
end;
$$ language plpgsql strict security definer;

comment on function floods.authenticate(text, text) is 'Creates a JWT token that will securely identify a person and give them certain permissions.';

create function floods.current_person() returns floods.person as $$
  select *
  from floods.person
  where id = current_setting('jwt.claims.person_id')::integer
$$ language sql stable;

comment on function floods.current_person() is 'Gets the person who was identified by our JWT.';

grant usage on schema floods to floods_anonymous, floods_person;

grant select on table floods.person to floods_anonymous, floods_person;
grant update, delete on table floods.person to floods_person;

grant select on table floods.status to floods_anonymous, floods_person;
grant update, delete on table floods.status to floods_person;

grant select on table floods.status_update to floods_anonymous, floods_person;
grant insert, update, delete on table floods.status_update to floods_person;
grant usage on sequence floods.status_update_id_seq to floods_person;

grant select on table floods.crossing to floods_anonymous, floods_person;
grant insert, update, delete on table floods.crossing to floods_person;
grant usage on sequence floods.crossing_id_seq to floods_person;

grant execute on function floods.crossing_latest_status(floods.crossing) to floods_anonymous, floods_person;
grant execute on function floods.authenticate(text, text) to floods_anonymous, floods_person;
grant execute on function floods.current_person() to floods_anonymous, floods_person;
grant execute on function floods.register_person(text, text, text, text) to floods_anonymous;

alter table floods.person enable row level security;
-- alter table floods.status_update enable row level security;

create policy select_person on floods.person for select
  using (true);

create policy select_status_update on floods.status_update for select
  using (true);

create policy update_person on floods.person for update to floods_person
  using (id = current_setting('jwt.claims.person_id')::integer);

create policy delete_person on floods.person for delete to floods_person
  using (id = current_setting('jwt.claims.person_id')::integer);

-- create policy insert_status_update on floods.status_update for insert to floods_person
--   with check (author_id = current_setting('jwt.claims.person_id')::integer);

create policy update_status_update on floods.status_update for update to floods_person
  using (author_id = current_setting('jwt.claims.person_id')::integer);

create policy delete_status_update on floods.status_update for delete to floods_person
  using (author_id = current_setting('jwt.claims.person_id')::integer);

commit;
