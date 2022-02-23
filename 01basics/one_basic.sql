-- SHOW DATABASES;
-- SELECT DATABASE();
-- USE photo_store;
-- SELECT DATABASE();

-- CREATE TABLE cameras(
--     model_name VARCHAR(30),
--     quantity INT
-- );
-- DESC cameras;

-- TODO: cameras table done

-- DROP TABLE cameras;
-- SHOW TABLES;

-- TODO: drop table done

-- CREATE TABLE canon_cameras(
--     model_name VARCHAR(50),
--     quantity INT
-- );
-- DESC canon_cameras;

-- INSERT INTO canon_cameras(model_name, quantity)
-- VALUES("70-D", 12),
-- ("80D", 19),
-- ("EOS-R", 25),
-- ("EOS-r5", 80),
-- ("EOR-r6", 50);

-- TODO: insert values into table done

-- TODO: answering the customer question

-- SELECT * from canon_cameras;

-- SELECT model_name, quantity from canon_cameras
-- WHERE model_name='80d' ;

SELECT model_name, quantity from canon_cameras
WHERE quantity >= 50;