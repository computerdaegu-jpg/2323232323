-- MELLOW BEAN Menu 섹션용 Supabase 테이블 생성 스크립트
-- Supabase 대시보드 > SQL Editor 에 전체를 붙여넣고 Run 하세요.

-- 0) 이전에 만들다 만 테이블이 있다면 먼저 삭제 (재실행해도 안전하도록)
drop table if exists menu cascade;

-- 1) menu 테이블 생성
create table menu (
  id bigint generated always as identity primary key,
  name text not null,
  description text,
  price integer not null,
  image_url text,
  created_at timestamp with time zone default now()
);

-- 2) 현재 사이트에 있는 메뉴 3개 삽입
insert into menu (name, description, price, image_url) values
('Cream Latte', '부드러운 크림과 에스프레소가 어우러진 시그니처 라떼', 6500, 'img/Cream Latte.jpg'),
('Classic Tiramisu', '진한 마스카포네 크림과 커피 향을 담은 수제 티라미수', 7000, 'img/Classsic Tiramisu.jpg'),
('Mellow Ade', '레몬과 허브를 사용한 상큼한 시그니처 에이드', 6000, 'img/Mellow Ade.jpg');

-- 3) 방문자(비로그인)가 메뉴를 읽을 수 있도록 공개 읽기 권한 설정
alter table menu enable row level security;

create policy "Public read menu"
on menu for select
using (true);
