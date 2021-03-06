Задание: 1
Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
Решение:
SELECT Product.model,PC.speed, PC.hd FROM Product, PC
WHERE Product.model = PC.model AND price < 500;

Задание: 2
Найдите производителей принтеров. Вывести: maker
Решение:
SELECT DISTINCT Product.maker FROM product, printer
WHERE Product.type = 'Printer';

Задание: 3 
Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
Решение:
SELECT DISTINCT Product.model, Laptop.ram, Laptop.screen FROM  Product, Laptop
WHERE Product.model = Laptop.model AND price > 1000;

Задание: 4 
Найдите все записи таблицы Printer для цветных принтеров.
Решение:
SELECT*FROM Printer
WHERE color = 'y'

Задание: 5 
Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
Решение:
SELECT model, PC.speed, PC.hd FROM PC
WHERE CD in ( '12x' , '24x')
AND price < 600

Задание: 6 
Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. 
Вывод: производитель, скорость.
Решение:
SELECT DISTINCT product.maker, laptop.speed
FROM Product
INNER JOIN Laptop ON product.model = laptop.model
WHERE laptop.hd >= 10

Задание: 7
Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
Решение:
SELECT Product.model, price
FROM Product INNER JOIN 
Printer ON Product.model = Printer.model
WHERE maker = 'B' 
UNION
SELECT Product.model, price
FROM Product INNER JOIN 
Laptop ON Product.model = Laptop.model
WHERE maker = 'B' 
UNION
SELECT Product.model, price
FROM Product INNER JOIN 
PC ON Product.model = PC.model
WHERE maker = 'B'

Задание: 8
Найдите производителя, выпускающего ПК, но не ПК-блокноты.
Решение:
SELECT DISTINCT product.maker
FROM product
WHERE type = 'pc'
EXCEPT
SELECT DISTINCT product.maker
FROM product
Where type = 'laptop'

Задание: 9
Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
Решение:
SELECT DISTINCT product.maker
FROM Product
INNER JOIN PC ON product.model = PC.model
WHERE PC.speed >= 450

Задание: 10
Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
Решение:
SELECT model, price 
FROM printer
WHERE printer.price = (SELECT MAX(price) FROM printer)

Задание: 11
Найдите среднюю скорость ПК.
Решение:
SELECT AVG (speed) FROM PC

Задание: 12
Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
Решение:
SELECT AVG (speed) AS Avg_speed From Laptop
WHERE Laptop.price IN (Select price 
FROM Laptop
WHERE Laptop.price > 1000)

Задание: 13 
Найдите среднюю скорость ПК, выпущенных производителем A.
Решение:
SELECT AVG (speed) AS Avg_speed FROM PC
INNER JOIN Product ON product.model = PC.model
WHERE maker = 'A'

Задание: 14 
Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
Решение:
SELECT Ships.class, Ships.name, Classes.country FROM Classes
INNER JOIN Ships on Classes.class = Ships.class
WHERE numGuns >= '10'

Задание: 15 
Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
Решение:
SELECT DISTINCT hd FROM PC
GROUP BY hd
HAVING COUNT (model) >= 2;

Задание: 16
Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается 
только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим
номером, скорость и RAM.
Решение:
SELECT DISTINCT p1.model, p2.model, p1.speed, p1.ram
FROM pc p1, pc p2
WHERE p1.speed = p2.speed AND p1.ram = p2.ram AND p1.model > p2.model;

Задание: 17 
Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed
Решение:
SELECT DISTINCT Product.type, Laptop.model, speed
FROM Laptop, Product
WHERE type = 'Laptop' and
speed < ALL (SELECT speed 
 FROM PC);

Задание: 18 
Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
Решение:
SELECT DISTINCT product.maker, printer.price
FROM product, printer
WHERE product.model = printer.model
AND printer.color = 'y'
AND printer.price = (Select MIN (price) from Printer 
Where printer.color = 'y')

Задание: 19
Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
Вывести: maker, средний размер экрана.
Решение:
SELECT maker, AVG ( screen ) AS AVG_screen FROM Laptop
Inner join Product on Product.model = Laptop.model
Group by maker

Задание: 20 
Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.
Решение:
SELECT maker, COUNT(model) AS Count_Model
FROM Product
WHERE type = 'pc'
GROUP BY maker
HAVING COUNT (model) >= 3

Задание: 21 
Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
Вывести: maker, максимальная цена.
Решение:
SELECT maker, MAX ( price ) AS MAX_price FROM PC
INNER JOIN Product on Product.model = PC.model
GROUP BY maker

Задание: 22 
Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.
Решение:
Select Distinct speed,  AVG (price) AS Avg_price from PC
Where speed > 600
Group by speed

Задание: 23
Найдите производителей, которые производили бы как ПК
со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
Вывести: Maker
Решение:
SELECT Distinct maker from Product
inner join PC on Product.model = PC.model
Where PC.speed >= 750
INTERSECT
SELECT Distinct maker from Product
inner join Laptop on Product.model = Laptop.model
Where Laptop.speed >= 750

Задание: 24 
Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.
Решение:
SELECT model FROM (SELECT model, price FROM pc
UNION
SELECT model, price FROM Laptop
UNION
SELECT model, price FROM Printer
) t1
WHERE price = (SELECT MAX(price)
FROM (SELECT price FROM pc
UNION
SELECT price FROM Laptop
UNION
SELECT price FROM Printer) t2 )

Задание: 25
Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК,
имеющих наименьший объем RAM. Вывести: Maker
Решение:
SELECT DISTINCT maker FROM product
WHERE model IN (SELECT model FROM pc
WHERE ram = (SELECT MIN(ram) FROM pc)
AND speed = (SELECT MAX(speed) FROM pc
WHERE ram = (SELECT MIN(ram) FROM pc)))
AND maker IN (SELECT maker FROM product
WHERE type ='printer');

Задание: 26 
Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.
Решение:
SELECT AVG(price)
FROM (SELECT code, price, pc.model, ram, hd
FROM pc
WHERE model IN (SELECT model FROM product
WHERE maker='a')
UNION
SELECT code, price, laptop.model, ram, hd FROM laptop
WHERE model IN (SELECT model FROM product
WHERE maker='a')
) a

Задание: 27 
Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.
Решение:
Select Product.maker, AVG(pc.hd) from Product, PC
Where Product.model = PC.model AND 
Product.maker in (Select Distinct maker from Product Where product.type = 'Printer')
Group by maker

Задание: 28 
Используя таблицу Product, определить количество производителей, выпускающих по одной модели.
Решение:
select count(maker)
from product
where maker in
(Select maker from product
group by maker
having count(model) = 1)

Задание: 29
В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день [т.е. первичный ключ (пункт, дата)],
написать запрос с выходными данными (пункт, дата, приход, расход). Использовать таблицы Income_o и Outcome_o.
Решение:
SELECT t1.point, t1.date, inc, out
FROM income_o t1 LEFT JOIN outcome_o t2 ON t1.point = t2.point
AND t1.date = t2.date
UNION
SELECT t2.point, t2.date, inc, out
FROM income_o t1 RIGHT JOIN outcome_o t2 ON t1.point = t2.point
AND t1.date = t2.date

Задание: 30 
В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз (первичным ключом в таблицах является столбец code), требуется получить таблицу,
в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка.
Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc). Отсутствующие значения считать неопределенными (NULL).
Решение:
select point, date, SUM(sum_out), SUM(sum_inc)
from( select point, date, SUM(inc) as sum_inc, null as sum_out from Income Group by point, date
Union
select point, date, null as sum_inc, SUM(out) as sum_out from Outcome Group by point, date ) as t
group by point, date order by point


