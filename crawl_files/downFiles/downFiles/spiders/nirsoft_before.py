# -*- coding: utf-8 -*-
import scrapy
from scrapy.linkextractors import LinkExtractor
from scrapy.spiders import CrawlSpider, Rule
from downFiles.items import DownfilesItem

class NirsoftSpider(CrawlSpider):
    name = 'nirsoft_2'
    allowed_domains = ['www.nirsoft.net']
    # https://www.stt.msu.edu/users/pszhong/Generalized-Inverse-and-Projectors-C.R.Rao_Book_Appendix.pdf
    start_urls = ['https://www.nirsoft.net/']

    rules = (
        Rule(LinkExtractor(allow=r'cgi-bin/'), callback='parse_item', follow=True),
    )

    # def parse_item(self, response):
    #     file_url = response.css('.downloadline::attr(href)').get()
    #     file_url = response.urljoin(file_url)
    #     item = DownfilesItem()
    #     item['file_urls'] = [file_url]
    #     yield {'file_url': file_url}


    def parse_item(self, response):
        file_url = response.css('.downloadline::attr(href)').get()
        file_url = response.urljoin(file_url)
        file_extension = file_url.split('.')[-1]
        # if file_extension not in ('pdf'):
        if file_extension not in ('zip', 'exe', 'msi'):
            return
        item = DownfilesItem()
        item['file_urls'] = [file_url]
        item['original_file_name'] = file_url.split('/')[-1]
        yield item

    # def parse_item(self, response):
    #     item = {}
    #     #item['domain_id'] = response.xpath('//input[@id="sid"]/@value').get()
    #     #item['name'] = response.xpath('//div[@id="name"]').get()
    #     #item['description'] = response.xpath('//div[@id="description"]').get()
    #     return item
