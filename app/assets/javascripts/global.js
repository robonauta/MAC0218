function smoothScrollingTo(target) {
  $(target)[0].scrollIntoView({ block: 'start',  behavior: 'smooth' });
}

$(document).on('click', 'a[href^="#"]', function (event) {
    event.preventDefault();
    smoothScrollingTo(this.hash);
});