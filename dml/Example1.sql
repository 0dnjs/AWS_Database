
/*

1. 검색창에 상구라고 검색했을 때 해당 user에 등록된 모든 주소를 조회하시오.
2. 상품별 총 판매 수량, 판매 총액을 조회하시오.
3. 카테고리별 등록된 상품이 몇개씩 동록되어 있는지 조회하시오.
4. address_tb sido 컬럼을 참조하여 각 지역별로 판매된 상품의 총액을 조회하시오. (null값 빼고 판매량이 없을때는 0이 나오게)
5. 상품명이 '나이키'가 포함된 제품이 몇개가 판매되었고 판매된 총액은 얼마인지 조회하시오.


*/


-- 1. 검색창에 상구라고 검색했을 때 해당 user에 등록된 모든 주소를 조회하시오.

select
	ut.name,
     at.address
from
	user_tb ut
    left outer join address_tb at on(at.user_id = ut.user_id)
where
	ut.name = '상구';
    
    
-- 2. 상품별 총 판매 수량, 판매 총액을 조회하시오.


select
	pt.product_name,
	sum(odt.count_number) as total_count_number,
	sum(pt.product_price * odt.count_number) as total_product_price
 --   ifnull(total_count_number, 0)
from
	product_tb pt
    inner join order_detail_tb odt on(odt.product_id = pt.product_id)
group by
 	product_name
order by
	total_count_number,
    total_product_price;
    
    
    
-- 3. 카테고리별 등록된 상품이 몇개씩 동록되어 있는지 조회하시오.

select
	pt.category_id,
	ct.category_name,
	sum(pt.category_id) as total_category_id
    
from
	category_tb pt
    left outer join category_tb ct on(pt.category_id = ct.category_id)
group by
	pt.category_id,
    ct.category_name;    


-- 4. address_tb sido 컬럼을 참조하여 각 지역별로 판매된 상품의 총액을 조회하시오. (null값 빼고 판매량이 없을때는 0이 나오게)


select
 	at.address_sido,
     ifnull(sum(pt.product_price * odt.count_number), 0)

from
	address_tb at
    left outer join order_tb ot on ( ot.address_id = at.address_id)
	left outer join order_detail_tb odt on (odt.order_id = ot.order_id)
    left outer join product_tb pt on (pt.product_id = odt.product_id)
    
 group by
	at.address_sido;
    
    
    
 -- 5. 상품명이 '나이키'가 포함된 제품이 몇개가 판매되었고 판매된 총액은 얼마인지 조회하시오.

select
	'나이키' as search_value,
	sum(odt.count_number) as total_order_count,
    sum(odt.count_number * pt.product_price) as total_product_price
from
	 order_detail_tb odt
    left outer join product_tb pt on (pt.product_id = odt.product_id) 
group by
	pt.product_name like '%나이키%';