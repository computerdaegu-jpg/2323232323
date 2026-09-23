// Supabase 연결 정보
const SUPABASE_URL = "https://hrxplqjgsphchmmbtksp.supabase.co";
const SUPABASE_KEY = "sb_publishable_LK7HIEmX1rJnToezUncX8g_L7s1xaKx";
const supabaseClient = supabase.createClient(SUPABASE_URL, SUPABASE_KEY);

// menu 테이블에서 메뉴 데이터를 불러와 카드로 표시
async function loadMenu() {
  const menuList = document.querySelector(".menu-list");
  if (!menuList) return;

  const { data, error } = await supabaseClient
    .from("menu")
    .select("*")
    .order("id", { ascending: true });

  if (error) {
    console.error("메뉴를 불러오지 못했습니다:", error);
    return;
  }

  menuList.innerHTML = "";

  data.forEach(function (item) {
    const card = document.createElement("div");
    card.className = "menu-card";
    card.innerHTML =
      '<img class="menu-img" src="' + item.image_url + '" alt="' + item.name + '" />' +
      "<h3>" + item.name + "</h3>" +
      "<p>" + item.description + "</p>" +
      '<span class="price">' + item.price.toLocaleString("ko-KR") + "원</span>";
    menuList.appendChild(card);
  });
}

loadMenu();

// 네비게이션 및 버튼 클릭 시 부드럽게 스크롤 이동
document.querySelectorAll('a[href^="#"]').forEach(function (link) {
  link.addEventListener("click", function (event) {
    event.preventDefault();

    var targetId = link.getAttribute("href").substring(1);
    var targetSection = document.getElementById(targetId);

    if (targetSection) {
      targetSection.scrollIntoView({ behavior: "smooth" });
    }
  });
});
