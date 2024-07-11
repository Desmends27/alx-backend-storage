-- creates a triiger that decrease quantity
-- of an item after adding new order
DELIMITER //

CREATE TRIGGER after_ordering_item
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
	UPDATE items
	SET quantity = quantity - NEW.number
	WHERE name = NEW.item_name;
END //
DELIMITER ;
