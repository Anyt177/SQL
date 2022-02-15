1.select model,speed,hd from pc where pc.price<500
2.select maker from product
where product.type='printer' GROUP BY maker
3.Select model,ram,screen from laptop where price>1000
4.Select*from printer where color='y'
5.Select model,speed,hd from PC where (cd='12x' or cd='24x')and price<600
6.Select DISTINCT product.maker,laptop.speed from laptop join product on Product.model=laptop.model where laptop.hd>=10
7.Select product.model, pc.price 
from  product join pc on product.model=pc.model where maker='B' union
Select product.model, laptop.price 
from  product join laptop on product.model=laptop.model where maker='B' union
Select product.model, printer.price 
from  product join printer on product.model=printer.model where maker='B'
8 select maker from product
where type ='pc' except select maker from product 
where type = 'laptop'
9.Select DISTINCT product.maker from product join pc on product.model=pc.model
where speed>=450
10. select model,price from printer where price=(select max(price) from printer)
11. Select avg(speed) from pc
12.Select avg(speed) from laptop where price >1000
13.select avg(speed) from pc join product on product.model=pc.model where maker='A'
14.select  ships.class,ships.name, classes.country from classes join ships on classes.class=ships.class
where classes.numguns>=10
15.select hd from pc group by hd
having count(hd)>1
16.Select DISTINCT a.model, b.model, a.speed, a.ram from pc as a, pc as b
where a.speed = b.speed and a.ram = b.ram and a.model > b.model
ORDER BY a.model
17.SELECT DISTINCT product.type ,laptop.model,laptop.speed 
FROM Laptop JOIN Product 
ON product.model=laptop.model
WHERE speed < All (SELECT speed FROM PC)
18.SELECT DISTINCT product.maker ,printer.price
FROM Product product JOIN Printer 
ON product.model = printer.model
where printer.color='y' and printer.price=(SELECT MIN(price) FROM Printer where color='y')
19.select product.maker, AVG(laptop.screen)  from  Laptop JOIN Product 
ON product.model=laptop.model
group by product.maker
20.Select product.maker, count(product.model) AS Count_Model  from product
WHERE product.type='PC'
group by product.maker
HAVING COUNT(product.model)>=3
21.Select product.maker, max(pc.price) as max_price
from product join pc ON product.model = pc.model
group by product.maker
22.Select speed,avg(price) as Avg_price from pc 
where speed>600
group by speed
23.Select product.maker from product join pc ON product.model = pc.model where pc.speed>=750
intersect
Select product.maker from product join laptop ON product.model = laptop.model where laptop.speed>=750
24.WITH all_models AS 
(SELECT model, price FROM pc 
UNION all
SELECT model, price FROM laptop 
UNION all
SELECT model, price FROM printer)
SELECT distinct model FROM all_models WHERE price = all(SELECT MAX(price) FROM all_models)
25.select distinct product.maker from product join pc on product.model = pc.model where pc.ram = (select min(ram) from pc) and pc.speed = (SELECT MAX(speed) FROM pc WHERE ram = (SELECT MIN(ram) FROM pc)) and product.maker in (SELECT maker FROM product WHERE type = 'printer')
26.SELECT AVG(price) FROM (
SELECT price
FROM pc WHERE model IN (SELECT model FROM product WHERE maker = 'A' AND type = 'PC')
UNION ALL
SELECT price FROM Laptop WHERE model IN (SELECT model FROM product
WHERE maker = 'A' AND type = 'Laptop')) as p
27.Select product.maker, avg(pc.hd) from pc join product on pc.model=product.model where product.maker in(select maker from product where type = 'printer') group by product.maker
