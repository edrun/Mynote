
1. getmail 定时收取邮件，并把邮件投递到预设的目录下。
2. mutt 监视邮件目录，报告新邮件，读取邮件。并调用 msmtp 回复或发送新邮件。
3. msmtp 被 mutt 调用，用来发送邮件。

1 sudo apt-get install mutt getmail msmtp;

2. 建立需要的目录和文件。
$ mkdir -p ~/Mail/inbox
$ touch ~/Mail/postponed
$ mkdir ~/.getmail
$ mkdir ~/log

$ crontab -e ，添加：

#每小时10分，30分，50分的时候收一次信
10,30,50 * * * * ~/.getmail/getmail.sh

