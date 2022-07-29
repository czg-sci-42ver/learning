# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


import os
from urllib.parse import urlparse
from os.path import basename,dirname,join
from scrapy.pipelines.files import FilesPipeline

# class MyFilesPipeline(FilesPipeline):

#     def file_path(self, request, response=None, info=None, *, item=None):
#         return 'files/' + os.path.basename(urlparse(request.url).path)

class DownfilesPipeline(FilesPipeline):
    # def process_item(self, item, spider):
    #     return item

    def file_path(self, request, response=None, info=None, *, item=None):
        print("file_path ",urlparse(request.url).path)
        # print("file_pathfile_path ",item.get('original_file_name')) 
        # not use item,which may not exist 
        return basename(urlparse(request.url).path)
        # return item.get('original_file_name')

    # def file_path(self, request, response=None, info=None):
    #  # DEFAULT IMPLENTATION
    #     # media_guid = hashlib.sha1(to_bytes(request.url)).hexdigest()
    #     media_ext = os.path.splitext(request.url)[1]
    #     return '%s' % (media_ext)