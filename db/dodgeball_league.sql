DROP TABLE matches;
DROP TABLE teams;

CREATE TABLE teams (
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE matches (
  id SERIAL4 primary key,
  away_team_score INT4,
  home_team_score INT4,
  away_team_id INT4 references teams( id ) ON DELETE CASCADE,
  home_team_id INT4 references teams( id ) ON DELETE CASCADE
);
