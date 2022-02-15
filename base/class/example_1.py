def scope_test():
    def do_local():
        spam = "local spam"

    def do_nonlocal():
        nonlocal spam
        spam = "nonlocal spam"

    def do_global():
        global spam
        spam = "global spam"

    spam = "test spam"
    do_local()
    print("After local assignment:", spam)
    do_nonlocal()
    print("After nonlocal assignment:", spam)
    do_global()
    print("After global assignment:", spam)


def method():

    def method2():
        # In nested method, reference nonlocal variable.
        nonlocal value
        # global value
        value = 100

    # Set local.
    value = 10
    method2()

    # Local variable reflects nonlocal change.
    print(value)


# Call method.
method()

scope_test()
print("In global scope:", spam)


class MyClass:
    """A simple example class"""
    i = 12345

    def f(self):
        return 'hello world'

    def __init__(self):
        self.data = []


x = MyClass()

x.counter = 1
while x.counter < 10:
    x.counter = x.counter * 2
print(x.counter)
del x.counter

xf = x.f
# while True:
#     print(xf())

# derived class


class Product:

    def __init__(self, price):
        self.price = price


class Book(Product):

    def __init__(self, price, page):
        super().__init__(price)
        self.page = page


s = Product.__subclasses__()

for item in s:
    print(item)

print(s.count)
print(s)  # [<class '__main__.Book'>]
print(type(s))  # <class 'list'>

t = s[0]

print(t)  # <class '__main__.Book'>

n = t.__name__

print(n)  # Book

# iterator
for element in [1, 2, 3]:
    print(element)
for element in (1, 2, 3):
    print(element)
for key in {'one': 1, 'two': 2}:
    print(key)
test = {'one': 1, 'two': 2}
for item in test.values():
    print(item)
    print("\n")
for char in "123":
    print(char)
# for line in open("myfile.txt"):
#     print(line, end='')


class Reverse:
    """Iterator for looping over a sequence backwards."""

    def __init__(self, data):
        self.data = data
        self.index = len(data)

    def __iter__(self):
        return self

    def __next__(self):
        if self.index == 0:
            print(self.index)
            raise StopIteration
        self.index = self.index - 1
        # self.index = self.index + 1
        return self.data[self.index]
# https://docs.python.org/3/library/stdtypes.html#iterator.__next__


rev = Reverse('czg')
iter(rev)
for char in rev:
    print(char)


def reverse(data):
    for index in range(len(data)-1, -1, -1):
        yield data[index]


print(reverse('tt'))

for char in reverse('golf'):
    for i in range(5):
        print(char)
        print('generator')
        print(char)
        print('generator')
# @property
# print( range(6,0,2))

#
mylist = [x*x for x in range(3)]
mygenerator = (x*x for x in range(3))
# debug to see how list and generator works differently
print(mygenerator)
for i in mygenerator:
    print(i)
    print('mygenerator')
for i in mygenerator:
    print(i)
    print('mygenerator')

for i in mylist:
    print(i)
for i in mylist:
    print(i)
page = "fwaiofaf\nline in page\ndsdvbasdvbs"
unique_words = set(word for line in page for word in line.split('\n'))

print(unique_words)
for line in page:
    print(line)

print('unique')
print(set("aaaaaaaaaaaaaaa"))
