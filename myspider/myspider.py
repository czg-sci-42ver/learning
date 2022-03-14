from fileinput import filename
import scrapy


class BlogSpider(scrapy.Spider):
    name = 'blogspider'
    # start_urls = ['https://www.zyte.com/blog/']
    start_urls = ['https://www.51test.net/show/10435029.html']

    def parse(self, response):
        # for title in response.css('.oxy-post-title'):
        #     yield {'title': title.css('::text').get()}

        # for next_page in response.css('a.next'):
        #     yield response.follow(next_page, self.parse)
        # _posts_grid-14-940 > div > div.oxy-post > div > div: nth-child(1) > a
        for i in range(4, 28, 1):
            for item in response.css(f'#content-txt > p:nth-child({i})'):
                filename = "test.txt"
                with open(filename, 'wb') as f:
                    yield {item.css('::text').get()}
                    f.write(item.css('::text').get())
