$(document).ready(function() {
	$("#sidebarCollapse").on("click", function() {
		$("#sidebar").toggleClass("active");
		$("#content").toggleClass("active");
	});

	$(".more-button,.body-overlay").on("click", function() {
		$("#sidebar,.body-overlay").toggleClass("show-nav");
	});


window.removeCommas = function (str) {
  return str.replace(/,/g, '');
};

window.isEmpty = function (value) {
  return value === undefined || value === null || value === '';
};

window.onload = function () {
  window.startLoader = function () {
    $('.hrh-loader').show();
  };

  window.stopLoader = function () {
    $('.hrh-loader').hide();
  }; // infy loader js


  stopLoader();
};
window.screenLock = function () {
  $('#overlay-screen-lock').show();
  $('body').css({
    'pointer-events': 'none',
    'opacity': '0.6'
  });
};

window.screenUnLock = function () {
  $('body').css({
    'pointer-events': 'auto',
    'opacity': '1'
  });
  $('#overlay-screen-lock').hide();
};

});