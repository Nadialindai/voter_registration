-- Register a candidate
INSERT INTO `ballot` (`ballot_id`, `full_name`, `age`, `candidate`, `zip`, `party`, `electoral_college`) VALUES
(:ballot_id, :full_name, :age, :candidate, :zip, :party, :electoral_college);

-- Select all ballot in a party
SELECT * FROM ballot WHERE party = :party;

-- Update zip of a ballot item
UPDATE ballot SET zip = :zip WHERE ballot_id = :ballot_id;

-- Delete a ballot item
DELETE FROM ballot WHERE ballot_id = :ballot_id;

--Create a new candidate
INSERT INTO `candidates`(`id`, `full_name`, `state`, 'party', 'total') VALUES
(:id, :full_name, :state, :party, :total);

-- Select all candidate
SELECT * FROM candidates WHERE full_name = :full_name;

-- Update votes of candidate
UPDATE candidates SET total = :total WHERE state = :state AND party =: party;

-- Delete a candidate
DELETE FROM candidates WHERE id = :id;


--Register a voter
INSERT INTO `voters`(`id`, `first_name`, `last_name`, 'birthday') VALUES
(:id, :first_name, :last_name, :birthday);

-- Select all voters with a specied birthday 
SELECT * FROM voters WHERE birthday = :birthday;

-- Update lastname of a voter 
UPDATE voters SET last_name = :last_name WHERE id = :id;

-- Delete a voter 
DELETE FROM voters WHERE id = :id;


--Create an new order 
INSERT INTO `states`(`id`, `count`, `candidate_id`, 'customer_id') VALUES
(:id, :count, :candidate_id, :customer_id);

-- Select order with a specific count in a particular candidate 
SELECT * FROM states WHERE count = :count AND candidate_id = :candidate_id;

-- Update count of a candidate
UPDATE states SET count = :count WHERE id = :id;

-- Delete a ballot 
DELETE FROM states WHERE id = :id;
