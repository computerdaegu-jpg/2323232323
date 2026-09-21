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
