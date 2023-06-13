#Вывести информацию о лабораториях, у которых количество оборудования больше 5 и общий вес продукции больше 1000, отсортированную по общему весу продукции по убыванию:
SELECT bb.lab.lab_id, bb.lab.loc, SUM(bb.product.total_weight) as total_weight 
FROM bb.lab 
JOIN bb.hardware ON bb.lab.lab_id = bb.hardware.lab_id 
JOIN bb.product ON bb.lab.lab_id = bb.product.lab_id 
GROUP BY bb.lab.lab_id 
HAVING COUNT(bb.hardware.hardware_id) > 5 AND SUM(bb.product.total_weight) > 1000 
ORDER BY total_weight DESC;

#Вывести информацию о дилерах и количестве проданных ими продуктов, у которых надежность дилера больше 3 и количество проданных продуктов больше 50, отсортированных по количеству проданных продуктов по убыванию:
SELECT bb.dealer.dealer_id, bb.dealer.nm, COUNT(bb.deal.lot_id) as sold_products 
FROM bb.dealer 
JOIN bb.deal ON bb.dealer.dealer_id = bb.deal.dealer_id 
JOIN bb.customer ON bb.deal.customer_id = bb.customer.customer_id 
WHERE bb.customer.reliability > 3 
GROUP BY bb.dealer.dealer_id 
HAVING COUNT(bb.deal.lot_id) > 50 
ORDER BY sold_products DESC;

#Вывести информацию о лабораториях и количестве оборудования у каждой лаборатории, отсортированных по количеству оборудования по убыванию:
SELECT bb.lab.lab_id, bb.lab.loc, COUNT(bb.hardware.hardware_id) as hardware_count 
FROM bb.lab 
JOIN bb.hardware ON bb.lab.lab_id = bb.hardware.lab_id 
GROUP BY bb.lab.lab_id, bb.lab.loc 
ORDER BY hardware_count DESC;

#Вывести информацию о лабораториях и количестве продукции у каждой лаборатории, отсортированных по количеству продукции по убыванию:
SELECT bb.lab.lab_id, bb.lab.loc, SUM(bb.product.total_weight) as total_weight 
FROM bb.lab 
JOIN bb.product ON bb.lab.lab_id = bb.product.lab_id 
GROUP BY bb.lab.lab_id, bb.lab.loc 
ORDER BY total_weight DESC;

#Вывести информацию о депо и свободной вместимости у каждого депо, у которых свободная вместимость больше 50, отсортированных по свободной вместимости по убыванию:
SELECT bb.depot.dep_id, bb.depot.address, bb.depot.capacity - SUM(bb.product.total_weight) as free_capacity 
FROM bb.depot 
LEFT JOIN bb.product ON bb.depot.lot_id = bb.product.lot_id 
GROUP BY bb.depot.dep_id, bb.depot.address, bb.depot.capacity 
HAVING free_capacity > 50 
ORDER BY free_capacity DESC;

#Описание: Данный запрос находит всех поваров (nm) в лаборатории 1, сортирует их по убыванию уровня лояльности (loyalty) и присваивает каждому повару ранг (rank) по уровню лояльности.
Тесты:
1. В таблице bb.cook нет поваров из лаборатории 1. Ожидаемый результат: пустой результат.
2. В таблице bb.cook есть два повара из лаборатории 1 с одинаковым уровнем лояльности. Ожидаемый результат: оба повара получат ранг 1.
3. В таблице bb.cook есть три повара из лаборатории 1 с разным уровнем лояльности. Ожидаемый результат: повар с наивысшим уровнем лояльности получит ранг 1.

SELECT nm, loyalty, RANK() OVER(ORDER BY loyalty DESC) as rank
FROM bb.cook
WHERE lab_id=1
ORDER BY loyalty DESC;
