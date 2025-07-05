--liquibase formatted sql
-- ----------------------------------------------------------------------------
-- Never edit an already-executed changeset; always append another one.
-- ----------------------------------------------------------------------------

--changeset you:1
CREATE TABLE users (
  id   INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100)
);

--changeset you:2
ALTER TABLE users
  ADD signup_date DATETIME DEFAULT(GETDATE()) NOT NULL;
