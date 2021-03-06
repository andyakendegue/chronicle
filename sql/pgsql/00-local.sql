CREATE TABLE chronicle_clients (
  id BIGSERIAL PRIMARY KEY,
  publicid TEXT NOT NULL,
  publickey TEXT NOT NULL,
  "isAdmin" BOOLEAN NOT NULL DEFAULT FALSE,
  comment TEXT,
  created TIMESTAMP,
  modified TIMESTAMP
);

CREATE INDEX chronicle_clients_clientid_idx ON chronicle_clients(publicid);

CREATE TABLE chronicle_chain (
  id BIGSERIAL PRIMARY KEY,
  data TEXT NOT NULL,
  prevhash TEXT NULL,
  currhash TEXT NOT NULL,
  hashstate TEXT NOT NULL,
  summaryhash TEXT NOT NULL,
  publickey TEXT NOT NULL,
  signature TEXT NOT NULL,
  created TIMESTAMP,
  UNIQUE(currhash),
  UNIQUE(prevhash),
  FOREIGN KEY (prevhash) REFERENCES chronicle_chain(currhash)
);

CREATE INDEX chronicle_chain_prevhash_idx ON chronicle_chain(prevhash);
CREATE INDEX chronicle_chain_currhash_idx ON chronicle_chain(currhash);
CREATE INDEX chronicle_chain_summaryhash_idx ON chronicle_chain(summaryhash);
