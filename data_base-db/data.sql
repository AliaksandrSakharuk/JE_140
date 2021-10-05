drop table if exists positions cascade;
drop table if exists detail cascade;
drop table if exists orders_worker cascade;
drop table if exists worker cascade;
drop table if exists orders cascade;
drop table if exists car cascade;


CREATE TABLE IF NOT EXISTS orders  (
    id bigserial PRIMARY KEY,
    first_name_client character varying(25) NOT NULL,
    last_name_client character varying(25) NOT NULL,
    phone_number bigint DEFAULT 0,
    volume_bonus integer DEFAULT 0,
    bill money DEFAULT 0,
    is_cash boolean DEFAULT false,
    data_time_request timestamp DEFAULT now()
    );

CREATE TABLE IF NOT EXISTS car(
    id bigserial PRIMARY KEY,
    name_owner character varying(25) NOT NULL,
    name_car character varying(25) NOT NULL,
    mileage integer DEFAULT 0,
    power integer DEFAULT 0,
    is_electro boolean DEFAULT false,
    is_hibrid boolean DEFAULT false,
    DATA_TIME_START_FIX  timestamp DEFAULT now(),
    order_id bigint DEFAULT 0,
    FOREIGN KEY (order_id) REFERENCES orders(id)
    );

CREATE TABLE IF NOT EXISTS detail(
    id bigserial PRIMARY KEY,
    name character varying(25) NOT NULL,
    notes character varying(255) NOT NULL,
    PART_NUMBER integer DEFAULT 0,
    PURCHASE_PRICE money DEFAULT 0,
    SELLING_PRICE money DEFAULT 0,
    EXTRA_CHARGE int DEFAULT 0,
    CAR_ID bigint DEFAULT 0,
    DATA_TIME_DELIVERY timestamp DEFAULT now(),
    FOREIGN KEY (car_id) REFERENCES car(id)
    );

CREATE TABLE positions(
    id bigserial PRIMARY KEY,
    status character varying(25) not null
);

CREATE TABLE IF NOT EXISTS worker(
    id bigserial PRIMARY KEY,
    first_name character varying(25) not null,
    second_name character varying(25) not null,
    salary money DEFAULT 0,
    bonus int DEFAULT 0,
    phone_number int DEFAULT 0,
    is_cheif boolean DEFAULT false,
    data_time_start_work timestamp DEFAULT now(),
    position_id bigint DEFAULT 0,
    FOREIGN KEY (position_id) REFERENCES positions(id)
);

CREATE TABLE IF NOT EXISTS orders_worker (
    order_id bigint NOT NULL,
    worker_id bigint NOT NULL,
    PRIMARY KEY (order_id, worker_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (worker_id) REFERENCES worker(id));


INSERT INTO orders(first_name_client, last_name_client, volume_bonus, phone_number, bill, is_cash)
values ('OMA', 'HR', 20, 292020202, 1500.55, true);
INSERT INTO orders(first_name_client, last_name_client, volume_bonus, phone_number, bill, is_cash)
values ('MATERIK', 'SALES', 10, 291111111, 15.23, false);
INSERT INTO orders(first_name_client, last_name_client, volume_bonus, phone_number, bill, is_cash)
values ('MILE', 'SEQURITY', 50, 292222222, 1200, true);

INSERT INTO car(name_owner, name_car, mileage, power,  is_electro, is_hibrid, order_id)
values('KOSTISHKO', 'ZAZ', 10000, 50, true, false, 1);
INSERT INTO car(name_owner, name_car, mileage, power,  is_electro, is_hibrid, order_id)
values('GARMAZA', 'LADA', 1300, 50, false, false, 2);
INSERT INTO car(name_owner, name_car, mileage, power,  is_electro, is_hibrid, order_id)
values('SELEDKA', 'GEELY', 500, 50, false, false, 3);

INSERT INTO detail (name, notes, PART_NUMBER, PURCHASE_PRICE, CAR_ID)
values('POWER', 'THE BEST OF THE BEST', 1234567, 50.0, 1);
INSERT INTO detail (name, notes, PART_NUMBER, PURCHASE_PRICE, CAR_ID)
values('EGR', 'GOOD', 121267, 770.0, 1);
INSERT INTO detail (name, notes, PART_NUMBER, PURCHASE_PRICE, CAR_ID)
values('PASS', 'CONTINENTAL', 838924, 100.0, 2);
INSERT INTO detail (name, notes, PART_NUMBER, PURCHASE_PRICE, CAR_ID)
values('EGR', 'GOOD', 121267, 770.0, 2);
INSERT INTO detail (name, notes, PART_NUMBER, PURCHASE_PRICE, CAR_ID)
values('KEY', 'BROLE DOWN ELECTRONIC', 123442, 55, 3);
INSERT INTO detail (name, notes, PART_NUMBER, PURCHASE_PRICE, CAR_ID)
values('EGR', 'GOOD', 121267, 770.0, 3);

INSERT INTO positions(status) values('MASTER');
INSERT INTO positions(status) values('ASSISTANT');
INSERT INTO positions(status) values('MECHANIСAL');

INSERT INTO worker(second_name, first_name, salary, is_cheif, position_id, data_time_start_work)
values ('KAZAK', 'VADIM', 10000.55, true, 1, '2015-09-01');
INSERT INTO worker(second_name, first_name, salary, is_cheif, position_id, data_time_start_work)
values ('SAKHARUK', 'ALIAKSANDR', 10.55, false, 2, '2018-01-09');
INSERT INTO worker(second_name, first_name, salary, is_cheif, position_id, data_time_start_work)
values ('SALAPURA', 'PETIA', 1000, false, 3, '2019-10-01');


INSERT INTO orders_worker(order_id, worker_id) values(1,1);
INSERT INTO orders_worker(order_id, worker_id) values(2,1);
INSERT INTO orders_worker(order_id, worker_id) values(2,2);
INSERT INTO orders_worker(order_id, worker_id) values(1,2);
INSERT INTO orders_worker(order_id, worker_id) values(1,3);
INSERT INTO orders_worker(order_id, worker_id) values(2,3);
INSERT INTO orders_worker(order_id, worker_id) values(3,3);





