import scrapy
 
class DownFilesItem(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    #pass
    #file_urls用来存放要下载的文件url地址
    file_urls = scrapy.Field()
    files = scrapy.Field()