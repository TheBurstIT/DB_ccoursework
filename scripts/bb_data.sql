CREATE SCHEMA IF NOT EXISTS bb;

CREATE TABLE IF NOT EXISTS bb.lab(
	lab_id		integer default 0 PRIMARY KEY,
	active		integer default 0,
	loc		varchar(80) not null
);

CREATE TABLE IF NOT EXISTS bb.cook(
	cook_id integer not null PRIMARY KEY,
	nm varchar(25) not null,
	address varchar(80) not null,
	loyalty integer default 0,
	avg_percentage integer default 0,
	lab_id integer default 0, 

	FOREIGN KEY (lab_id) references bb.lab(lab_id)
);

CREATE TABLE IF NOT EXISTS bb.hardware(
	hardware_id integer not null PRIMARY KEY,
	lab_id integer default 0,
	replacement_needed integer default 0,

	FOREIGN KEY (lab_id) references bb.lab(lab_id)
);

CREATE TABLE IF NOT EXISTS bb.product(
	lab_id integer default 0,
	total_weight integer default 0,
	lot_id integer default 0 PRIMARY KEY,

	FOREIGN KEY (lab_id) references bb.lab(lab_id)
);

CREATE TABLE IF NOT EXISTS bb.depot(
	dep_id integer default 0 PRIMARY KEY,
	address varchar(80) not null,
	lot_id integer default 0,
	capacity integer default 0,

	FOREIGN KEY (lot_id) references bb.product(lot_id)
);

CREATE TABLE IF NOT EXISTS bb.dealer(
	dealer_id integer default 0 PRIMARY KEY,
	nm varchar(25) not null, 
	lot_id integer default 0,

	FOREIGN KEY (lot_id) references bb.product(lot_id)
);

CREATE TABLE IF NOT EXISTS bb.customer(
	customer_id integer default 0 PRIMARY KEY,
	reliability integer default 0,
	dealer_id integer default 0,

	FOREIGN KEY (dealer_id) references bb.dealer(dealer_id)
);

CREATE TABLE IF NOT EXISTS bb.deal(
	dealer_id integer default 0,
	date varchar(10) not null,
	lot_id integer default 0,
	drop_point varchar(80) not null,
	customer_id integer default 0,
	cash_amount integer default 0,

	FOREIGN KEY (lot_id) references bb.product(lot_id),
	FOREIGN KEY (customer_id) references bb.customer(customer_id),
	FOREIGN KEY (dealer_id) references bb.dealer(dealer_id)
);
