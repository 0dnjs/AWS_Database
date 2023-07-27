insert into product_color_tb
values(0, 'black');

select * from product_color_tb;
select * from product_category_tb;

commit;

select
	product_color_id,
    product_color_name
from
	product_color_tb
where
	product_color_name = ?
    ;
select @@autocommit;

set autocommit = 1;