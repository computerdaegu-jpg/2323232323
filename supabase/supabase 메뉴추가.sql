-- MELLOW BEAN Menu 섹션에 메뉴 5개 추가하는 스크립트
-- Supabase 대시보드 > SQL Editor 에 전체를 붙여넣고 Run 하세요.
-- (menu 테이블이 이미 만들어져 있어야 합니다. 없다면 supabase-menu.sql을 먼저 실행하세요.)

insert into menu (name, description, price) values
('Hazelnut Mocha', '초콜릿과 헤이즐넛 향이 어우러진 진한 모카', 6000),
('Cold Brew', '12시간 저온으로 추출한 부드럽고 깔끔한 콜드브루', 5500),
('Honey Bread', '겉은 바삭하고 속은 폭신한 시그니처 허니브레드', 8000),
('Earl Grey Tea', '은은한 베르가못 향이 감도는 얼그레이 홍차', 5000),
('Choco Brownie', '진한 초콜릿 풍미가 가득한 촉촉한 브라우니', 5500);
