# -*- coding: utf-8 -*-
import scrapy
from scrapy.linkextractors import LinkExtractor
from scrapy.spiders import CrawlSpider, Rule
from downFiles.items import DownfilesItem
from scrapy.http import Request

class NirsoftSpider(CrawlSpider):
	name = 'pdf_downloader'
	# domain URL
	allowed_domains = ['www.stt.msu.edu']
	# links to the specific pages
	start_urls = ['http://www.stt.msu.edu/users/pszhong/']


	def parse(self, response):
		# selector of pdf file.
		selector = 'a[href$=".pdf"]::attr(href)'
		for href in response.css(selector).extract():
			yield Request(
				url=response.urljoin(href),
				callback=self.save_pdf
			)


	def save_pdf(self, response):
		""" Save pdf files """
		path = response.url.split('/')[-1]
		self.logger.info('Saving PDF %s', path);
		with open(path, 'wb') as file:
			file.write(response.body);