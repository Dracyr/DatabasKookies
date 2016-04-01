--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE customers (
    id integer NOT NULL,
    name character varying,
    address character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE customers_id_seq OWNED BY customers.id;


--
-- Name: deliveries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE deliveries (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: deliveries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE deliveries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: deliveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE deliveries_id_seq OWNED BY deliveries.id;


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ingredients (
    id integer NOT NULL,
    name character varying,
    quantity integer DEFAULT 0 NOT NULL,
    last_delivered timestamp without time zone,
    last_delivered_quantity character varying DEFAULT '0'::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ingredients_id_seq OWNED BY ingredients.id;


--
-- Name: order_deliveries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE order_deliveries (
    id integer NOT NULL,
    delivery_id integer,
    order_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: order_deliveries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE order_deliveries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_deliveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE order_deliveries_id_seq OWNED BY order_deliveries.id;


--
-- Name: order_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE order_products (
    id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer NOT NULL
);


--
-- Name: order_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE order_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE order_products_id_seq OWNED BY order_products.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE orders (
    id integer NOT NULL,
    customer_id integer,
    delivered_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    order_delivery_id integer
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: pallets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pallets (
    id integer NOT NULL,
    status character varying,
    product_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    order_delivery_id integer
);


--
-- Name: pallets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pallets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pallets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pallets_id_seq OWNED BY pallets.id;


--
-- Name: product_ingredients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE product_ingredients (
    id integer NOT NULL,
    product_id integer,
    ingredient_id integer,
    quantity integer
);


--
-- Name: product_ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE product_ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE product_ingredients_id_seq OWNED BY product_ingredients.id;


--
-- Name: production_blocks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE production_blocks (
    id integer NOT NULL,
    product_id integer,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: production_blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE production_blocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: production_blocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE production_blocks_id_seq OWNED BY production_blocks.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE products (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    produced_count integer DEFAULT 0 NOT NULL
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY deliveries ALTER COLUMN id SET DEFAULT nextval('deliveries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ingredients ALTER COLUMN id SET DEFAULT nextval('ingredients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_deliveries ALTER COLUMN id SET DEFAULT nextval('order_deliveries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_products ALTER COLUMN id SET DEFAULT nextval('order_products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pallets ALTER COLUMN id SET DEFAULT nextval('pallets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_ingredients ALTER COLUMN id SET DEFAULT nextval('product_ingredients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY production_blocks ALTER COLUMN id SET DEFAULT nextval('production_blocks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY deliveries
    ADD CONSTRAINT deliveries_pkey PRIMARY KEY (id);


--
-- Name: ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: order_deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_deliveries
    ADD CONSTRAINT order_deliveries_pkey PRIMARY KEY (id);


--
-- Name: order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_products
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: pallets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pallets
    ADD CONSTRAINT pallets_pkey PRIMARY KEY (id);


--
-- Name: product_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_ingredients
    ADD CONSTRAINT product_ingredients_pkey PRIMARY KEY (id);


--
-- Name: production_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY production_blocks
    ADD CONSTRAINT production_blocks_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: index_order_deliveries_on_delivery_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_deliveries_on_delivery_id ON order_deliveries USING btree (delivery_id);


--
-- Name: index_order_deliveries_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_deliveries_on_order_id ON order_deliveries USING btree (order_id);


--
-- Name: index_order_products_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_products_on_order_id ON order_products USING btree (order_id);


--
-- Name: index_order_products_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_products_on_product_id ON order_products USING btree (product_id);


--
-- Name: index_orders_on_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_customer_id ON orders USING btree (customer_id);


--
-- Name: index_pallets_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pallets_on_product_id ON pallets USING btree (product_id);


--
-- Name: index_product_ingredients_on_ingredient_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_ingredients_on_ingredient_id ON product_ingredients USING btree (ingredient_id);


--
-- Name: index_product_ingredients_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_ingredients_on_product_id ON product_ingredients USING btree (product_id);


--
-- Name: index_production_blocks_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_production_blocks_on_product_id ON production_blocks USING btree (product_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_15f6138106; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_ingredients
    ADD CONSTRAINT fk_rails_15f6138106 FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_26a168bb53; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_deliveries
    ADD CONSTRAINT fk_rails_26a168bb53 FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- Name: fk_rails_2f4ebe7c3f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_deliveries
    ADD CONSTRAINT fk_rails_2f4ebe7c3f FOREIGN KEY (delivery_id) REFERENCES deliveries(id);


--
-- Name: fk_rails_67e6bf9279; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_ingredients
    ADD CONSTRAINT fk_rails_67e6bf9279 FOREIGN KEY (ingredient_id) REFERENCES ingredients(id);


--
-- Name: fk_rails_96c0709f78; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_products
    ADD CONSTRAINT fk_rails_96c0709f78 FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_b538e7e080; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_rails_b538e7e080 FOREIGN KEY (order_delivery_id) REFERENCES order_deliveries(id);


--
-- Name: fk_rails_ddacffc59b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_rails_ddacffc59b FOREIGN KEY (customer_id) REFERENCES customers(id);


--
-- Name: fk_rails_e35377f3ec; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY production_blocks
    ADD CONSTRAINT fk_rails_e35377f3ec FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_f3fbb0b3f6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pallets
    ADD CONSTRAINT fk_rails_f3fbb0b3f6 FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_f40b8ccee4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_products
    ADD CONSTRAINT fk_rails_f40b8ccee4 FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- Name: fk_rails_f6722ed271; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pallets
    ADD CONSTRAINT fk_rails_f6722ed271 FOREIGN KEY (order_delivery_id) REFERENCES order_deliveries(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20160331050035');

INSERT INTO schema_migrations (version) VALUES ('20160331050040');

INSERT INTO schema_migrations (version) VALUES ('20160331050045');

INSERT INTO schema_migrations (version) VALUES ('20160331050051');

INSERT INTO schema_migrations (version) VALUES ('20160331050058');

INSERT INTO schema_migrations (version) VALUES ('20160331051229');

INSERT INTO schema_migrations (version) VALUES ('20160331055618');

INSERT INTO schema_migrations (version) VALUES ('20160407111143');

INSERT INTO schema_migrations (version) VALUES ('20160407112526');

INSERT INTO schema_migrations (version) VALUES ('20160407135648');

INSERT INTO schema_migrations (version) VALUES ('20160407135649');

INSERT INTO schema_migrations (version) VALUES ('20160407135650');

INSERT INTO schema_migrations (version) VALUES ('20160407135651');

INSERT INTO schema_migrations (version) VALUES ('20160407135652');

