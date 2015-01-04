function adjustNav () {
	$(".core").removeClass("nav-visible");
}

// Adjust nav appearance initially
adjustNav();

// Adjust nav appearance every time window is resized
$(window).resize(adjustNav);

// Toggle menu visibility in mobile mode
$(".mobile-nav").click(function () {
	$("nav ul").toggle();
	$(".core").toggleClass("nav-visible");
});