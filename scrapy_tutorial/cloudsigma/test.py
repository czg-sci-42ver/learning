import scrapy


class CloudSigmaCrawler(scrapy.Spider):
    name = "cloudsigma_crawler"
    start_urls = ['https://www.cloudsigma.com/blog']

    def parse(self, response):
        SET_SELECTOR = '.post'
        for tutorial in response.css(SET_SELECTOR):
            pass
