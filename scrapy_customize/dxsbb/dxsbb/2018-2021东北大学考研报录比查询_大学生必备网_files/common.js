
document.writeln("<script src=\'/template/dxsbb/js/jquery.min.js\'></script>");

var hosturl = window.location.href;

if (hosturl.indexOf("www.dxsbb.com") != -1 ) {

document.writeln("<script src=\'/template/dxsbb/js/m.js\'></script>");
	

//链接推送

(function(){
    var bp = document.createElement('script');
    bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(bp, s);
})();

//百度统计

var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?0fde2fa52b98e38f3c994a6100b45558";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();


}


//站内搜索

function znss(searchword) {
    var searchword = encodeURIComponent(searchword); 
    if  (searchword != "") {
        window.open("http://so.dxsbb.com/cse/search?q=" + searchword + "&s=17035947201502151521", "_blank");
    }
};