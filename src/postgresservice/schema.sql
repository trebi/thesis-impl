-- -------------------------------------------------------------
-- TablePlus 3.12.8(368)
--
-- https://tableplus.com/
--
-- Database: online_boutique
-- Generation Time: 2021-07-28 16:32:47.8260
-- -------------------------------------------------------------

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS address_id_seq;

-- Table Definition
CREATE TABLE IF NOT EXISTS "public"."address" (
    "id" int4 NOT NULL DEFAULT nextval('address_id_seq'::regclass),
    "shipping_id" int4 NOT NULL,
    "street" varchar NOT NULL,
    "city" varchar NOT NULL,
    "state" varchar,
    "zip_code" varchar NOT NULL,
    "country" varchar NOT NULL,
    PRIMARY KEY ("id")
);

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS order_id_seq1;

-- Table Definition
CREATE TABLE IF NOT EXISTS "public"."order" (
    "id" int4 NOT NULL DEFAULT nextval('order_id_seq1'::regclass),
    "confirmation_id" varchar NOT NULL, 
    "total_amount" float4 NOT NULL,
    "total_currency" varchar NOT NULL,
    PRIMARY KEY ("id")
);

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS order_item_id_seq;

-- Table Definition
CREATE TABLE IF NOT EXISTS "public"."order_item" (
    "id" int4 NOT NULL DEFAULT nextval('order_item_id_seq'::regclass),
    "order_id" int4 NOT NULL,
    "product_id" int4 NOT NULL,
    "cost_amount" float4 NOT NULL,
    "cost_currency" bpchar(3) NOT NULL,
    "quantity" float8 NOT NULL,
    "product_name" varchar,
    "product_description" varchar,
    PRIMARY KEY ("id")
);

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS shipping_id_seq;

-- Table Definition
CREATE TABLE IF NOT EXISTS "public"."shipping" (
    "id" int4 NOT NULL DEFAULT nextval('shipping_id_seq'::regclass),
    "order_id" int4 NOT NULL,
    "tracking_id" varchar NOT NULL,
    "amount" float4 NOT NULL,
    "currency" bpchar(3) NOT NULL,
    PRIMARY KEY ("id")
);

ALTER TABLE "public"."address" ADD FOREIGN KEY ("shipping_id") REFERENCES "public"."shipping"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."order_item" ADD FOREIGN KEY ("order_id") REFERENCES "public"."order"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."shipping" ADD FOREIGN KEY ("order_id") REFERENCES "public"."order"("id") ON DELETE CASCADE ON UPDATE CASCADE;
