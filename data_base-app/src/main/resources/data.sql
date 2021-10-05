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

INSERT INTO orders(first_name_client, last_name_client, volume_bonus, phone_number, bill, is_cash)
values ('OMA', 'HR', 20, 292020202, 1500.55, true);

INSERT INTO car(name_owner, name_car, mileage, power,  is_electro, is_hibrid, order_id)
values('KOSTISHKO', 'ZAZ', 10000, 50, true, false, 1);