USE storefront;

-- Identify the columns require indexing in order, product, category tables and create indexes.
ALTER TABLE orders ADD INDEX order_index(id);

ALTER TABLE product ADD INDEX product_index(id);

ALTER TABLE category ADD INDEX category_index(id);

EXPLAIN SELECT * FROM product;