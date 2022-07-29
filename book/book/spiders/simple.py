# -*- coding: utf-8 -*-
import scrapy

from scrapy.linkextractors import LinkExtractor
from book.items import DownFilesItem
 
class DownFileSpider(scrapy.Spider):
    name = 'Down_File'
    allowed_domains = ['matplotlib.org']
    start_urls = ['http://matplotlib.org/examples/index.html']
 
    def parse(self,response):
        le = LinkExtractor(restrict_xpaths=('//*[@id="matplotlib-examples"]/div/ul/li/ul/li/a'),deny='/index.html$')
        for link in le.extract_links(response):
            yield scrapy.Request(link.url,callback=self.parse_files)
 
    def parse_files(self, response):
        href = response.xpath('//div[@class="body"]/div/p/a/@href').extract_first()
        url = response.urljoin(href)
        item = DownFilesItem()
        item['file_urls'] = [url]
        return item
