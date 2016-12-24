# 研究生毕业论文 LaTex源代码

模板文件采用 [https://github.com/ustctug/ustcthesis](https://github.com/ustctug/ustcthesis)。
windows操作系统下，安装了Text live 2015后，在命令行中输入 `make`  即可编译出pdf版本。

# submit工具
git管理脚本，submit + 评论，即可提交。

也可以将该脚本作为自动任务，
每日自动提交。

# 编译工具
采用Text live 2015版本编译不会出错，如果是其他版本 who knows?

```
make [OPTION]  
    默认编译电子版，链接和引用将为彩色   
	fast   快速编译，不会加载引文
	print  打印版编译，链接和引用都是黑色的
```
# 字数统计工具
wc.py 直接运行这个python脚本即可统计文中字数，排除了方程，图片，英文等！

```
块级方程: 220
行内方程: 667
图片数目: 34
英文单词: 1482
中文汉字: 32915
总的词数: 34397
总的字符: 101012
```

----------------
左元   
2016-05-08


(C) 保留版权，文章内容版权归作者所有.
