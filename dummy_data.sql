-- Create the tables
CREATE TABLE users (
	user_id VARCHAR NOT NULL, 
	email VARCHAR NOT NULL, 
	name VARCHAR NOT NULL, 
	locale VARCHAR NOT NULL, 
	created_at DATETIME NOT NULL, 
	PRIMARY KEY (user_id), 
	UNIQUE (email)
);

CREATE TABLE storage_metrics (
	metric_id INTEGER NOT NULL, 
	user_id VARCHAR NOT NULL, 
	percent_used FLOAT NOT NULL, 
	recorded_at DATETIME NOT NULL, 
	PRIMARY KEY (metric_id), 
	FOREIGN KEY(user_id) REFERENCES users (user_id)
);

CREATE TABLE auth_sources (
	auth_id INTEGER NOT NULL, 
	user_id VARCHAR NOT NULL, 
	source VARCHAR NOT NULL, 
	collection_date DATETIME NOT NULL, 
	data_type VARCHAR NOT NULL, 
	PRIMARY KEY (auth_id), 
	FOREIGN KEY(user_id) REFERENCES users (user_id)
);

-- Insert dummy users
INSERT INTO users VALUES('115564247452430573817','527bd5b5d689e2c32ae974c6229ff785@opendatalabs.xyz','John Doe','en','2025-03-20 19:55:45.802000');

INSERT INTO storage_metrics VALUES(1,'115564247452430573817',12.66999999999999993,'2025-03-20 19:55:45.802000');

INSERT INTO auth_sources VALUES(1,'115564247452430573817','Google','2025-03-20 23:55:45.802000','profile');