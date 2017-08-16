$(function() {
//  購物車
    $.post("/ireading/browse/cart/count",{},function(data){

$('#cart span').text(data[0].count);
if(data[0].count=="0"){$('#cart').addClass("hidden");}

});

   
   $("#ProducTable").on("click",".addcart",function(event){
	   var url=$(this).attr("value");
	   
	   $.post(url,{},function(data){
		   console.log(data[0].count);
		   $('#cart span').text(data[0].count);
		   if(data[0].count!="0"){$('#cart').removeClass("hidden");}
		   if(data[0].change=="1"){alert("成功新增至購物車");}
		   else{alert("商品已在購物車");}});
	   
	   
   }); 
   
   $("#cart").click(function(event){
	  if($.cookie('login_id')==undefined){
		  $('#LoginBlock').modal();
	  }
	  else{
		  window.location.href = "/ireading/browse/cart/show";
	  }
	   
   });
     
})