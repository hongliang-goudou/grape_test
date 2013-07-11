grape_test
==========

最简单的能把Grape和ActiveRecord跑起来的例子

文件说明
---------

db/目录放置的是已经写有数据的sqlite3文件，有张posts表，主键ID为1和4的数据存在  
models/目录可以认为是从外部导来的ActiveRecord模型定义文件

跑起来
---------

先执行bundle install安装各种需要用到的gem，再执行./run.sh，或者手工敲命令让rainbows跑起来：  
bundle exec rainbows -c unicorn.rb -d config.ru

打开浏览器访问
---------
默认端口3000，使用这两个URL可以得到访问数据：  
http://localhost:3000/statuses/1  
http://localhost:3000/statuses/4

其他
---------
api.rb中被注释掉的代码是用来测试连接memcached而不走数据库时的情况
