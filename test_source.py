import numpy as np
np.random.seed(1)

# import numpy as np
from sklearn.feature_extraction.text import CountVectorizer

count = CountVectorizer()
# coun = CountVectorizer(ngram_range=(1,1))  # 1克模型,默认  （2，2）2克模型
docs = np.array([
        'The sun is shining',
        'The weather is sweet',
        'The sun is shining, the weather is sweet, and one and one is two'])
bag = count.fit_transform(docs)