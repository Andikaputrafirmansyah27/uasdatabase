performance_schemaCREATE DATABASE PraktekDika;
USE PraktekDika;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255), -- Panjang hash sandi dapat disesuaikan
    role ENUM('Admin', 'User')
);

-- Insert minimal 3 data pengguna
INSERT INTO users (username, PASSWORD, role) VALUES
('Andika', 'Jjbous', 'Admin'),
('Putra', 'Remixbous', 'User'),
('Firmansyah', '8Beat', 'User');

CREATE TABLE profiles (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    full_name VARCHAR(100),
    birthdate DATE,
    bio TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert minimal 3 data profil pengguna
INSERT INTO profiles (user_id, full_name, birthdate, bio) VALUES
(1, 'Andika Zhordie', '2003-01-01', 'Whatsaps.'),
(2, 'Putra Djuanda', '2004-02-02', 'Hangout.'),
(3, 'Firmansyah Putra Sinegar', '2009-09-09', 'Life to pargoyy');

CREATE TABLE posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(200),
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert minimal 3 data postingan
INSERT INTO posts (user_id, title, content) VALUES
(1, 'Heys is my Bio', 'Ternyata Gue ganteng yaa.'),
(2, 'Best to my life', 'Jarang mandi kalo ga keluar.'),
(3, 'With my jurnie', 'Akhirnya liburan semester juga.');

CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    user_id INT,
    comment_text VARCHAR(1000),
    commented_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert minimal 3 data komentar
INSERT INTO comments (post_id, user_id, comment_text) VALUES
(1, 2, 'Apa iya.'),
(1, 3, 'OOOYY Kerenyoooo.'),
(2, 1, 'Cool in your life.');

SELECT u.username, p.full_name, p.bio
FROM users u
JOIN profiles p ON u.id = p.user_id;

SELECT po.title, po.content, c.comment_text
FROM posts po
LEFT JOIN comments c ON po.post_id = c.post_id;