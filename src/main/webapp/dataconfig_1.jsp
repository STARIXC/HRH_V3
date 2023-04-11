<%-- 
    Document   : dataconfig
    Created on : Dec 7, 2021, 5:57:06 PM
    Author     : CBWAHYI
--%>


<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>HRH DATABASE CONFIGURATION</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="robots" content="all,follow">
        <!-- Bootstrap CSS-->
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome CSS-->
        <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
        <!-- Fontastic Custom icon font-->
        <link rel="stylesheet" href="css/fontastic.css">
        <!-- Google fonts - Poppins -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
        <!-- theme stylesheet-->
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="css/custom.css">
        <!-- Favicon-->
        <link rel="shortcut icon" href="img/favicon.ico">
        <!-- Tweaks for older IEs--><!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    </head>
    <body>
        <div class="page login-page">
            <div class="container d-flex align-items-center">
                <div class="form-holder has-shadow">
                    <div class="row">
                        <!-- Logo & Information Panel-->
                        <div class="col-lg-6">
                            <div class="info d-flex align-items-center">
                                <div class="content">
                                    <div class="logo">
                                        <h1>HRIS</h1>
                                    </div>
                                    <p>Database connection and configuration</p>
                                </div>
                            </div>
                        </div>
                        <!-- Form Panel    -->
                        <div class="col-lg-6 bg-white">
                            <div id="dialog-form" title="Enter Database Connection Credentials...." hidden="true" >
                                <!--<div contenteditable=true>-->
                                <p class="validateTips1" style="text-align: center;"></p>
                                <p class="validateTips2" style="text-align: center;"></p>
                                <p class="validateTips3" style="text-align: center;"></p>
                                <p class="validateTips" style="text-align: center;"></p>
                            </div>
                            <div class="form d-flex align-items-center">
                                <div class="content">
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
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="reset" value="Reset" class="btn btn-info">
                                                    <input type="submit" id="savedb" name="savedb"  class="btn btn-primary">
                                                </div>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                               
                            </div>
                             <div id="success">
                                    <p style="color: red; ">Error While connecting to the database................</p>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copyrights text-center">
                <p> <a href="" class="external">USAID TUJENGE JAMII</a>
                </p>
            </div>
        </div>
        <!-- JavaScript files-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/popper.js/umd/popper.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="vendor/jquery.cookie/jquery.cookie.js"></script>
        <script src="vendor/chart.js/Chart.min.js"></script>
        <script src="vendor/jquery-validation/jquery.validate.min.js"></script>

        <script src="vendor/additional/additional.js"></script>
        <!-- Main File-->
        <script>

            $(document).ready(function () {
            $("#savedb").click(function(e){
            	e.preventDefault();
            	 var hostname, database, user, password;
                 hostname = $("#hostname").val();
                database = $("#database").val();
                 user = $("#dbuser").val();
                 password = $("#dbpassword").val();
                
                 var dataString = "hostname=" + hostname +
                 "&database=" + database +
                 "&user=" + user +
                 "&password=" + password;
                 
                 console.log('processed '+dataString);
                 $.ajax({
                	 type:"POST",
                	 url:"./DatabaseSaveServlet",
                	 data:dataString,
                	 processData:false,
                	 success: function(resp){
                		 
                	 },
                     error: function () {
                         alert('Sorry !This didn\'t work . Please Contact the Admin');
                     }
                 })
            })
                         
            

            });
        </script>

    </body>
</html>
