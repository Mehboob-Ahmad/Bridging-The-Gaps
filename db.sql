
-- Users table (matches PHP code expectations)
CREATE TABLE IF NOT EXISTS users (
  id VARCHAR(64) PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255) NOT NULL UNIQUE,
  role VARCHAR(32) NOT NULL DEFAULT 'user',
  password_hash VARCHAR(255) NOT NULL,
  avatar VARCHAR(512),
  created_at DATETIME NOT NULL
);

-- Donations table
CREATE TABLE IF NOT EXISTS donations (
  id VARCHAR(64) PRIMARY KEY,
  user_id VARCHAR(64),
  amount INT NOT NULL,
  slip_path VARCHAR(512),
  created_at DATETIME NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
  FOREIGN KEY (volunteer_id) REFERENCES Volunteer(volunteer_id) ON DELETE SET NULL
);

-- Volunteer table
CREATE TABLE IF NOT EXISTS Volunteer (
  volunteer_id VARCHAR(64) PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255) NOT NULL UNIQUE,
  phone VARCHAR(255),
  created_at DATETIME NOT NULL
  Projects_completed INT NOT NULL DEFAULT 0,
  FOREIGN KEY (Projects_completed) REFERENCES Projects(project_id) ON DELETE SET NULL
);
CREATE TABLE IF NOT EXISTS Projects (
  project_id VARCHAR(64) PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  created_at DATETIME NOT NULL
  FOREIGN KEY (volunteer_id) REFERENCES Volunteer(volunteer_id) ON DELETE SET NULL
);
-- Indexes
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_donations_user ON donations(user_id);

-- Reviews table (for Suggestions page)
CREATE TABLE IF NOT EXISTS reviews (
  id VARCHAR(64) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  rating TINYINT NOT NULL,
  message TEXT NOT NULL,
  created_at DATETIME NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_reviews_created_at ON reviews(created_at);
