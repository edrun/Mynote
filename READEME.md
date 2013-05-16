Something like notes.
=====================
Just conform for me.
---------------------

### 合并分支

背景:
fork 了一个感兴趣的项目,例如 memcached,它的开发者很活跃,很快会遇到将主项目合并到 fork 出的分支中来的实际问题,远程分支合并.

具体步骤:
1. 显示数据仓库
$ git remote -v
origin  git@github.com:hy0kl/memcached.git (fetch)
origin  git@github.com:hy0kl/memcached.git (push)
可以看到当前的git库中,有一个默认的远程数据仓库,后面的(fetch)和(push)是 pull 抓取数据和 push 推送数据的地址.
我们要合并的是 git://github.com/memcached/memcached.git

2. 方法
$ git checkout -b  feature    # 创建并切换到新的 feature 分支来进行 merge 操作,降低操作风险
$ git remote -v   # 查看当前的远程仓库配置
$ git remote add dev-memcached git://github.com/memcached/memcached.git
$ git remote -v   # 查看新增后的变化,形如:
    dev-memcached   git://github.com/memcached/memcached.git (fetch)
    dev-memcached   git://github.com/memcached/memcached.git (push)
    origin  git@github.com:hy0kl/memcached.git (fetch)
    origin  git@github.com:hy0kl/memcached.git (push)
$ git fetch dev-memcached # 将 dev-memcached(即 memcached 最新源码) fetch 下,准备进行 merge
$ git merge dev-memcached/master  # 将 dev-memcached 下 maste 分支的内容 merge 到当前的数据仓库.其他的分支也可以,将master替换即可
$ git remote rm dev-memcached     # 删除远程数据仓库,避免以后误操作

3. 合并代码
之后如果代码冲突解决完成,可以按照正常的代码提交流程进行代码提交:
$ git commit -am "msg"
$ git pull
$ git push

如果是 master 分支开发,则
$ git checkout master
$ git merge feature
# 有冲突,解决后先 commit
$ git push  # 完成

PS: 感谢姜同学

### 打印命令输出状态

>
	$echo $? 
>
>命令成功运行后会输出0，不成功会输出非0
>
	$ls + >stout 
	$ls + 2> stout
	$ls + 2>error 1>correct
	$ls > all 2>&1
	$ls + &> output

	$find . -name "" 2> /dev/null #back hole
> 重定向，保留副本作为stdin
>	
	$cat *aa|tee out.txt|cat -n #将输出写入out.txt，而out.txt作为cat 的输入
teee会直接覆盖掉原来内容，需要tee -a追加动作。
>列出文本文件slayers.story的内容，同时复制3份副本，文件名称分别为ss-copy1、ss-copy2、ss-copy3：
　　$ cat slayers.story |tee ss-copy1 ss-copy2 ss-copy3
### 进制转换

>小数点设定，echo "scale=2;3/8"|bc
>
>二进制转换，echo "obase=2;100"|bc
>
>平方根： echo "sqrt(100)"|bc
>
>平方： echo "10^10"|bc


### 获取字符串长度

>	
	$var=1234567890
	$length=${#var}
>

### 判断当前shell

>
	$echo $SHELL
	or
	$echo $0
>

### 检查是否为超级用户

>
	if [ $UID -ne 0]; then
	   echo root user.
	else
	   echo no-root user.
	fi
>or
>
	if [ "`id -u`" -eq 0]; then
		echo root
	else
	    echo no-root
	fi
>or
>
	if [ "whoami" == "root" ]; then
		echo root
	else 
		echo no-root
	fi
>
### PS1设置问题

>LINUX查询环境由：/etc/profile,$HOME/.bash_profile,/etc/basrc,$HOME/.bashrc
>
>诺基亚N9 中设定档/etc/profile内容如下：
>
    if [ "`id -u`" -eq 0 ]; then
        PS1="[\e[1;31m\u\e[0m@\h \w]\$"
    else
        PS1="[\u@\h \w]\$"
    fi
>
    但是，当devel-su进入root后，提示符依然为$，且root不显示颜色。why?
    可以确定在手动,source /etc/profile之后，可以显示颜色。但符号并没有自动
    显示成$。
>
>   这里两处可疑：
>
- [进入root之后并没有执行/etc/profile,而其余/root/.profile,/etc/.basrc
      都是根据此档来设定的。
- [$转义字符并不能如PC一样工作，可能得手动添加，而这又在哪里呢？

###　unix2dos CLFS error
>
>dpkg-reconfigure dash #选择NO
>
>use cp/mv rename the source file
>
>unix2dos file .Just feel free.　
