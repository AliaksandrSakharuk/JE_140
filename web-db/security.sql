drop table if exists users cascade;
drop table if exists roles cascade;
drop table if exists users_roles cascade;


CREATE TABLE  IF NOT EXISTS users (
    id bigserial PRIMARY KEY,
    login character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    enabled smallint DEFAULT NULL
);

CREATE TABLE  IF NOT EXISTS roles (
    id bigserial PRIMARY KEY,
    role_name character varying(40) NOT NULL
);

CREATE TABLE  IF NOT EXISTS users_roles (
  user_id bigint NOT NULL,
  role_id bigint NOT NULL,
  CONSTRAINT role_fk FOREIGN KEY (user_id) REFERENCES roles (id),
  CONSTRAINT user_fk FOREIGN KEY (role_id) REFERENCES users (id)
);

INSERT INTO users (login, password, enabled)
VALUES ('reader', '$2a$10$8yzmROgpvrnUXCssDG1kV.jY51pXvFL49KKlw4yVTUv/Rnx3rZgl6', 1);
INSERT INTO users (login, password, enabled)
VALUES ('editor', '$2a$10$Y4uw8pVXJ19lvYKUHehyuunVjPBdaU7OEOqgxKBKgVGbWSb.rTYrC', 1);
INSERT INTO users (login, password, enabled)
VALUES ('author', '$2a$10$Ol/3irArF3e1Jw2S..appOOdNmRydi8xpBURsTCP2ZF17fXL21fUS', 1);

INSERT INTO roles (role_name) VALUES ('READER');
INSERT INTO roles (role_name) VALUES ('EDITOR');
INSERT INTO roles (role_name) VALUES ('AUTHOR');

INSERT INTO users_roles (user_id, role_id) VALUES (1, 1);
INSERT INTO users_roles (user_id, role_id) VALUES (2, 1);
INSERT INTO users_roles (user_id, role_id) VALUES (2, 2);
INSERT INTO users_roles (user_id, role_id) VALUES (3, 1);
INSERT INTO users_roles (user_id, role_id) VALUES (3, 2);
INSERT INTO users_roles (user_id, role_id) VALUES (3, 3);