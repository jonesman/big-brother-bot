DROP TABLE IF EXISTS xlr_bodyparts;
CREATE TABLE IF NOT EXISTS xlr_bodyparts (
  id SERIAL PRIMARY KEY,
  name VARCHAR(25) NOT NULL DEFAULT '',
  kills INTEGER NOT NULL DEFAULT '0',
  teamkills SMALLINT NOT NULL DEFAULT '0',
  suicides SMALLINT NOT NULL DEFAULT '0',
  CONSTRAINT xlr_bodyparts_name UNIQUE (name)
);

DROP TABLE IF EXISTS xlr_mapstats;
CREATE TABLE IF NOT EXISTS xlr_mapstats (
  id SERIAL PRIMARY KEY,
  name VARCHAR(25) NOT NULL DEFAULT '',
  kills INTEGER NOT NULL DEFAULT '0',
  teamkills SMALLINT NOT NULL DEFAULT '0',
  suicides SMALLINT NOT NULL DEFAULT '0',
  rounds SMALLINT NOT NULL DEFAULT '0',
  CONSTRAINT xlr_mapstats_name UNIQUE (name)
);

DROP TABLE IF EXISTS xlr_opponents;
CREATE TABLE IF NOT EXISTS xlr_opponents (
  id SERIAL PRIMARY KEY,
  target_id SMALLINT NOT NULL DEFAULT '0',
  killer_id SMALLINT NOT NULL DEFAULT '0',
  kills SMALLINT NOT NULL DEFAULT '0',
  retals SMALLINT NOT NULL DEFAULT '0',
  FOREIGN KEY(target_id) REFERENCES clients(id),
  FOREIGN KEY(killer_id) REFERENCES clients(id)
);

DROP TABLE IF EXISTS xlr_playerbody;
CREATE TABLE IF NOT EXISTS xlr_playerbody (
  id SERIAL PRIMARY KEY,
  bodypart_id SMALLINT NOT NULL DEFAULT '0',
  player_id SMALLINT NOT NULL DEFAULT '0',
  kills INTEGER NOT NULL DEFAULT '0',
  deaths INTEGER NOT NULL DEFAULT '0',
  teamkills SMALLINT NOT NULL DEFAULT '0',
  teamdeaths SMALLINT NOT NULL DEFAULT '0',
  suicides SMALLINT NOT NULL DEFAULT '0',
  FOREIGN KEY(bodypart_id) REFERENCES xlr_bodyparts(id),
  FOREIGN KEY(player_id) REFERENCES clients(id)
);

DROP TABLE IF EXISTS xlr_playermaps;
CREATE TABLE IF NOT EXISTS xlr_playermaps (
  id SERIAL PRIMARY KEY,
  map_id SMALLINT NOT NULL DEFAULT '0',
  player_id SMALLINT NOT NULL DEFAULT '0',
  kills INTEGER NOT NULL DEFAULT '0',
  deaths INTEGER NOT NULL DEFAULT '0',
  teamkills INTEGER NOT NULL DEFAULT '0',
  teamdeaths SMALLINT NOT NULL DEFAULT '0',
  suicides SMALLINT NOT NULL DEFAULT '0',
  rounds SMALLINT NOT NULL DEFAULT '0',
  FOREIGN KEY(map_id) REFERENCES xlr_mapstats(id),
  FOREIGN KEY(player_id) REFERENCES clients(id)
);

DROP TABLE IF EXISTS xlr_playerstats;
CREATE TABLE IF NOT EXISTS xlr_playerstats (
  id SERIAL PRIMARY KEY,
  client_id INTEGER NOT NULL DEFAULT '0',
  kills INTEGER NOT NULL DEFAULT '0',
  deaths INTEGER NOT NULL DEFAULT '0',
  teamkills SMALLINT NOT NULL DEFAULT '0',
  teamdeaths SMALLINT NOT NULL DEFAULT '0',
  suicides SMALLINT NOT NULL DEFAULT '0',
  ratio FLOAT NOT NULL DEFAULT '0',
  skill FLOAT NOT NULL DEFAULT '0',
  assists INTEGER NOT NULL DEFAULT '0',
  assistskill FLOAT NOT NULL DEFAULT '0',
  curstreak SMALLINT NOT NULL DEFAULT '0',
  winstreak SMALLINT NOT NULL DEFAULT '0',
  losestreak SMALLINT NOT NULL DEFAULT '0',
  rounds SMALLINT NOT NULL DEFAULT '0',
  hide SMALLINT NOT NULL DEFAULT '0',
  fixed_name VARCHAR(32) NOT NULL DEFAULT '',
  id_token VARCHAR(10) NOT NULL DEFAULT '',
  FOREIGN KEY(client_id) REFERENCES clients(id)
);

DROP TABLE IF EXISTS xlr_weaponstats;
CREATE TABLE IF NOT EXISTS xlr_weaponstats (
  id SERIAL PRIMARY KEY,
  name VARCHAR(64) NOT NULL DEFAULT '',
  kills INTEGER NOT NULL DEFAULT '0',
  teamkills SMALLINT NOT NULL DEFAULT '0',
  suicides SMALLINT NOT NULL DEFAULT '0',
  CONSTRAINT xlr_weaponstats_name UNIQUE (name)
);

DROP TABLE IF EXISTS xlr_weaponusage;
CREATE TABLE IF NOT EXISTS xlr_weaponusage (
  id SERIAL PRIMARY KEY,
  weapon_id SMALLINT NOT NULL DEFAULT '0',
  player_id SMALLINT NOT NULL DEFAULT '0',
  kills INTEGER NOT NULL DEFAULT '0',
  deaths INTEGER NOT NULL DEFAULT '0',
  teamkills SMALLINT NOT NULL DEFAULT '0',
  teamdeaths SMALLINT NOT NULL DEFAULT '0',
  suicides SMALLINT NOT NULL DEFAULT '0',
  FOREIGN KEY(weapon_id) REFERENCES xlr_weaponstats(id),
  FOREIGN KEY(player_id) REFERENCES clients(id)
);

DROP TABLE IF EXISTS xlr_actionstats;
CREATE TABLE IF NOT EXISTS xlr_actionstats (
  id SERIAL PRIMARY KEY,
  name VARCHAR(25) NOT NULL DEFAULT '',
  count INTEGER NOT NULL DEFAULT '0',
  CONSTRAINT xlr_actionstats_name UNIQUE (name)
);

DROP TABLE IF EXISTS xlr_playeractions;
CREATE TABLE IF NOT EXISTS xlr_playeractions (
  id SERIAL PRIMARY KEY,
  action_id SMALLINT NOT NULL DEFAULT '0',
  player_id SMALLINT NOT NULL DEFAULT '0',
  count INTEGER NOT NULL DEFAULT '0',
  FOREIGN KEY(action_id) REFERENCES xlr_actionstats(id),
  FOREIGN KEY(player_id) REFERENCES clients(id)
);

DROP TABLE IF EXISTS xlr_history_monthly;
CREATE TABLE IF NOT EXISTS xlr_history_monthly (
  id SERIAL PRIMARY KEY,
  client_id INTEGER NOT NULL DEFAULT '0',
  kills INTEGER NOT NULL DEFAULT '0',
  deaths INTEGER NOT NULL DEFAULT '0',
  teamkills SMALLINT NOT NULL DEFAULT '0',
  teamdeaths SMALLINT NOT NULL DEFAULT '0',
  suicides SMALLINT NOT NULL DEFAULT '0',
  ratio FLOAT NOT NULL DEFAULT '0',
  skill FLOAT NOT NULL DEFAULT '0',
  assists INTEGER NOT NULL DEFAULT '0',
  assistskill FLOAT NOT NULL DEFAULT '0',
  winstreak SMALLINT NOT NULL DEFAULT '0',
  losestreak SMALLINT NOT NULL DEFAULT '0',
  rounds SMALLINT NOT NULL DEFAULT '0',
  year INTEGER NOT NULL,
  month INTEGER NOT NULL,
  week INTEGER NOT NULL,
  day INTEGER NOT NULL
);

DROP TABLE IF EXISTS xlr_history_weekly;
CREATE TABLE IF NOT EXISTS xlr_history_weekly (
  id SERIAL PRIMARY KEY,
  client_id INTEGER NOT NULL DEFAULT '0',
  kills INTEGER NOT NULL DEFAULT '0',
  deaths INTEGER NOT NULL DEFAULT '0',
  teamkills SMALLINT NOT NULL DEFAULT '0',
  teamdeaths SMALLINT NOT NULL DEFAULT '0',
  suicides SMALLINT NOT NULL DEFAULT '0',
  ratio FLOAT NOT NULL DEFAULT '0',
  skill FLOAT NOT NULL DEFAULT '0',
  assists INTEGER NOT NULL DEFAULT '0',
  assistskill FLOAT NOT NULL DEFAULT '0',
  winstreak SMALLINT NOT NULL DEFAULT '0',
  losestreak SMALLINT NOT NULL DEFAULT '0',
  rounds SMALLINT NOT NULL DEFAULT '0',
  year INTEGER NOT NULL,
  month INTEGER NOT NULL,
  week INTEGER NOT NULL,
  day INTEGER NOT NULL
);

DROP TABLE IF EXISTS ctime;
CREATE TABLE IF NOT EXISTS ctime (
  id SERIAL PRIMARY KEY,
  guid VARCHAR(36) NOT NULL,
  came VARCHAR(11) DEFAULT NULL,
  gone VARCHAR(11) DEFAULT NULL,
  nick VARCHAR(32) NOT NULL
);