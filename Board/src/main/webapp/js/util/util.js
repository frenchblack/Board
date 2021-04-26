//util

//null체크
function isEmpty(str){        
    if(typeof str == "undefined" || str == null || str == "")
        return true;
    else
        return false ;
}  

//serializeObject
$.fn.serializeObject = function() {
   let o = {};
   let a = this.serializeArray();
   $.each(a, function() {
       if (o[this.name]) {
           if (!o[this.name].push) {
               o[this.name] = [o[this.name]];
           }
           o[this.name].push(this.value || '');
       } else {
           o[this.name] = this.value || '';
       }
   });
   return o;
};