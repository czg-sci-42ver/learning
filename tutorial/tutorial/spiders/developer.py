# https://docs.scrapy.org/en/latest/topics/developer-tools.html#topics-developer-tools

import scrapy
import json


class QuoteSpider(scrapy.Spider):
    name = 'quote_0'
    allowed_domains = ['quotes.toscrape.com']
    page = 1
    start_urls = ['http://quotes.toscrape.com/api/quotes?page=1']

    def parse(self, response):
        data = json.loads(response.text)
        print("data", data == response.text)
        # print("response.text", response.text)
        for quote in data["quotes"]:
            yield {"quote": quote["text"]}
        if data["has_next"]:
            self.page += 1
            url = f"http://quotes.toscrape.com/api/quotes?page={self.page}"
            yield scrapy.Request(url=url, callback=self.parse)
