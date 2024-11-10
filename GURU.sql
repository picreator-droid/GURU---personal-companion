
CREATE DATABASE guru;

USE guru;


CREATE TABLE Questions (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    content_hindi TEXT NOT NULL,
    content_english TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Answers (
    answer_id INT AUTO_INCREMENT PRIMARY KEY,
    question_id INT NOT NULL,
    content TEXT NOT NULL,
    emotion_response TEXT,  -- Emotional support response, if applicable
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (question_id) REFERENCES Questions(question_id)
);

CREATE TABLE EmotionalSupport (
    support_id INT AUTO_INCREMENT PRIMARY KEY,
    emotion VARCHAR(50) NOT NULL,
    response TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Questions (content_hindi, content_english)
VALUES 
('धृतराष्ट्र उवाच | धर्मक्षेत्रे कुरुक्षेत्रे समवेता युयुत्सवः | मामकाः पाण्डवाश्चैव किमकुर्वत सञ्जय || 1.1 ||', 
'Dhritarashtra said: O Sanjaya, after gathering on the holy field of Kurukshetra, and desiring to fight, what did my sons and the sons of Pandu do?'),
('सञ्जय उवाच | दृष्ट्वा तु पाण्डवानीकं व्यूढं दुर्योधनस्तदा | आचार्यमुपसंगम्य राजा वचनमब्रवीत् || 1.2 ||', 
'Sanjaya said: At that time, King Duryodhana, on seeing the Pandava army arranged in military formation, approached his teacher Drona and spoke the following words.');

INSERT INTO Answers (question_id, content, emotion_response)
VALUES 
(1, 'Dhritarashtra asks Sanjaya to narrate the events on the battlefield of Kurukshetra, particularly about the actions of his sons (the Kauravas) and the Pandavas.', NULL),
(2, 'Sanjaya replies, explaining that upon seeing the Pandava army arranged in battle formation, King Duryodhana approaches his teacher Drona and expresses his concerns about the strength of the Pandavas.', NULL);

INSERT INTO EmotionalSupport (emotion, response)
VALUES 
('Happy', 'It’s wonderful to see you happy! Keep smiling, and enjoy the positive energy around you.'),
('Sad', 'I’m sorry you’re feeling down. It’s okay to feel this way sometimes. Take a deep breath and know that things will get better soon.'),
('Anxious', 'It’s normal to feel anxious sometimes. Try to take a few moments to relax and focus on your breath. You’re stronger than you think.');



ALTER TABLE Questions
ADD COLUMN category VARCHAR(50) NOT NULL;

INSERT INTO Questions (content_hindi, content_english, category)
VALUES 

('धृतराष्ट्र उवाच | धर्मक्षेत्रे कुरुक्षेत्रे समवेता युयुत्सवः | मामकाः पाण्डवाश्चैव किमकुर्वत सञ्जय || 1.1 ||', 
 'Dhritarashtra said: O Sanjaya, after gathering on the holy field of Kurukshetra, and desiring to fight, what did my sons and the sons of Pandu do?', 'Shloka'),
('सञ्जय उवाच | दृष्ट्वा तु पाण्डवानीकं व्यूढं दुर्योधनस्तदा | आचार्यमुपसंगम्य राजा वचनमब्रवीत् || 1.2 ||', 
 'Sanjaya said: At that time, King Duryodhana, on seeing the Pandava army arranged in military formation, approached his teacher Drona and spoke the following words.', 'Shloka'),


('What is gravity?', 'Gravity is a fundamental force of nature that attracts two bodies toward each other. On Earth, it gives weight to physical objects and causes them to fall toward the ground when dropped.', 'Science'),
('What is rotational motion?', 'Rotational motion refers to the motion of an object around a central point or axis. It involves angular displacement, angular velocity, and angular acceleration.', 'Science');


INSERT INTO Answers (question_id, content, emotion_response)
VALUES 

(1, 'Dhritarashtra asks Sanjaya to narrate the events on the battlefield of Kurukshetra, particularly about the actions of his sons (the Kauravas) and the Pandavas.', NULL),
(2, 'Sanjaya replies, explaining that upon seeing the Pandava army arranged in battle formation, King Duryodhana approaches his teacher Drona and expresses his concerns about the strength of the Pandavas.', NULL),


(3, 'Gravity is a force that attracts two bodies toward each other, with a stronger force acting between heavier objects. It is what gives weight to objects and causes them to fall towards the Earth.', NULL),
(4, 'Rotational motion is when an object rotates around an axis. It is characterized by angular displacement, velocity, and acceleration, and is a fundamental concept in mechanics.', NULL);

SELECT * FROM Questions WHERE category = 'Science';

SELECT * FROM Questions WHERE category = 'Shloka';
