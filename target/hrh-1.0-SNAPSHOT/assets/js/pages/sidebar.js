
$(document).ready(function () {

    var app = "/hrh";
    let uwezo = $("#uwezo").val();


    function get_menu() {
        
    }

//    $.ajax({
//        url: `${app}/GetMenu?uwezo=${uwezo}`, // Replace with the actual servlet URL
//        type: 'GET',
//        contentType: "application/json; charset=utf-8", // Corrected content type
//        dataType: "json",
//        success: function (data) {
//            console.log(eval(data));
//            buildMenu($('#companyMenu .new_menu'), data); // Assuming buildMenu is a function to generate menu from JSON
//        },
//        error: function (error) {
//            // Hide loader
////                $('#loader').hide();
//            console.log(`Error: ${error}`);
//        }
//    });

    function buildMenu(menuData) {
        $('#companyMenu .new_menu').empty();
        for (var i = 0; i < menuData.length; i++) {
            var menuItem = menuData[i];
            var menuHtml = '<li class="sidebar-item">';

            if (menuItem.sub_menu && menuItem.sub_menu.length > 0) {
                menuHtml += '<a href="#" class="sidebar-link has-sub">';
                menuHtml += '<i class="' + menuItem.icon_class + ' breadcrumbColor"></i>';
                menuHtml += '<span>' + menuItem.name + '</span>';
                menuHtml += '</a>';
                menuHtml += '<ul class="submenu">';
                menuHtml += buildSubMenu(menuItem.sub_menu);
                menuHtml += '</ul>';
            } else {
                menuHtml += '<a href="' + (menuItem.menu_url ? menuItem.menu_url : '#') + '" class="sidebar-link">';
                menuHtml += '<i class="' + menuItem.icon_class + ' breadcrumbColor"></i>';
                menuHtml += '<span>' + menuItem.name + '</span>';
                menuHtml += '</a>';
            }

            menuHtml += '</li>';
            $('#companyMenu .new_menu').append(menuHtml);
        }
    }

    function buildSubMenu(subMenuData) {
        var subMenuHtml = '';
        for (var i = 0; i < subMenuData.length; i++) {
            var subMenuItem = subMenuData[i];
            subMenuHtml += '<li class="sidebar-item">';
            subMenuHtml += '<a href="' + (subMenuItem.menu_url ? subMenuItem.menu_url : '#') + '" class="sidebar-link">';
            subMenuHtml += '<i class="fa fa-circle-notch"></i>';
            subMenuHtml += '<span>' + subMenuItem.name + '</span>';
            subMenuHtml += '</a>';
            subMenuHtml += '</li>';
        }
        return subMenuHtml;
    }


    get_menu();

});

