# 사용자 추가
create user test1@localhost identified by '1234'; -- identified by는 비밀번호
			-- localhost는 서버가 깔려진 pc에서만 접속가능 %는 어디에서든 접속가능 ip를 적으면 정해진 ip에서만 접속가능 
            
use mysql; -- mysql 쓰겠다 데이터베이스 선택 더블클릭해서 까매진거랑 똑같음
select host, user from user;

# 사용자 권한
revoke all on study3.* from test1@localhost;
-- revoke는 모든권한을 회수하겠다
 
grant all privileges on study3.user_tb to test1@localhost;
-- all privileges 모든 권한 on 뒤에 study3에 user_tb에 대해서만 권한을 to test1에게 주겠다

create user 'test2'@'%' identified by '1234';

use mysql;
select host, user from user;

alter user 'test2'@'%' identified by '1111'; -- alter를 써서 비밀번호 바꾸기 
flush privileges;

alter user 'test1'@'localhost' identified by '1111';
flush privileges; -- 계정에 대한 명령은 flush를 써줘야함 

grant select, insert,update on `study3`.`user_tb` to 'test2'@'%';
-- grant는 권한주는것, to로 씀 권한 select, insert 등등 정해진 명령에대해서만 쓸수있게 설정할수있음 
flush privileges;

revoke insert on `study3`.`user_tb` from 'test2'@'%';
-- insert 를 권한에서 지우겠다 revoke은 삭제 from으로 적어야함
flush privileges;

show grants for 'test2'@'%'; -- 어떤 권한을 줬는지 볼수있음 



# '자신의 이름(영문)'@서버에서만 접속 가능, 비밀번호는 1234
# 해당 계정의 비밀번호를  1q2w3e4r로 변경
# 권한 study2데이터베이스 -> user_tb(select, insert, update, delete)
# update권한 회수

# 권한 study3 데이터베이스 -> product_tb(select) 
# delete 권한 추가

# '자신의 이름(영문)'@서버에서만 접속 가능, 비밀번호는 1234
create user 'Imyerim'@'localhost' identified by '1234';

# 해당 계정의 비밀번호를  1q2w3e4r로 변경
alter user 'Imyerim'@'localhost' identified by '1q2w3e4r';
flush privileges;

# 권한 study2데이터베이스 -> user_tb(select, insert, update, delete)
grant select, insert,update,delete on `study2`.`user_tb` to 'Imyerim'@'localhost';
flush privileges;

# update권한 회수
revoke update on `study2`.`user_tb` from 'Imyerim'@'localhost';
flush privileges;

# 권한 study3 데이터베이스 -> product_tb(select) 
grant select on `study3`.`product_tb` to 'Imyerim'@'localhost';
flush privileges;

# delete 권한 추가
grant delete on `study3`.`product_tb` to 'Imyerim'@'localhost';
flush privileges;

show grants for 'Imyerim'@'localhost';

select version();
