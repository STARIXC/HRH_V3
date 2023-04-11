<%-- 
    Document   : dataconfig
    Created on : Dec 7, 2021, 5:57:06 PM
    Author     : CBWAHYI
--%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Database Configuration</title>
        <link rel="stylesheet" href="./assets/css/bootstrap.css">
        <script defer src="./assets/fontawesome/js/all.min.js"></script>
        <link rel="stylesheet" href="./assets/css/app.css">
    </head>

    <body>
        <div id="auth">

            <div class="container">
                <div class="row">
                    <div class="col-md-5 col-sm-12 mx-auto">
                        <div class="card pt-4">
                            <div class="card-body">
                                <div class="text-center mb-5">
                                    <h3>Human Resource Management System -(HRMS)</h3>

                                    <p>Database connection and configuration</p>
                                </div>
                                <form  autocomplete="off">
                                    <div class="form-group">
                                        <label> Host Name:</label>
                                        <input type="text" name="hostname" id="hostname"  placeholder="e.g localhost:3306" value="localhost:3306" autofocus class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Database Name:</label>
                                        <input type="text" name="database" id="database"  placeholder="Database Name" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>User:</label>
                                        <input type="text" name="dbuser" id="dbuser" placeholder="Username" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Password:</label>
                                        <input type="password" name="dbpassword" id="dbpassword" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-sm-12 col-sm-offset-3">

                                                <input class="btn btn-primary" id="savedb" type="submit" value="Submit">
                                                <input class="btn btn-primary" type="reset" value="Reset">

                                            </div>
                                        </div>
                                    </div>
                                </form>

                                <div class='form-check clearfix pt-2' >
                                    <div class="copyrights text-center container">
                                        <%
                                            Calendar cal = Calendar.getInstance();
                                            int year = cal.get(Calendar.YEAR);

                                        %>

                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="text-center">
                                                    <img src="./assets/images/aphia_logo.png" class="img-fluid" alt="...">

                                                    <a href="" class="external"> &copy USAID TUJENGE JAMII <%=year%></a>

                                                </div>

                                            </div>
                                        </div>


                                    </div>

                                </div>	
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- JavaScript files-->
        <script src="./assets/vendor/jquery/jquery.min.js"></script>
        <script src="./assets/vendor/popper.js/umd/popper.min.js"></script>
        <script src="./assets/vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="./assets/vendor/jquery.cookie/jquery.cookie.js"></script>
        <script src="./assets/vendor/chart.js/Chart.min.js"></script>
        <script src="./assets/vendor/jquery-validation/jquery.validate.min.js"></script>
        <script src="./assets/vendor/additional/additional.js"></script>
        <script src="./assets/js/feather-icons/feather.min.js"></script>
        <script src="./assets/js/app.js"></script>
        <script src="./assets/js/pages/dbconfig.js"></script>
        <script src="./assets/js/main.js"></script>
    </body>

</html>

