Some keys from learning.
=====================
Plz, feel free for it

###Makefile中特殊字符的含义

"@" ---不回显命令内容，只显示输出结果

"-" ---在执行到的时候如果发生错误（退出返回非零状态）时，不中断make过程。

"+" --- makefile中以+开头的命令的执行不受到 make的-n,-t,-q三个参数的影响。我们知道，在make的时候，如果加上-n, -t, -q这样的参数，都是不执行相应命令的，而以'+'开头的命令，则无论make命令后面是否跟着三个参数，都会被执行。


###vim 快捷键

	1 行首：home或者0或者^
	2 行尾：end 或者$
        3 搜索选中"#,*"
        4 单词移动"b/B"
        5 "(,)"句子，"｛，｝"段落
        6  

###Linux的install命令

####【概述】

#####Install和cp类似，都可以将文件/目录拷贝到指定的地点。但是，install允许你控制目标文件的属性。install通常用于程序的makefile，使用它来将程序拷贝到目标（安装）目录。

####【语法】
>

	install [OPTION]... [-T] SOURCE DEST

	install [OPTION]... SOURCE... DIRECTORY

	install [OPTION]... -t DIRECTORY SOURCE...

	install [OPTION]... -d DIRECTORY...

#####*如果指定了两个文件名, `install' 将第一个文件拷贝到第二个

#####*如果使用了 `--target-directory' (`-t') 选项，或者如果最后一个文件是一个目录并且没有使用`--no-target-directory' (`-T')选项， `install'将每一个源文件拷贝到指定的目录，目标文件名与SOURCE文件名相同。

#####* 如果使用了 `--directory' (`-d') 选项, `install' 将逐级创建缺失的目标目录

####【常用选项】
>
	-s:对待拷贝的可执行文件进行strip操作，取出文件中的符号表。（一般在做成nand rom时去除符号表，NFS时为了调试方便，一般不会使用此选项）

	-d(--directory)：创建制定的目录结构（逐级创建）。如，指定安装位置为/usr/local/aaa/bbb，/usr/loacal已存在，install会帮助我们创建aaa和bbb目录，并把程序安装到指定位置。





###再次记录git-ssh配置
####1.产生密钥
>ssh-keygen -t rsa -C "you@email.com"

####2.添加公钥
>ssh-add id_rsa
如果错误
>ssh-agent bash

####3.复制到git-ssh管理处
>clip < ~/.ssh/id_rsa.pub

####4.测试与验证
>
	ssh -T git@github.com
	git config --global user.email "you@email.com"
	git config --global user.name "you"

####5.enjoy!


### syetemctl用法

<table>
   <tr>
      <td>对比表，以 apache / httpd 为例</td>
   </tr>
   <tr>
      <td>任务</td>
      <td>旧指令</td>
      <td>新指令</td>
   </tr>
   <tr>
      <td>使某服务自动启动</td>
      <td>chkconfig --level 3 httpd on</td>
      <td>systemctl enable httpd.service</td>
   </tr>
   <tr>
      <td>使某服务不自动启动</td>
      <td>chkconfig --level 3 httpd off</td>
      <td>systemctl disable httpd.service</td>
   </tr>
   <tr>
      <td>检查服务状态</td>
      <td>service httpd status</td>
      <td>systemctl status httpd.service （服务详细信息） systemctl is-active httpd.service （仅显示是否 Active)</td>
   </tr>
   <tr>
      <td>显示所有已启动的服务</td>
      <td>chkconfig --list</td>
      <td>systemctl list-units --type=service</td>
   </tr>
   <tr>
      <td>启动某服务</td>
      <td>service httpd start</td>
      <td>systemctl start httpd.service</td>
   </tr>
   <tr>
      <td>停止某服务</td>
      <td>service httpd stop</td>
      <td>systemctl stop httpd.service</td>
   </tr>
   <tr>
      <td>重启某服务</td>
      <td>service httpd restart</td>
      <td>systemctl restart httpd.service</td>
   </tr>
   <tr>
      <td></td>
   </tr>
</table>



###rsync 同步用法
场景1：同步b目录，源目录为a
要求b中没有a的就同步a，同样a中没有b的就删除b的
>应用：
>rsync -a --delete a/ b/ 

场景2：在上步基础上不同.o文件，但同步.txt文件
>应用：
>rsync -a --include "*.txt" --exclude "*.o" --delete a/ b/



### 需要注意的亮点

tempfile="/var/var.$$" 
$$为当前进程名，可以用$RANDOM随机数来表示

###split

dd if=/dev/zero bs=100k count=1 of=data.file

split -b 10k data.file -d -a 4 split_name

-b kb
-m M
-g G
默认是x开头的，加-d -a 定义分割的文件名


###sort 小综合

echo ssadfafggfahhhhadfdgfg|sed 's/[^\n]/&\n/g'|sort|uniq -c|sed '/^$/d'|tr -d ' \n'

1.s/[^\n]/&\n/g  将字母首用断行代替
s/./&\n/g等价，..表示两个字符，...三个字符，以此类推

2.sort|uniq -c 可以用sort -u 

sed '/^$/d'换空白
tr -d ' \n' 改掉换行符和空白








###sort & uniq

1.uniq -c 重复输出一次，并显次数
2.uniq -d 输出重复项目，只输出一次
3.uniq -u 只输入file中唯一的行，不显示重复行
4.uniq f1 f2 删掉重复行，并cp到f2


q 命令除重 必须用sort命令进行递增或递减排序后才能用。
sort  file 
uniq  file
或直接使用

sort -u file  这条命令包括排序及除重...

sort -nrk 1 file.txt
n数据排序，r反序，k 1 第一栏，k表栏







find用法

find . -name "\(-name hello -o -name pyhon\)" -print
find . -path "*sysy" -print
find . -regex ".*\(\.py\|\.sh\)$" -print
find . ! -name  //忽略某文件名
find . -maxdepth 1 -type f -print //当前目录

###git 恢复单个文件

git checkout -- 文件名称




### 终端信息处理
	$tput cols 获取列数
	$tput lines 获取行数


### 别名技巧
	alias rm='cp $@ ~/backup;rm $@' ;删除源文件之前先对其备份
	\command 忽略别名，这对不信任的机器上是很有帮助的

### 合并分支

背景:

>
fork 了一个感兴趣的项目,例如 memcached,它的开发者很活跃,很快会遇到将主项目合并到 fork 出的分支中来的实际问题,远程分支合并.

具体步骤:

1. 显示数据仓库

>
$ git remote -v
	origin  git@github.com:hy0kl/memcached.git (fetch)
	origin  git@github.com:hy0kl/memcached.git (push)

	可以看到当前的git库中,有一个默认的远程数据仓库,后面的(fetch)和(push)是 pull 抓取数据和 push 推送数据的地址.
	我们要合并的是:
>
	git://github.com/memcached/memcached.git


2. 方法

>
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
>之后如果代码冲突解决完成,可以按照正常的代码提交流程进行代码提交:

>
	$ git commit -am "msg"
	$ git pull
	$ git push

如果是 master 分支开发,则

>
	$ git checkout master
	$ git merge feature
	# 有冲突,解决后先 commit
	$ git push  # 完成

PS: 感谢姜同学

### 打印命令输出状态
i
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
