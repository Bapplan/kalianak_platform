-- Fix the foreign key constraint for orders_orderside.side_id
ALTER TABLE orders_orderside 
DROP CONSTRAINT IF EXISTS orders_orderside_side_id_fkey;

ALTER TABLE orders_orderside
ADD CONSTRAINT orders_orderside_side_id_fkey
FOREIGN KEY (side_id) REFERENCES inventory_side(id) ON DELETE RESTRICT;

-- Update Django's migration record to mark all migrations as applied
UPDATE django_migrations 
SET applied = TRUE 
WHERE app = 'orders' AND name LIKE '%fix_side%';
