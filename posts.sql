-- To run this file, use the following command:
-- psql -f posts.sql

DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;
DROP DATABASE IF EXISTS blog;
CREATE DATABASE blog;

\c blog

-- Create users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password_digest VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create posts table
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    body TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INTEGER REFERENCES users(id)
);

-- Insert 5 users into users table
INSERT INTO users (name, email, password_digest)
VALUES
    ('John Doe', 'john.doe@example.com', 'password1'),
    ('Jane Smith', 'jane.smith@example.com', 'password2'),
    ('Bob Johnson', 'bob.johnson@example.com', 'password3'),
    ('Alice Brown', 'alice.brown@example.com', 'password4'),
    ('Charlie Davis', 'charlie.davis@example.com', 'password5');

-- Insert 5 posts into posts table
INSERT INTO posts (title, body, user_id)
VALUES
    ('First Post', 'This is the body of the first post', 1),
    ('Second Post', 'This is the body of the second post', 2),
    ('Third Post', 'This is the body of the third post', 3),
    ('Fourth Post', 'This is the body of the fourth post', 4),
    ('Fifth Post', 'This is the body of the fifth post', 5);

-- Delete a post with id of 1
DELETE FROM posts WHERE id = 1;

-- Update the post with id of 2 to have the title "New Title"
UPDATE posts SET title = 'New Title' WHERE id = 2;

-- Insert a new post into the posts table
INSERT INTO posts (title, body, user_id)
VALUES
    ('Sixth Post', 'This is the body of the sixth post', 1);
