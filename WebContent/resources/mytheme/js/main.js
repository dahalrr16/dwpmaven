function load(){
alert("there is something from main.js with return nothing ");
return ;
}

function load2(){
	$(document).ready(function(){
		alert("Lets use alert with a function  "+cal(3,4));
		//$("p").hide();
		$("p").toggle();
	});
}// loadA closer

function cal(num1, num2){
	return num1+num2;
}


/*function load2(){*/
	$(document).ready(function(){
		$("p").hide();
		$("#button2").click(function(){
			$("p").toggle();
		});
		//$("p").hide();
		
	});
//}// loadA closer


	
	 function deleteThisRow() {  
		 
		   $(document).ready(function() { 
		   
	 
	   $.ajax({ 
		   type: "POST",
		   dataType: "json",
		   url: "getAjax",
		   data: data,
		   success: function(myData, myStatus, myXhr){  
		
		   },//success function closer
		   
		   error: function(xhr, myStatus, error) {
		       alert(status+"   from the error again");
		       
		   }
		});//ajax call closer
		   }); //$(document)ready close
	   }//deleteThisRow method closer
	   
	   	   
	 function makeTableHeader(){
		    $('<tr>').append($('<th>age</th>')).append($('<th>id</th>')).append($('<th>name</th>'))
		    .appendTo('#dataTable');
		      }
	   function makeTable(){
		   $('<table id="dataTable" class="editableTable"> <thead><tr> <th>age</th> <th>id</th>  <th>name</th>   </tr> </thead> <tbody></tbody> </table>').appendTo( '#myDiv' );
	   }
	   
	   
	   function makeButton1(){
		   $('<button/>',
			    {
			        text: 'Edit',
			        click: function () { alert('hi'); }
			    });
		  
	   }
	   
	   
	   function makeButton2(){
	    window.test2 = $('<button/>',
			    {
			        text: 'Delete',
			        click: function () { alert('hi'); }
			    });
	    }
	   
	   
	   
	  
	   /*function doGetAll() {  
			 
		   $(document).ready(function() { 	   
			 
	   $.ajax("get/all",{ 
		   type: "GET",
		   dataType: "json",
		//   url: "getAjax",
		   success: function(myData, myStatus, myXhr){  
			   var x=JSON.stringify(myData);
			  console.log("type of myData  "+$.type(myData));
			  console.log("type of x  "+$.type(x));
			//   var jsonObj = $.parseJSON('[' + x + ']');
		//	   var item={"items":x};
		//	   console.log(item);
		//makeTableHeader();
		 if(($("#dataTable").length)<1){ 
			makeTable();
			makeEditable();
		} 
		
		
		$('#myTable tbody > tr').remove();
	//$("#dataTable").html("");
		$.each(myData, function(index, obj) {
			//console.log($.type(obj));
		
			
			
			
		//	  $('<tr>')
		$('<tr>')
	          .append( $(ageButton).html(
	         //     data[key][0]
	         obj.age
	          ) )
	        //  .append( $('<td>').addClass('whatever1').html(
	        		 .append( $(idButton).html(
	             // data[key][1]
	             obj.id
	          ) )
	       //   .append( $('<td>').addClass('whatever2').html(
	    		   .append( $(nameButton).html(
	            //  data[key][2]
	            obj.name
	          ) ).append( $(myButton1).dblclick(function(){
	            //  $(this).attr("contentEditable","true");
	        //      $('buttonText').prop('value', 'Save');//works but select all input fields
	             // $("input").attr('value', 'Save');//works but changes all buttons refered by button1 var
	            $(this).children().attr('value', 'Save'); //  $(this).children().prop('value', 'Save'); also works
	        //    $(this).closest('tr').attr("contentEditable","true");//this works
	            $(".data").attr("contentEditable","true");
	        	  
	        	  
	        	 
	        	 
	        	  
	        	  
	        	  
	        	  
	        	  
	        	  
	        	  
	        	  
	          }))
	          .append( $(myButton2).dblclick(function(){
	        	  if (confirm("Are you sure?")) {
	        	        // your deletion code
	        		  $(this).closest('tr').remove();
	        	        deleteThisRow();
	        	    }
	        	    return false;
	        	 
	        	  
	        	  
	        	  
	        	  
	        	  
	          }))
	          .appendTo('#myTable');

			
			  
			  console.log("age from obj "+obj.age);
			  console.log("id from obj  "+obj.id);
			  console.log("name from obj   "+obj.name);
			 
			//  document.write("<br>"); 
	  $.each(obj, function(k, v) {
	 //  console.log(k+"  ::  "+v);
	  });
	});
		 $.each(x, function( index, value ) {
	  alert( index + ": " + value );
	}); 
		
		//	   console.log(x);
			     $.each(item.x, function(index,item) {        
				    alert(item.id+" "+item.age+""+item.name);
				});
			   
			   
			    alert("length of json  "+jsonObj.length);
			   alert("json in array format"+jsonObj); 
			   $("#td1").html(myData.id);
			  $("#td2").html(myData.age);
			  $("#td3").html(myData.name); 
			  
		
		   },//success function closer
		   
		   error: function(xhr, myStatus, error) {
		       alert(status+"   from the error again");
		       
		   }
		});//ajax call closer
		   }); //$(document)ready close
	   }//doGetAll method closer
*/	

	 
	 
	 
	 
/*
A function can be written in the main.js and can be used without using
the wrapper method/function in the target jsp.*/
