import scrapy
from dataclasses import make_dataclass
from re import sub

class DxsbbDongbeiUniversitySpider(scrapy.Spider):
    name = 'dxsbb_dongbei_university'
    # allowed_domains = ['dxsbb.com']
    start_urls = ['https://www.dxsbb.com/news/93221.html']
    
    # HTTPERROR_ALLOWED_CODES = [404]
    # html_path = 'dxsbb_dongbei_university'
    # def __init__(self):
    #     self.path_to_html = html_path + '.html'
    #     # self.path_to_header = header_path + 'index.html'
    #     self.html_file = open(self.path_to_html, 'w')

    def parse(self, response):
        # url = response.url
        # self.html_file.write(response.text)
        # self.html_file.close()

        filename = f'dxsbb_dongbei_university.html'
        with open(filename, 'wb') as f:
            f.write(response.body)

        # all_data = response.xpath("//div[@class='tablebox']//tr/td[text()='信息科学与工程学院']/../td[position()=1]")

        main_scope = "//h2[contains(text(),'2021')]/following-sibling::div[1]//tr/td[text()='信息科学与工程学院']/../td[position()="
        list_of_lists = []
        # all_data = response.xpath("//h2[contains(text(),'2021')]/following-sibling::div[1]//tr/td[text()='信息科学与工程学院']/../td[position()=1]/text()")
        
        # 1-9
        for item in range(1, 10):
            list_of_lists.append(response.xpath(
                main_scope + str(item) + "]/text()").getall())
        
        # name_list = ["学院码","学院名称","报考人数"]
        name_list = response.xpath(
            "//h2[contains(text(),'2021')]/following-sibling::div[1]//tr[1]/td/text()").getall()
        # LINK https://www.oreilly.com/library/view/python-cookbook/0596001673/ch01s15.html
        Mul_Infos = make_dataclass("Mul_Infos", [(sub("\W|^(?=\d)", "_", titles),type(infos)) for (titles,infos) in zip(name_list,list_of_lists[0])])
        # pd.DataFrame([Mul_Infos(0, 0), Mul_Infos(0, 3), Mul_Infos(2, 3)])

        # output_dict = {}
        # for item in range(len(list_of_lists[0])):
        #     for index in range(len(name_list)):
        #         # from scrapy.shell import inspect_response
        #         # inspect_response(response, self)
        #         output_dict
        #     yield{
        #         name_list[index]: list_of_lists[index][item]
        #     }

            # yield{
            #     name_list[0]: list_of_lists[0][item],
            #     name_list[1]: list_of_lists[1][item],
            #     name_list[2]: list_of_lists[6][item],
            # }

        # for item in all_data:
