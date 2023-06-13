#Для таблицы cook создать индекс по полю lab_id, так как это поле используется в качестве внешнего ключа для связи с таблицей lab.
CREATE INDEX idx_cook_lab_id ON bb.cook (lab_id);

#Для таблицы hardware создать индекс по полю lab_id, так как это поле используется в качестве внешнего ключа для связи с таблицей lab.
CREATE INDEX idx_hardware_lab_id ON bb.hardware (lab_id);

#Для таблицы product создать индекс по полю lab_id, так как это поле используется в качестве внешнего ключа для связи с таблицей lab.
CREATE INDEX idx_product_lab_id ON bb.product (lab_id);

#Для таблицы depot создать индекс по полю lot_id, так как это поле используется в качестве внешнего ключа для связи с таблицей product.
CREATE INDEX idx_depot_lot_id ON bb.depot (lot_id);

#Для таблицы dealer создать индекс по полю lot_id, так как это поле используется в качестве внешнего ключа для связи с таблицей product.
CREATE INDEX idx_dealer_lot_id ON bb.dealer (lot_id);

#Для таблицы deal создать индекс по полю lot_id, так как это поле используется в качестве внешнего ключа для связи с таблицей product.
CREATE INDEX idx_deal_lot_id ON bb.deal (lot_id);
