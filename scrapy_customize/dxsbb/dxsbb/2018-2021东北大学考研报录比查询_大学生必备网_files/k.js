document.writeln("<script src=\'/template/dxsbb/js/viewimages.js\'></script>");
document.writeln("<script src=\'/template/dxsbb/js/lazyimages.js\'></script>");


var hosturl = window.location.href;

if (hosturl.indexOf("www.dxsbb.com") != -1) {
	
//展开阅读全文

/*
     var content = document.getElementById('content');
     var total_height =  content.scrollHeight; //content总高度
     var show_height = 1600; //大于此高度折叠
     if(total_height>show_height){
         content.style.height = '1580px';
	     $('<div id="btnbox"><button id="btn"><span class="readall">点击阅读全文</span><img src="/template/dxsbb/images/readall.png"></button></div>').insertAfter('#content');
         var btn = document.getElementById('btn');
         var btnbox = document.getElementById('btnbox');
	     btn.onclick = function(){
	         btnbox.style.display = 'none';
             content.style.height = 'auto';
        }; 
     };
*/

}

//文字
setTimeout(function(){
//    $('<div style="width: 100%;overflow: hidden; padding: 20px 0px 0 0; "><a href="/news/47640.html" target="_blank" style="display: block; height: 36px; line-height: 36px; font-size: 18px;  color: #ff4f4f; float: left;font-weight: bold;">微信搜索：大学生考研网，输入学校，查简章、查分数、查专业、查真题...</a></div>').insertBefore('#content');
      $('<div style="float:left;width: 100%;overflow:hidden;margin:0;padding: 20px 0 0 0;background:#fff;"><a href="../search_kaoyan.html" style="color:#333333;">在微信公众号：<span style="color:#00aaff;font-weight: bold;">考研常识</span>，输入院校，可查各大学22招生简章、复试分数、专业目录、参考书目、一流学科、学科排名、报录比...</a></div>').insertAfter(".newsinfo");
	 $('<div style="float:left;width: 100%;overflow:hidden;margin:0;padding: 20px 0 0 0;background:#fff;"><a href="../search_kaoyan.html" style="color:#333333;">在微信公众号：<span style="color:#00aaff;font-weight: bold;">考研快车</span>，输入院校，可查各大学22招生简章、复试分数、专业目录、参考书目、一流学科、学科排名、报录比...</a></div>').insertAfter(".article");
	}, 3000);
	

//返回顶部

document.writeln("<div style=\'position: fixed; bottom: 50px; right: 50px; width: 56px; height: 56px; border-radius: 5px; background: url(/template/dxsbb/images/backtop.png) 2px 2px no-repeat; background-color: #fff; \'><a href=\'javascript:window.scrollTo(0, 0);\' style=\'float: left; display: inline; margin-bottom: 1px; width: 56px; height: 56px; color: #fff; \'></a></div>");