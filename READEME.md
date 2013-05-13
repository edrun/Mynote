Something like notes.
=====================
Just conform for me.
---------------------

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
-[$转义字符并不能如PC一样工作，可能得手动添加，而这又在哪里呢？

###　unix2dos CLFS error
>
>dpkg-reconfigure dash #选择NO
>
>use cp/mv rename the source file
>
>unix2dos file .Just feel free.　
