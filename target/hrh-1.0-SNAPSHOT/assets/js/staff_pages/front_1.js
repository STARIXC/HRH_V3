/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

            function patasubcounty()            {
            	 var county = document.getElementById("ddlCounty").value;
              //var county = $('#county').val();
                $.ajax({
                    url: './GetsubcountyServlet?county='+county,
                    type: 'post',
                    dataType: 'html',
                    success: function (data)
                    {
                        $("#ddlSubcounty").html(data.replace("<option value=''>Select sub-county</option>", ""));
                        var select = document.getElementById('ddlSubcounty');
                        //select.size = select.length;
 //$('#ddlSubcounty').select2();
                        //  App.init();   
                    }
                });

            }

            function patafacility() {

                var subcounty = document.getElementById("ddlSubcounty").value;
                $.ajax({
                    url: './FacilityServlet?subcounty=' + subcounty,
                    type: 'post',
                    dataType: 'html',
                    success: function (data)
                    {
                    	  $("#ddlFacility").html(data.replace("<option value=''>Select facility</option>", ""));
                          var select = document.getElementById('ddlFacility');
                          // select.size = select.length;
                          //$('#ddlFacility').select2();
                    }
                });
            }
            
        
       
            function getPosition() {

                var cadreType = document.getElementById("ddlCadreCategory").value;
                $.ajax({
                    url: './PositionServlet?cadreType=' + cadreType,
                    type: 'post',
                    dataType: 'html',
                    success: function (data)
                    {
                    	  $("#ddlDesignation").html(data.replace("<option value=''>--Select--</option>", ""));
                          var select = document.getElementById('ddlDesignation');
                          // select.size = select.length;
                          $('#ddlDesignation').select2();
                    }
                });
            }