CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT,
    sale_date DATE,
    product_id INT,
    amount DECIMAL(10, 2),
    PRIMARY KEY (sale_id, sale_date)
)
PARTITION BY RANGE (YEAR(sale_date)) (
    PARTITION p0 VALUES LESS THAN (1990),
    PARTITION p1 VALUES LESS THAN (2000),
    PARTITION p2 VALUES LESS THAN (2010),
    PARTITION p3 VALUES LESS THAN MAXVALUE
);


SELECT table_name, partition_name, subpartition_name, partition_ordinal_position
FROM information_schema.partitions
WHERE table_name = 'sales';
