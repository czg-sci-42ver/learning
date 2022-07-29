# -*- coding: utf-8 -*-
import scrapy
from scrapy.linkextractors import LinkExtractor
from scrapy.spiders import CrawlSpider, Rule
from downFiles.items import DownfilesItem
import hashlib
from os.path import splitext

class NirsoftSpider(CrawlSpider):
    name = 'nirsoft'
    allowed_domains = ['www.stt.msu.edu']
    # https://www.stt.msu.edu/users/pszhong/Generalized-Inverse-and-Projectors-C.R.Rao_Book_Appendix.pdf
    start_urls = ['https://www.stt.msu.edu/users/pszhong/']

    rules = (
        Rule(LinkExtractor(deny=[r".*\.tar\.gz",r".*\.zip"],allow=''), callback='parse_item',  follow=True),
        # important to use deny
        # Rule(LinkExtractor(allow=''), callback='parse_item',  follow=True),
    )

  

    # def file_path(self, request, response=None, info=None, *, item=None):
    #     # image_url_hash = hashlib.shake_256(request.url.encode()).hexdigest(5)
    #     image_perspective = request.url.split('/')[-1]
    #     image_filename = f'{image_perspective}'

    #     return image_filename


    # def parse_item(self, response):
    #     file_url = response.css('.downloadline::attr(href)').get()
    #     file_url = response.urljoin(file_url)
    #     item = DownfilesItem()
    #     item['file_urls'] = [file_url]
    #     yield {'file_url': file_url}


    def parse_item(self, response):
        file_urls = response.css('a[href]::attr(href)').extract()
        for file_url in file_urls:
            # important to use this loop and continue to crawl all href on one html
        # file_url = response.css('a[href]::attr(href)').get()
            file_url = response.urljoin(file_url)
            print(file_url)
            file_extension = file_url.split('.')[-1]
            print(file_extension)
            if file_extension not in ('pdf'):
            # if file_extension not in ('zip', 'exe', 'msi'):
                continue
            print("download!")
            item = DownfilesItem()
            item['file_urls'] = [file_url]
            item['original_file_name'] = file_url.split('/')[-1]
            # path = file_url.url.split('/')[-1]
            # self.logger.info('Saving PDF %s', path)
            # with open(path, 'wb') as f:
            #     f.write(response.body)x
            yield item

    # def parse_item(self, response):
    #     item = {}
    #     #item['domain_id'] = response.xpath('//input[@id="sid"]/@value').get()
    #     #item['name'] = response.xpath('//div[@id="name"]').get()
    #     #item['description'] = response.xpath('//div[@id="description"]').get()
    #     return item
