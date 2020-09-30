// Fix table head
function logTable (e) {
    const el = e.target,
          sT = el.scrollTop;
    el.querySelectorAll("thead th").forEach(th => 
      th.style.transform = `translateY(${sT}px)`
    );
}
document.querySelectorAll(".logTable").forEach(el => 
    el.addEventListener("scroll", logTable)
);