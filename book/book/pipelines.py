from scrapy.pipelines.files import FilesPipeline
from urllib.parse import urlparse
from os.path import basename,dirname,join

#改变下载的文件名
class DownFilesPipeline(FilesPipeline):
    #Scrapy源代码用这个方法来命名，return(目录名，文件名),我们改变返回值的目录名和文件名即可
    def file_path(self,request,response=None,info=None):
        path =  urlparse(request.url).path
        print('downloadthis ',path,' ',basename(path),' ',join(basename(dirname(path)),basename(path)))
        return join(basename(dirname(path)),basename(path))