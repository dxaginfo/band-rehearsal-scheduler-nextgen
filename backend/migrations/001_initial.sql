-- Migration: Initial database schema
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  password_hash VARCHAR(200),
  role VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS events (
  id SERIAL PRIMARY KEY,
  title VARCHAR(200),
  datetime TIMESTAMP NOT NULL,
  description TEXT,
  location VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS attendance (
  id SERIAL PRIMARY KEY,
  event_id INTEGER REFERENCES events(id),
  user_id INTEGER REFERENCES users(id),
  status VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS setlists (
  id SERIAL PRIMARY KEY,
  event_id INTEGER REFERENCES events(id),
  title VARCHAR(200),
  notes TEXT
);

CREATE TABLE IF NOT EXISTS setlist_songs (
  id SERIAL PRIMARY KEY,
  setlist_id INTEGER REFERENCES setlists(id),
  song_title VARCHAR(200),
  "order" INTEGER
);

CREATE TABLE IF NOT EXISTS messages (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  event_id INTEGER REFERENCES events(id),
  body TEXT,
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Example: roles table (optional)
CREATE TABLE IF NOT EXISTS roles (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  permissions TEXT
);
