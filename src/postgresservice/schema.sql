-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS orders_id_seq;

-- Table Definition
CREATE TABLE "public"."orders" (
    "id" int4 NOT NULL DEFAULT nextval('orders_id_seq'::regclass),
    "order_id" varchar,
    "shipping_tracking_id" varchar,
    "shipping_cost" varchar,
    "shipping_address" varchar,
    "items" text,
    PRIMARY KEY ("id")
);
