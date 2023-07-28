SELECT * FROM product.product_tb;

select
	pt.product_id,
    pt.product_name,
    pt.product_price,
    
    pt.product_color_id,
    pcot.product_color_name,
    
    pt.product_category_id,
    pcat.product_category_name
    
from
	product_tb pt
    left outer join product_color_tb pct on(pcot.product_color_id = pt.product_color_id)
    left outer join product_category_tb pcat on(pcat.product_category_id = pt.product_category_id)
where
	1 = 1
    and
	pt.product_name like '%?????%'