BOT_NAME = 'Down_Files'
 
SPIDER_MODULES = ['book.spiders']
NEWSPIDER_MODULE = 'book.spiders'
 
# Crawl responsibly by identifying yourself (and your website) on the user-agent
#USER_AGENT = 'Down_Files (+http://www.yourdomain.com)'
 
# Obey robots.txt rules
ROBOTSTXT_OBEY = True
 
ITEM_PIPELINES = {
    #'Down_Files.pipelines.DownFilesPipeline': 300,
    #自动下载文件，本来是FilesPipeline,为了改变下载文件的文件名，重写了FilesPipeline
    #'scrapy.pipelines.files.FilesPipeline':1,
    'book.pipelines.DownFilesPipeline':1,
}
#下载的文件存放路径
FILES_STORE='Down_Files'