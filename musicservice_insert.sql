INSERT INTO genre (id, name) 
VALUES('1', 'Rock');

INSERT INTO genre (id, name) 
VALUES('2', 'POP');

INSERT INTO genre (id, name) 
VALUES('3', 'RnB');

INSERT INTO musician (id, name, description) 
VALUES('11', 'Arctic Monkeys', 'Group from The United Kingdom of Great Britain and Northern Ireland');

INSERT INTO musician (id, name, description) 
VALUES('22', 'Lana Del Rey', 'Singer from United States of America');

INSERT INTO musician (id, name, description) 
VALUES('33', 'Beyonce', 'Singer from United States of America');

INSERT INTO genremusician (genre_id, musician_id) 
VALUES('1', '11');

INSERT INTO genremusician (genre_id, musician_id) 
VALUES('2', '22');

INSERT INTO genremusician (genre_id, musician_id) 
VALUES('3', '33');

INSERT INTO album (id, name, relise, description) 
VALUES('111', 'AM', TO_DATE('2013-01-01', 'YYYY-MM-DD'), 'No description');

INSERT INTO album (id, name, relise, description) 
VALUES('112', 'Humbug', TO_DATE('2009-01-01', 'YYYY-MM-DD'), 'No description');

INSERT INTO album (id, name, relise, description) 
VALUES('113', 'The Car', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 'No description');

INSERT INTO album (id, name, relise, description) 
VALUES('221', 'Lust For Life', TO_DATE('2017-01-01', 'YYYY-MM-DD'), 'No description');

INSERT INTO album (id, name, relise, description) 
VALUES('222', 'NormanFuckingRocwell', TO_DATE('2019-01-01', 'YYYY-MM-DD'), 'No description');

INSERT INTO album (id, name, relise, description) 
VALUES('223', 'Blue Banisters', TO_DATE('2021-01-01', 'YYYY-MM-DD'), 'No description');

INSERT INTO album (id, name, relise, description) 
VALUES('331', 'Everything Is Love', TO_DATE('2018-01-01', 'YYYY-MM-DD'), 'No description');

INSERT INTO album (id, name, relise, description) 
VALUES('332', 'Renaissance', TO_DATE('2022-01-01', 'YYYY-MM-DD'),'No description');

INSERT INTO albumrecording (musician_id, album_id, description) 
VALUES('11', '111', 'No description');

INSERT INTO albumrecording (musician_id, album_id, description) 
VALUES('11', '112', 'No description');

INSERT INTO albumrecording (musician_id, album_id, description) 
VALUES('11', '113', 'No description');

INSERT INTO albumrecording (musician_id, album_id, description) 
VALUES('22', '221', 'No description');

INSERT INTO albumrecording (musician_id, album_id, description) 
VALUES('22', '222', 'No description');

INSERT INTO albumrecording (musician_id, album_id, description) 
VALUES('22', '223', 'No description');

INSERT INTO albumrecording (musician_id, album_id, description) 
VALUES('33', '331', 'No description');

INSERT INTO albumrecording (musician_id, album_id, description) 
VALUES('33', '332', 'No description');

INSERT INTO track  (name, t_time, album_id) 
VALUES('Do I wanna know?', 259, '111');

INSERT INTO track  (name, t_time, album_id) 
VALUES('Mad sounds', 201, '111');

INSERT INTO track  (name, t_time, album_id) 
VALUES('My propeller', 196, '112');

INSERT INTO track  (name, t_time, album_id) 
VALUES('Secret doors', 205, '112');

INSERT INTO track  (name, t_time, album_id) 
VALUES('The car', 191, '113');

INSERT INTO track  (name, t_time, album_id) 
VALUES('Hello you', 243, '113');

INSERT INTO track  (name, t_time, album_id) 
VALUES('Lust for life', 254, '221');

INSERT INTO track  (name, t_time, album_id) 
VALUES('13 Beaches', 273, '221');

INSERT INTO track  (name, t_time, album_id) 
VALUES('How to disappear', 208, '222');

INSERT INTO track  (name, t_time, album_id) 
VALUES('California', 303, '222');

INSERT INTO track  (name, t_time, album_id) 
VALUES('Text book', 301, '223');

INSERT INTO track  (name, t_time, album_id) 
VALUES('Blue banisters', 272, '223');

INSERT INTO track  (name, t_time, album_id) 
VALUES('Break my soul', 262, '332');

INSERT INTO track  (name, t_time, album_id) 
VALUES('Energy', 93, '332');

INSERT INTO track  (name, t_time, album_id) 
VALUES('713', 187, '331');

INSERT INTO track  (name, t_time, album_id) 
VALUES('Friends', 326, '331');

INSERT INTO collection (name, relise, description) 
VALUES('Collection_1', TO_DATE('2019-01-01', 'YYYY-MM-DD'), 'First');

INSERT INTO collection (name, relise, description)
VALUES('Collection_2', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 'Second');

INSERT INTO collection (name, relise, description) 
VALUES('Collection_3', TO_DATE('2021-01-01', 'YYYY-MM-DD'), 'Third');

INSERT INTO collection (name, relise, description)
VALUES('Collection_4', TO_DATE('2012-01-01', 'YYYY-MM-DD'), 'Fourth');

INSERT INTO collectionrecording (track_id, collection_id, description) 
VALUES('1', '1', 'No description');

INSERT INTO collectionrecording (track_id, collection_id, description)  
VALUES('2', '1', 'No description');

INSERT INTO collectionrecording (track_id, collection_id, description) 
VALUES('3', '1', 'No description');

INSERT INTO collectionrecording (track_id, collection_id, description) 
VALUES('4', '1', 'No description');

INSERT INTO collectionrecording (track_id, collection_id, description) 
VALUES('5', '2', 'No description');

INSERT INTO collectionrecording (track_id, collection_id, description)  
VALUES('6', '2', 'No description');

INSERT INTO collectionrecording (track_id, collection_id, description) 
VALUES('7', '2', 'No description');

INSERT INTO collectionrecording (track_id, collection_id, description) 
VALUES('8', '2', 'No description');

INSERT INTO collectionrecording (track_id, collection_id, description) 
VALUES('9', '3', 'No description');

INSERT INTO collectionrecording (track_id, collection_id, description)  
VALUES('10', '3', 'No description');

INSERT INTO collectionrecording (track_id, collection_id, description) 
VALUES('11', '3', 'No description');

INSERT INTO collectionrecording (track_id, collection_id, description) 
VALUES('12', '3', 'No description');

INSERT INTO collectionrecording (track_id, collection_id, description) 
VALUES('13', '4', 'No description');

INSERT INTO collectionrecording (track_id, collection_id, description)  
VALUES('14', '4', 'No description');

INSERT INTO collectionrecording (track_id, collection_id, description) 
VALUES('15', '4', 'No description');

INSERT INTO collectionrecording (track_id, collection_id, description) 
VALUES('16', '4', 'No description');

INSERT INTO genremusician (genre_id, musician_id) 
VALUES('1', '22');

INSERT INTO track  (name, t_time, album_id) 
VALUES('More', 193, '332');

INSERT INTO track  (name, t_time, album_id) 
VALUES('Summer', 267, '331');
