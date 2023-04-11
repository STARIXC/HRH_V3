/**
 * 
 */
$(document).ready(function() {
	 getcardertype();
            getcardercat();
          function getcardertype() {
				 $.ajax({
                    url: './EmpTypeServlet',
                    type: 'get',
                    dataType: 'html',
                    success: function (data)
                    {
                    	console.log(data);
                    	  $("#ddlEmployeeType").append(data);
                      
                    }
                });
            }
           
     
            function getcardercat() {
				 $.ajax({
                   url: './CadreTypeServlet',
                   type: 'get',
                   dataType: 'html',
                   success: function (data)
                   {
                   	  $("#ddlCadreCategory").append(data)
                     
                   }
               });
           }


 });           