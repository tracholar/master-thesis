#coding:utf-8
import re
import os
from os.path import join

rootdir = './chapters'
fs = os.listdir(rootdir)
fs = [join(rootdir,f) for f in fs if f not in ('.','..') and f[-3:]=='tex']

eq_count = 0
inline_eq_count = 0
fig_count = 0
ch_word_count = 0
en_word_count = 0
all_count = 0

eq_re = re.compile(r'\\begin\{equation\}.+?\\end\{equation\}', re.M | re.U | re.S)
inline_eq_re = re.compile(r'\$.+?\$', re.M | re.U | re.S)
fig_re = re.compile(r'\\begin\{figure\}.+?\\end\{figure\}', re.M | re.U | re.S)
en_word_re = re.compile(r'[0-9a-zA-Z\-\{\'"\}]+', re.M | re.U | re.S)
space_re = re.compile(r'\s+', re.M | re.U | re.S)
ctrl_re = re.compile(r'\\[a-zA-Z]+\{.+?\}', re.M | re.U | re.S)
for f in fs:
    chap = open(f).read().decode('utf-8','ignore')
    
    all_count += len(chap)
    #处理方程
    obj = eq_re.findall(chap)
    eq_count += len(obj)
    chap = eq_re.sub('', chap)
    
    obj = inline_eq_re.findall(chap)
    inline_eq_count += len(obj)
    chap = inline_eq_re.sub('', chap)
    
    #图片
    obj = fig_re.findall(chap)
    fig_count += len(obj)
    chap = fig_re.sub('', chap)
    
    
    #控制字符
    chap = ctrl_re.sub('', chap)
    
    #英文单词
    obj = en_word_re.findall(chap)
    en_word_count += len(obj)
    chap = en_word_re.sub('', chap)
    
    #汉字
    chap = space_re.sub('', chap)
    ch_word_count += len(chap)
    
    
output = '''
块级方程: %d
行内方程: %d
图片数目: %d 
英文单词: %d 
中文汉字: %d 
总的词数: %d 
总的字符: %d
''' % (eq_count, inline_eq_count, fig_count, en_word_count,\
    ch_word_count, en_word_count + ch_word_count, all_count)

print output.decode('utf-8')