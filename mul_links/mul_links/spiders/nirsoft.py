# https://github.com/eupendra/Download_Files_Crawl_Spider
import scrapy
from scrapy.linkextractors import LinkExtractor
from scrapy.spiders import CrawlSpider, Rule
# from scrapy.downFiles.items import DownfilesItem
# from scrapy.pipelines.files import FilesPipeline
from mul_links.items import MulLinksItem


class DownfilesItem(MulLinksItem):

    # define the fields for your item here like:
    file_urls = scrapy.Field()
    print("file_urls", file_urls)
    original_file_name = scrapy.Field()
    files = scrapy.Field
    print("files", files)

    # def file_path(self, request, response=None, info=None):
    #     file_name: str = request.url.split("/")[-1]
    #     return file_name


class NirsoftSpider(CrawlSpider):
    name = 'nirsoft'
    allowed_domains = ['www.nirsoft.net']
    start_urls = ['http://www.nirsoft.net/']
    custom_settings = {'FILES_STORE': r'/home/czg/python_learning/mul_links/mul_links/mul_links/spiders/download',
                       #    'FILES_STORE': '/home/czg/python_learning/mul_links/mul_links/spiders/download',
                       "LOG_FILE": "scrapy.log",
                       #    "LOG_LEVEL": "ERROR",
                       #    "LOG_ENABLED": "False"
                       }

    rules = (
        Rule(LinkExtractor(allow=r'utils/'),
             callback='parse_item', follow=True),
    )

    def parse_item(self, response):
        # print(response.url)
        # yield response.url

        file_url = response.css('.downloadline::attr(href)').get()
        file_url = response.urljoin(file_url)
        print("test", file_url)
        yield {'file_url': file_url}
        file_extension = file_url.split('.')[-1]
        print(file_extension)
        if file_extension not in ('zip', 'exe', 'msi'):
            return
        item = DownfilesItem()

        item['file_urls'] = [file_url]
        # print("", file_url.split('/'))
        item['original_file_name'] = file_url.split('/')[-1]

        # item = {}
        # item = DownfilesItem()
        # item['file_urls'] = [file_url]

        #item['domain_id'] = response.xpath('//input[@id="sid"]/@value').get()
        #item['name'] = response.xpath('//div[@id="name"]').get()
        #item['description'] = response.xpath('//div[@id="description"]').get()
        return item
