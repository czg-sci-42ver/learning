import scrapy
import os
from scrapy.pipelines.files import FilesPipeline


class legco(scrapy.Spider):
    name = "sec_gov"

    start_urls = [
        "https://www.sec.gov/cgi-bin/browse-edgar?action=getcompany&SIC=2834&owner=exclude&match=&start=120&count=40&hidefilings=0"]

    custom_settings = {
        'ITEM_PIPELINES': {'scrapy.pipelines.files.FilesPipeline': 900},
        'FILES_STORE': '/home/czg/python_learning/mul_links/mul_links/spiders',
    }

    def parse(self, response):
        for link in response.xpath('//table[@summary="Results"]//td[@scope="row"]/a/@href').extract():
            absoluteLink = response.urljoin(link)
            yield scrapy.Request(url=absoluteLink, callback=self.parse_links)

    def parse_links(self, response):
        for links in response.xpath('//table[@summary="Results"]//a[@id="documentsbutton"]/@href').extract():
            targetLink = response.urljoin(links)
            yield scrapy.Request(url=targetLink, callback=self.collecting_file_links)

    def collecting_file_links(self, response):
        for links in response.xpath('//table[contains(@summary,"Document")]//td[@scope="row"]/a/@href').extract():
            if links.endswith(".htm") or links.endswith(".txt"):
                yield {
                    'file_urls': [response.urljoin(links)]
                }


class MyFilesPipeline(FilesPipeline):

    def file_path(self, request, response=None, info=None):
        return request.url.split('/')[-1]
