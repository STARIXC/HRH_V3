
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
