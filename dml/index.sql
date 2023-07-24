insert into product_tb
values
	(20230701, '상품1'),
	(20230702, '상품2'),
	(20230703, '상품3'),
	(20230704, '상품4'),
	(20230705, '상품5');

create view product_view as    
select * from product_tb;

create index product_code_index on product_tb(product_code); -- 시험에나옴 

show index from product_tb; -- index 확인하는법 

show full tables in study3 where table_type like 'VIEW';  -- 해당 데이터베이스안에 있는 view를 조회해줌
										 -- like 대신 = 써도됨

show full tables in study3;

show tables;  -- 해당 데이터베이스 안에 있는 모든 tables  



