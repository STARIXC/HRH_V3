
<!DOCTYPE html>
<html lang="en">
     <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        <script defer src="assets/fontawesome/js/all.min.js"></script>
        <script defer src="assets/fontawesome/js/all.min.js"></script>
        <link rel="stylesheet" href="assets/css/app.css">
    </head>

    <body>
        <div id="auth">

            <div class="container">
                <div class="row">
                    <div class="col-md-5 col-sm-12 mx-auto">
                        <div class="card pt-4">
                            <div class="card-body">
                                <div class="text-center mb-5">
                                    <h3>Sign In</h3>
                                </div>
                                <form id="login_form" autocomplete="off">
                                    <div class="form-group position-relative has-icon-left">
                                        <label for="username">Username</label>
                                        <div class="position-relative">
                                            <input type="text" class="form-control" id="username" name="username">
                                            <div class="form-control-icon">
                                                <i class="fa fa-user"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group position-relative has-icon-left">
                                        <div class="clearfix">
                                            <label for="password">Password</label> <a href="#"
                                                                                      class='float-end'> <small>Forgot password?</small>
                                            </a>
                                        </div>
                                        <div class="position-relative">
                                            <input type="password" class="form-control" id="password" name="password">
                                            <div class="form-control-icon">
                                                <i class="fa fa-key"></i>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="clearfix ">
                                        <button type="submit" id="login" name="login"  class="btn btn-primary float-end">Login</button>
                                    </div>


                                </form>
                                <div class='form-check clearfix pt-2' >
                                    <div class="copyrights text-center">
                                        <%
                                            Calendar cal = Calendar.getInstance();
                                            int year = cal.get(Calendar.YEAR);

                                        %>

                                        <img src="assets/images/aphia_logo.png"
                                             style=" width: 375px;">

                                        <p>
                                            <a href="" class="external"> &copy USAID TUJENGE JAMII <%=year%></a>
                                        </p>
                                    </div>

                                </div>	
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- JavaScript files-->
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/popper.js/umd/popper.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/vendor/jquery.cookie/jquery.cookie.js"></script>
        <script src="assets/vendor/chart.js/Chart.min.js"></script>
        <script src="assets/vendor/jquery-validation/jquery.validate.min.js"></script>
        <script src="assets/vendor/additional/additional.js"></script>
        <script src="assets/js/feather-icons/feather.min.js"></script>

        <script src="assets/js/staff_pages/login.js"></script>
        <script src="assets/js/app.js"></script>

        <script src="assets/js/main.js"></script>
        
            
      <%if (session.getAttribute("login") != null) { %>
                                <script type="text/javascript"> 
                    
                    var n = noty({text: '<%=session.getAttribute("login")%>',
                        layout: 'center',
                        type: 'Success'
 
                        });
                    
                </script> <%
                session.removeAttribute("login");
                            }

                        %>
                        
    </body>

</html>