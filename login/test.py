import requests    # 用于向目标网站发送请求


url = '填入你学校的校园网登录页IP地址'  # 这行是你需要根据自己的情况修改的地方
data = {
    "DDDDD": '填入你的学号',   # 这行是你需要根据自己的情况修改的地方
    "upass": '填入你的密码',      # 这行是你需要根据自己的情况修改的地方

    # 下面的这些一般可以直接用(不用改),也有可能要根据你自己的浏览器中的data(数据)做些修改
    "R1": "0",
    "R3": "1",
    "R6": "0",
    "pare": "00",
    "OMKKey": "123456",

}
# 下面这整个 header 都是需要根据网页中的请求头来做修改
# 下面这整个 header 是我的,你需要按照你自己浏览器中出现的 Response Headers (请求标头)来修改
header = {
    "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
    "Accept-Encoding": "gzip, deflate",
    "Accept-Language": "en-US,en;q=0.9",
    "Cache-Control": "max-age=0",
    "Connectin": "keep-alive",
    "Host": "172.16.30.45",
    "Upgrade-Insecure-Requests": "1",
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53",
}
response = requests.post(url, data, headers=header).status_code  # POST 方式向 URL 发送表单，同时获取状态码
print("状态码{}".format(response))  # 打印状态码