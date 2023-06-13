CREATE OR REPLACE FUNCTION update_cook_loyalty() RETURNS TRIGGER AS $$
BEGIN
    UPDATE bb.cook
    SET loyalty = loyalty + 1
    WHERE cook_id IN (
        SELECT DISTINCT cook_id
        FROM bb.cook
        JOIN bb.lab ON bb.cook.lab_id = bb.lab.lab_id
        JOIN bb.product ON bb.lab.lab_id = bb.product.lab_id
        JOIN bb.deal ON bb.product.lot_id = bb.deal.lot_id
        WHERE bb.cook.lab_id = bb.product.lab_id
        AND bb.product.lot_id = NEW.lot_id
        AND bb.deal.dealer_id = NEW.dealer_id
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER loyalty_trigger
AFTER INSERT ON bb.deal
FOR EACH ROW
EXECUTE FUNCTION update_cook_loyalty();



CREATE OR REPLACE FUNCTION check_depot_capacity() RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT SUM(total_weight) FROM bb.product WHERE lot_id = NEW.lot_id) + NEW.total_weight > (SELECT capacity FROM bb.depot WHERE dep_id = NEW.dep_id) THEN
        RAISE EXCEPTION 'Depot capacity exceeded';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER capacity_trigger
BEFORE INSERT ON bb.depot
FOR EACH ROW
EXECUTE FUNCTION check_depot_capacity();
