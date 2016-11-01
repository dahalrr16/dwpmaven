<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="<c:url value="/resources/mytheme/css/myCSS.css"/>" rel="stylesheet">

<title>Insert title here</title>

<style type="text/css">

/* table,td,th
{
border:1px solid black;
}

table
{
width:30%;
}

th
{
height:25px;
background: #fc9;
}


tbody { background: #9cf; } */


.header {  
border-bottom: medium;
background: white;
font-style: oblique;
text-decoration:underline;
text-shadow: blue;
text-indent: 10px;
}
 
 .General{
margin: 1em; border-collapse: collapse; }
td, th { padding: .3em; border: 1px #ccc solid; }
thead { background: #fc9; }
tbody { background: #9cf; }
#clickme tr.clicked { background: #ff0; 
 
}


.editableTable td { border:solid 1px; } 
.editableTable .cellEditing { padding: 0; }
 .editableTable .cellEditing input[type=text]{ width:100%; border:0; background-color:rgb(255,253,210); }


.highlighted {
    background: purple;
}

.comeBack {
    background: #9cf;
}


</style>

</head>
<body>


 <script type="text/javascript" language="javascript">  
 function makeEditable() { $("td").dblclick(function ()
		 { var OriginalContent = $(this).text(); $(this).addClass("cellEditing"); 
		 $(this).html("<input type='text' value='" + OriginalContent + "' />"); 
		 $(this).children().first().focus();
		 $(this).children().first().keypress(function (e) { if (e.which == 13) { var newContent = $(this).val();
		 $(this).parent().text(newContent); $(this).parent().removeClass("cellEditing"); } }); 
		 $(this).children().first().blur(function(){ $(this).parent().text(OriginalContent); 
		 $(this).parent().removeClass("cellEditing"); }); }); }

 //*********************************************************************************************************************** 
 
 
   function doAjaxPost() {  
	 
	   $(document).ready(function() { 
	   
 
   $.ajax("getAjax",{ 
	   type: "GET",
	   dataType: "json",
	//   url: "getAjax",
	   success: function(myData, myStatus, myXhr){  
		   var x=JSON.stringify(myData);
		  $("#td1").html(myData.id);
		  $("#td2").html(myData.age);
		  $("#td3").html(myData.name);
		  
	 //    alert(myData+"   from the myData, map inside, using #(document).ready();");
	   /*   alert(JSON.stringify(myData)); */
	   
	     
	    /*  alert("from myStatus without stringify  "+(myStatus)+"myXhr=  "
	    		 +JSON.stringify(myXhr)); */
	   },//success function closer
	   
	   error: function(xhr, myStatus, error) {
	       alert(status+"   from the error again");
	       
	   }
	});//ajax call closer
	   }); //$(document)ready close
   }//doAjaxPost method closer
   
   //*********************************************************************************************************************** 
   
   function doAjaxPost2() {  
		 
	   $(document).ready(function() { 
	   
 
		   $.ajax({
			   type:"get",
			    url: "getAjax",
			    dataType: "json"
			}).success(function(data){
				var x=JSON.stringify(data);
			    $('#h100').append(x+"   Good");
			});
	
	   }); //$(document)ready close
   }//doAjaxPost method closer
   
   //*********************************************************************************************************************** 
   
   
  
   function doGetAll() {  		 
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
	/* if(($("#dataTable").length)<1){ 
		makeTable();
		makeEditable();
	} */	
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
          ) ).append( $(editButton).dblclick(function(){
        	 
        	  if( $(this).children().val()=="Edit"){
        		  $(this).closest('tr').find('td:first').attr("contentEditable","true");
        		  $(this).closest('tr').find('td:nth-child(2)').attr("contentEditable","true");
        		  $(this).closest('tr').find('td:nth-child(3)').attr("contentEditable","true");
        		  $(this).closest('tr').addClass("highlighted");
        		//  alert("value of text from button is Edit");
        		  $(this).children().attr('value', 'Save');
        	  }
        	  
        	  else {
        		  $(this).closest('tr').find('td:first').attr("contentEditable","false");
        		  $(this).closest('tr').find('td:nth-child(2)').attr("contentEditable","false");
        		  $(this).closest('tr').find('td:nth-child(3)').attr("contentEditable","false");
        		  $(this).closest('tr').addClass("comeBack");
        		//  alert("value of text from button is Save");
        		  $(this).children().attr('value', 'Edit');
        	  }
        	
          
        //      $('buttonText').prop('value', 'Save');//works but selects all input fields
             // $("input").attr('value', 'Save');//works but changes all buttons refered by button1 var
            //  $(this).children().prop('value', 'Save'); also works
        
      //      $(".main").attr("contentEditable","true");// it works but applies to all the <td> class not a particular row
          
       //     $(this).closest('tr ').attr("contentEditable","true");  //this works but applies to edit and delete button too
      
            
   //         $('#myTable > tbody  > tr').attr("contentEditable","true"); // works but makes for all the rows
                    //  str = $(this).closest('tr').text(); gets the whole text appended without format
                    var jsonObj=[];
                     var obj={};
                     k1="name";
                    k2="id";
                    k3="age";
            	    v3 = parseInt($(this).closest('tr').find('td:first').text());
            	    v2 = parseInt($(this).closest('tr').find('td:nth-child(2)').text());
            	    v1 = $(this).closest('tr').find('td:nth-child(3)').text();
            	    obj[k1]=v1;
            	    obj[k2]=v2;
            	    obj[k3]=v3;
            	    
            	    
            	    jsonObj.push(obj);         
            	var s={"name":v1, "id":v2,"age":v3};           
            	var newData1=JSON.stringify(jsonObj);            	
            	var newData2=JSON.stringify(s);
            
            
        	  
    
            	  $.ajax({
       			   type:"POST",
       			    url: "updateFromTable",
       			    dataType: "json",
       			    data:JSON.stringify(s),//data to be sent
       			 
       		//	data:jsonObj,
       			  beforeSend: function(xhr) {
       	            xhr.setRequestHeader("Accept", "application/json");
       	            xhr.setRequestHeader("Content-Type", "application/json");
       	        },
       	        
       	     success: function(data2, status) {
       	    //	 alert("status from data2 "+status);
     		    if(status == 'success') alert('Student  has been updated');
     		    else alert('Failed adding Student: ' + data2.status + ', ' + data2.errorMessage);
     		  }
     		}//ajax brace closer
            	  );//ajax small bracket closer
       	        
       	       
    
            	
        	  
          }//  function closer
          
          
          )//dblClick method closer
          )
          .append( $(deleteButton).dblclick(function(){
        	  if (confirm("Are you sure?")) {
        	       
                        var jsonObj=[];
                         var obj={};
                         k1="name";
                        k2="id";
                        k3="age";
                	    v3 = parseInt($(this).closest('tr').find('td:first').text());
                	    v2 = parseInt($(this).closest('tr').find('td:nth-child(2)').text());
                	    v1 = $(this).closest('tr').find('td:nth-child(3)').text();
                	    obj[k1]=v1;
                	    obj[k2]=v2;
                	    obj[k3]=v3;
                	    
                	    
                	    jsonObj.push(obj);
              //  	    alert("jsonObj pushing the obj   "+jsonObj);
                	var s={"name":v1, "id":v2,"age":v3};
                //	alert("var s being printed withou stringified    "+s);
                	var newData1=JSON.stringify(jsonObj);//alert("stringified jsonObj   "+newData1);
                	var newData2=JSON.stringify(s);//alert("stringified s   "+newData2);
                
            	  
        
                	  $.ajax({
           			   type:"POST",
           			    url: "deleteFromTable",
           			    dataType: "json",
           			    data:JSON.stringify(s),
           			 
           		//	data:jsonObj,
           			  beforeSend: function(xhr) {
           	            xhr.setRequestHeader("Accept", "application/json");
           	            xhr.setRequestHeader("Content-Type", "application/json");
           	        },
           	        
           	     success: function(data2, status) {
           	    	 alert("status from data2 "+status);
         		    if(status == 'success') alert('Student  has been updated');
         		    else alert('Failed adding Student: ' + data2.status + ', ' + data2.errorMessage);
         		  }
         		}//ajax brace closer
                	  );//ajax small bracket closer 	        
        		  
        		  
        		  $(this).closest('tr').remove();
        
        	    }
        	    return false;
        	 
        	  
        	  
        	  
          }))
        
          
          .appendTo('#myTable');

		
		
 /*  $.each(obj, function(k, v) {
 //  console.log(k+"  ::  "+v);
  }); */ 
  //this upper portion is optional
});
	
		  
	
	   },//success function closer
	   
	   error: function(xhr, myStatus, error) {
	       alert(status+"   from the error again");
	       
	   }
	});//ajax call closer
	   }); //$(document)ready close
   }//doGetAll method closer
   
  //*********************************************************************************************************************** 
   
   
   
   function addStudent(){	  
	  
	   $('<tr>')     //  $('<tr>', {id:"newRow"})   //this was found for dynamic id creation 
	  // $('<tr>')
    //   .append( $(ageButton).html() )
    .append( $(ageButton))
         
       .append( $(idButton))
    
 	    .append( $(nameButton))
         
       .append( $(saveButton).dblclick(function(){
      	 
     	  if( $(this).children().val()=="Edit"){
     	  $(this).closest('tr').find('td:first').attr("contentEditable","true");
     		  $(this).closest('tr').find('td:nth-child(2)').attr("contentEditable","true");
     		  $(this).closest('tr').find('td:nth-child(3)').attr("contentEditable","true");
     		  $(this).closest('tr').addClass("highlighted");
     		//  alert("value of text from button is Edit");
     		  $(this).children().attr('value', 'Save');
     	  }
     	  
     	  else {
     		  $(this).closest('tr').find('td:first').attr("contentEditable","false");
     		  $(this).closest('tr').find('td:nth-child(2)').attr("contentEditable","false");
     		  $(this).closest('tr').find('td:nth-child(3)').attr("contentEditable","false");
     		  $(this).closest('tr').addClass("comeBack");
     		//  alert("value of text from button is Save");
     		  $(this).children().attr('value', 'Edit');
     	  }
     
                 var jsonObj=[];
                  var obj={};
                  k1="name";
                 k2="id";
                 k3="age";
                 v3 = parseInt($.trim(($(this).closest('tr').find('td:first').children().val())));
         	    v2 = parseInt($(this).closest('tr').find('td:nth-child(2)').children().val());
         	    v1 = $(this).closest('tr').find('td:nth-child(3)').children().val();
         	    obj[k1]=v1;
         	    obj[k2]=v2;
         	    obj[k3]=v3;
         	    
         	    
         	    jsonObj.push(obj);
       //  	    alert("jsonObj pushing the obj   "+jsonObj);
         	var s1={"name":v1, "id":v2,"age":v3};
         //	alert("value of s1  "+s1);
         //	alert("var s being printed withou stringified    "+s);
         	var newData1=JSON.stringify(jsonObj);
         	//alert("stringified jsonObj   "+newData1);
         	var newData2=JSON.stringify(s1);
       //  	alert("stringified s   "+newData2);
         
     	  
 
         	  $.ajax({
    			   type:"POST",
    			    url: "updateFromTable",
    			    dataType: "json",
    			    data:JSON.stringify(s1),
    			 
    		//	data:jsonObj,
    			  beforeSend: function(xhr) {
    	            xhr.setRequestHeader("Accept", "application/json");
    	            xhr.setRequestHeader("Content-Type", "application/json");
    	        },
    	        
    	     success: function(data2, status) {
    	    	 alert("status from data2 "+status);
  		    if(status == 'success') alert('Student  has been updated');
  		    else alert('Failed adding Student: ' + data2.status + ', ' + data2.errorMessage);
  		  }
  		}//ajax brace closer
         	  );//ajax small bracket closer
    	        
    	       
 
         	
     	  
       }//  function closer       
       
       )//dblClick method closer
    		   
       )//append closer
         
       .append( $(deleteButton))
       .appendTo('#myTable');
         
   }//addStudent function closer
   
   //***********************************************************************************************************************   
   
   
   
   
   function sortBy() {  		 
	   $(document).ready(function() { 	   
		 
   $.ajax("get/all/sort",{ 
	   type: "GET",
	   dataType: "json",
	//   url: "getAjax",
	   success: function(myData, myStatus, myXhr){  
		   var x=JSON.stringify(myData);
		  console.log("type of myData  "+$.type(myData));
		  console.log("type of x  "+$.type(x));
	
	$('#myTable tbody > tr').remove();
//$("#dataTable").html("");
	$.each(myData, function(index, obj) {
		
	
	$('<tr>')
          .append( $(ageButton).html(
        
         obj.age
          ) )
       
        		 .append( $(idButton).html(
           
             obj.id
          ) )
      
    		   .append( $(nameButton).html(
         
            obj.name
          ) ).append( $(editButton).dblclick(function(){
        	 
        	  if( $(this).children().val()=="Edit"){
        		  $(this).closest('tr').find('td:first').attr("contentEditable","true");
        		  $(this).closest('tr').find('td:nth-child(2)').attr("contentEditable","true");
        		  $(this).closest('tr').find('td:nth-child(3)').attr("contentEditable","true");
        		  $(this).closest('tr').addClass("highlighted");
        		//  alert("value of text from button is Edit");
        		  $(this).children().attr('value', 'Save');
        	  }
        	  
        	  else {
        		  $(this).closest('tr').find('td:first').attr("contentEditable","false");
        		  $(this).closest('tr').find('td:nth-child(2)').attr("contentEditable","false");
        		  $(this).closest('tr').find('td:nth-child(3)').attr("contentEditable","false");
        		  $(this).closest('tr').addClass("comeBack");
        		//  alert("value of text from button is Save");
        		  $(this).children().attr('value', 'Edit');
        	  }
        	
         
                    var jsonObj=[];
                     var obj={};
                     k1="name";
                    k2="id";
                    k3="age";
            	    v3 = parseInt($(this).closest('tr').find('td:first').text());
            	    v2 = parseInt($(this).closest('tr').find('td:nth-child(2)').text());
            	    v1 = $(this).closest('tr').find('td:nth-child(3)').text();
            	    obj[k1]=v1;
            	    obj[k2]=v2;
            	    obj[k3]=v3;
            	    
            	    
            	    jsonObj.push(obj);
          //  	    alert("jsonObj pushing the obj   "+jsonObj);
            	var s={"name":v1, "id":v2,"age":v3};
            //	alert("var s being printed withou stringified    "+s);
            	var newData1=JSON.stringify(jsonObj);//alert("stringified jsonObj   "+newData1);
            	var newData2=JSON.stringify(s);//alert("stringified s   "+newData2);
            
        	  
    
            	  $.ajax({
       			   type:"POST",
       			    url: "updateFromTable",
       			    dataType: "json",
       			    data:JSON.stringify(s),
       			 
       		//	data:jsonObj,
       			  beforeSend: function(xhr) {
       	            xhr.setRequestHeader("Accept", "application/json");
       	            xhr.setRequestHeader("Content-Type", "application/json");
       	        },
       	        
       	     success: function(data2, status) {
       	    	 alert("status from data2 "+status);
     		    if(status == 'success') alert('Student  has been updated');
     		    else alert('Failed adding Student: ' + data2.status + ', ' + data2.errorMessage);
     		  }
     		}//ajax brace closer
            	  );//ajax small bracket closer
       	       
          }//  function closer
          
          
          )//dblClick method closer
          )
          .append( $(deleteButton).dblclick(function(){
        	  if (confirm("Are you sure?")) {
        	       
                        var jsonObj=[];
                         var obj={};
                         k1="name";
                        k2="id";
                        k3="age";
                	    v3 = parseInt($(this).closest('tr').find('td:first').text());
                	    v2 = parseInt($(this).closest('tr').find('td:nth-child(2)').text());
                	    v1 = $(this).closest('tr').find('td:nth-child(3)').text();
                	    obj[k1]=v1;
                	    obj[k2]=v2;
                	    obj[k3]=v3;               	    
                	    
                	    jsonObj.push(obj);
             
                	var s={"name":v1, "id":v2,"age":v3};
               
                	var newData1=JSON.stringify(jsonObj);//alert("stringified jsonObj   "+newData1);
                	var newData2=JSON.stringify(s);//alert("stringified s   "+newData2);
                
                	  $.ajax({
           			   type:"POST",
           			    url: "deleteFromTable",
           			    dataType: "json",
           			    data:JSON.stringify(s),
           			 
           		//	data:jsonObj,
           			  beforeSend: function(xhr) {
           	            xhr.setRequestHeader("Accept", "application/json");
           	            xhr.setRequestHeader("Content-Type", "application/json");
           	        },
           	        
           	     success: function(data2, status) {
           	    	 alert("status from data2 "+status);
         		    if(status == 'success') alert('Student  has been updated');
         		    else alert('Failed adding Student: ' + data2.status + ', ' + data2.errorMessage);
         		  }
         		}//ajax brace closer
                	  );//ajax small bracket closer 	        
        		  
        		  
        		  $(this).closest('tr').remove();
        
        	    }
        	    return false;  	 
        	  
          }))
        
          .appendTo('#myTable');

});
	
	   },//success function closer
	   
	   error: function(xhr, myStatus, error) {
	       alert(status+"   from the error again");
	       
	   }
	});//ajax call closer
	   }); //$(document)ready close
   }//sortBy method closer
   
   //*********************************************************************************************************************** 
   
  
   
   // remove var to make it global
   ageButton='<td class="main"><input type="text"  name="ageText" class="data" /></td>';
  idButton='<td class="main"><input type="text"  name="idText" class="data" /></td>';
   nameButton='<td class="main"><input type="text"  name="nameText" class="data"/></td>';
   editButton='<td><input type="button" id ="buttonText1" name="buttonText" value="Edit"/></td>';
   saveButton='<td><input type="button" id ="buttonText1" name="buttonText" value="Save"/></td>';
   deleteButton='<td><input type="button" id ="buttonText2" name="buttonText" value="Delete"/></td>';

   //*********************************************************************************************************************** 
   
  
   $(document).ready(function() { 
	   $('check1').removeAttr('checked');   
   
   });//document.ready closer

	   function isUncheck(){
		   		
		   
	     var checkboxes=document.getElementsByName("check1");
	     x=1
	     for (i=0; i<checkboxes.length; i++){	    	 
	    	 if(checkboxes[i].checked){
	    		 x=x+i;
	    	 }
	     }
	     alert("value of x  "+x+"   value of checkboxes.length   "+checkboxes.length)
	     if(x==checkboxes.length){
	    	 for (i=0; i<checkboxes.length; i++){
	    		 checkboxes[i].enabled='true'
	    	 }
	     }
	     
	      for (i=0; i<checkboxes.length; i++){
	       if (!checkboxes[i].checked)   checkboxes[i].disabled='true';
	      }
		
	   }//isUncheck function closer 
	   //*********************************************************************************************************************** 
   
   
  </script> 
  
  <p>Whats wrong with you people, with error message too ok </p>

<h1 id="h1" class="header">Student Table </h1>
<table id="myTable" class="General">
<thead>
<tr>
<th>Age </th>
<th>Id </th>
<th>Name</th>
<th>Edit</th>
<th>Delete</th>
</tr>

</thead>


<tbody>
<tr>
</tr>
</tbody>

</table>








<!-- <table id="newTable" class="General">
<thead>
<tr>
<th>Age </th>
<th>Id </th>
<th>Name</th>
<th>Edit</th>
<th>Delete</th>
</tr>

</thead>


<tbody>
<tr id="myRow">
<td id="first" ><input type="text"  name="ageText" class="data" /></td>
<td id="second"><input type="text"  name="ageText" class="data" /></td>
<td id="third"><input type="text"  name="ageText" class="data" /></td>
<td id="fourth"><input type="button"  name="save" class="data" /></td>
<td id="fifth" ><input type="button"  name="delete" class="data" /></td>
</tr>
</tbody>

</table>
 -->

<div id="myDiv" >
Toggle: <input type="button" id="button2">
</div>
<div id="submission">
<input type="button" value="clickToToggle" onclick="return(doAjaxPost2())"/>
<input type="button" value="addStudent" onclick="return(addStudent())"/>
<input type="button" value="getAll" onclick="return(doGetAll())"/>
<input type="button" value="sortBy" onclick="return(sortBy())"/>
id:
<input type="checkbox" name="check1" id="id" value="id" onclick="return(isUncheck())"/>
age:
<input type="checkbox" name="check1" id="age" value="age" onclick="return(isUncheck())"/>
name:
<input type="checkbox" name="check1" id="name" value="name" onclick="return(isUncheck())"/>
</div>




<script src="<c:url value="/resources/mytheme/js/jquery-1.11.1.js" />"></script>
<script src="<c:url value="/resources/mytheme/js/main.js" />"></script>
<script src="<c:url value="/resources/mytheme/js/jquery.json-2.2.js" />"></script>


</body>
</html>