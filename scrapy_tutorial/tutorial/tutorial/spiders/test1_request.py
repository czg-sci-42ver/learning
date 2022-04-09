# https://docs.scrapy.org/en/latest/topics/developer-tools.html#topics-developer-tools

import scrapy
import json


class QuoteSpider(scrapy.Spider):
    name = 'request'
    # allowed_domains = ['quotes.toscrape.com']
    # page = 1
    # start_urls = ['http://quotes.toscrape.com/api/quotes?page=1']

    def parse(self, response):
        request = scrapy.Request('http://www.example.com/index.html',
                                 callback=self.parse_page2,
                                 cb_kwargs=dict(main_url=response.url))
        print(response.url)
        request.cb_kwargs['foo'] = 'bar'  # add more arguments for the callback
        yield request

    def parse_page2(self, response, main_url, foo):
        print(main_url)
        yield dict(
            main_url=main_url,
            other_url=response.url,
            foo=foo,
        )
