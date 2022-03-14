from scrapy import Request

#

# request = Request.from_curl(
#     """curl 'http://quotes.toscrape.com/api/quotes?page=1'
#     - X 'OPTIONS'
#     - H 'Connection: keep-alive'
#     - H 'Accept: */*'
#     - H 'Access-Control-Request-Method: GET'
#     - H 'Access-Control-Request-Headers: x-requested-with'
#     - H 'Origin: null'
#     - H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.137 Safari/537.36'
#     - H 'Sec-Fetch-Mode: cors'
#     - H 'Accept-Language: zh-CN,zh;q=0.9,und;q=0.8,zh-Hans;q=0.7,en;q=0.6'
#     - -compressed
#     - -insecure""")
# print(request.text)
