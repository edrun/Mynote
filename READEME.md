Something like notes.
=====================
Just conform for me.
---------------------

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
