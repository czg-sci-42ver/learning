import scrapy


class AliSpider(scrapy.Spider):
    name = 'ali'
    allowed_domains = ['https://pt.aliexpress.com/category/201005406/special-store.html']
    start_urls = ['http://https://pt.aliexpress.com/category/201005406/special-store.html/']

    def parse(self, response):
        pass
