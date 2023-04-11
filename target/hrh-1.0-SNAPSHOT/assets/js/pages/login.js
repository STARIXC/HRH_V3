/**
 * 
 */
jQuery(document).ready(function () {
    var jsonData;
    var i = 1;
    
  
// jQuery ajax form submit example, runs when form is submitted
    $("#login_form").submit(function (e) {
        e.preventDefault(); // prevent actual form submit
        var form = $("#login_form");
         var action = "login";
         
        var data = form.serialize() + "&action=" + action;
        var url = './login'; //get submit url [replace url here if desired]
        // screenLock();
        $.ajax({
            type: "GET",
            url: url,
            data: data,
            contentType: "application/json; charset-utf-8",
            dataType: "json",
            // serializes form input
            beforeSend: function beforeSend() {
                //	startLoader();
                console.log(data);
            },
            success: function (data) {
                console.log(data);
                var app ="/hrh";
                var url_ = app +data.nextPage;
                $(location).attr('href', url_);
            },
            error: function error(result) {
                console.log(result);
            },
            complete: function complete() {
                //	stopLoader();

            }
        });

    });


});