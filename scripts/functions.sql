CREATE OR REPLACE PROCEDURE add_dealer_and_product(dealer_nm VARCHAR(25), lot_weight INT, lot_capacity INT, dealer_address VARCHAR(80))
AS $$
DECLARE
	new_lot_id INT;
	new_dealer_id INT;
BEGIN
	INSERT INTO bb.product (total_weight, lot_id, lab_id) VALUES (lot_weight, DEFAULT, 1) RETURNING lot_id INTO new_lot_id;
	INSERT INTO bb.dealer (nm, lot_id) VALUES (dealer_nm, new_lot_id) RETURNING dealer_id INTO new_dealer_id;
	UPDATE bb.depot SET lot_id = new_lot_id, capacity = lot_capacity WHERE dep_id = 1;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION bb.calculate_average_price(lab_id integer)
RETURNS numeric
AS $$
DECLARE
	total_weight integer;
	total_cost numeric;
	average_cost numeric;
BEGIN
	SELECT SUM(total_weight), SUM(total_weight * cost_per_unit)
	INTO total_weight, total_cost
	FROM (
		SELECT p.total_weight, (p.total_weight * 10) AS cost_per_unit
		FROM bb.product p
		WHERE p.lab_id = lab_id
	) AS products;

	average_cost := total_cost / total_weight;
	RETURN average_cost;
END;
$$ LANGUAGE plpgsql;

