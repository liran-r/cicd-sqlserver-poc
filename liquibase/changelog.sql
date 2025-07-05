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

--changeset you:3
CREATE TABLE orders (
  order_id     INT            IDENTITY(1,1) PRIMARY KEY,
  user_id      INT            NOT NULL
                       FOREIGN KEY REFERENCES users(id),
  total_amount DECIMAL(12,2)  NOT NULL,
  ordered_at   DATETIME       DEFAULT (GETDATE()) NOT NULL
);

--rollback DROP TABLE orders;
