# 基于Jenkins集成Ansible与Gitlab实现高可用环境下Wordpress的自动化部署

## 简介

Jenkins下建立并运行Pipeline Job，从Gitlab主机拉取剧本到Ansible主机，实现Nginx+Keepalived+MySQL+PHP+Wordpress自动化部署交付

## 项目环境

|         服务器          |    系统版本     |                   功能                    |                      演示地址                       |
| :---------------------: | :-------------: | :---------------------------------------: | :-------------------------------------------------: |
|   腾讯云49.234.26.139   | CentOS 7.5 64位 | Jenkins+Ansible<br/>+nginx1（Keepalived） | http://49.234.26.139:8081/login?from=%2F <br/>admin |
| 百度智能云182.61.46.239 | CentOS 7.5 64位 |           nginx2（Keepalived）            |                  VIP:192.168.0.99                   |
|   腾讯云49.232.126.90   | CentOS 7.5 64位 |                  Gitlab                   |        http://49.232.126.90:8091/ <br />root        |
|  天翼云180.163.84.151   | CentOS 7.5 64位 |                 交付对象                  |             http://180.163.84.151:8092/             |

## 最终效果

### Jenkins

http://49.234.26.139:8081/login?from=%2F  admin

pipeline job 执行成功

![](https://img.imgdb.cn/item/600a80bf3ffa7d37b314e1ad.png)

输出信息如下：

```shell
Started by user admin
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline (hide)
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/keepalived-LNMP-pipeline-job
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Pull deploy code)
[Pipeline] sh
+ git config --global http.sslVerify false
[Pipeline] dir
Running in /var/lib/jenkins/workspace/keepalived-LNMP-pipeline-job
[Pipeline] {
[Pipeline] git
The recommended git tool is: NONE
using credential 1604d924-5b6b-4092-b474-fe800180e89a
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url http://49.232.126.90:8091/root/ansible-playbook-repo.git # timeout=10
Fetching upstream changes from http://49.232.126.90:8091/root/ansible-playbook-repo.git
 > git --version # timeout=10
 > git --version # 'git version 1.8.3.1'
using GIT_ASKPASS to set credentials git Credential凭据
 > git fetch --tags --progress http://49.232.126.90:8091/root/ansible-playbook-repo.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision 64bed578dcd97c01011d4c8eb196e120403ca269 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 64bed578dcd97c01011d4c8eb196e120403ca269 # timeout=10
 > git branch -a -v --no-abbrev # timeout=10
 > git branch -D master # timeout=10
 > git checkout -b master 64bed578dcd97c01011d4c8eb196e120403ca269 # timeout=10
Commit message: "solve some problem"
 > git rev-list --no-walk 64bed578dcd97c01011d4c8eb196e120403ca269 # timeout=10
[Pipeline] }
[Pipeline] // dir
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Check env)
[Pipeline] sh

+ set +x
[INFO] Current deployment user is deploy
[INFO] Current python version
Python 3.6.5
[INFO] Current ansible version

ansible-playbook 2.5.15 (stable-2.5 c8dfe5b6d3) last updated 2021/01/10 19:02:55 (GMT +800)
  config file = None
  configured module search path = ['/home/deploy/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/deploy/.py3-a2.5-env/ansible/lib/ansible
  executable location = /home/deploy/.py3-a2.5-env/ansible/bin/ansible-playbook
  python version = 3.6.5 (default, Jan 10 2021, 16:52:37) [GCC 4.8.5 20150623 (Red Hat 4.8.5-44)]
[INFO] Remote system disk space

Filesystem      Size  Used Avail Use% Mounted on
devtmpfs        909M     0  909M   0% /dev
tmpfs           920M     0  920M   0% /dev/shm
tmpfs           920M   97M  823M  11% /run
tmpfs           920M     0  920M   0% /sys/fs/cgroup
/dev/vda1        40G  2.9G   38G   8% /
tmpfs           184M     0  184M   0% /run/user/0
[INFO] Rmote system RAM

              total        used        free      shared  buff/cache   available
Mem:           1838         433         367          96        1037        1141
Swap:             0           0           0
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Anisble deployment)
[Pipeline] input
Do you approve the deployment?
Proceed or Abort

Approved by admin
[Pipeline] dir
Running in /var/lib/jenkins/workspace/keepalived-LNMP-pipeline-job/wordpress_playbooks
[Pipeline] {
[Pipeline] echo
[INFO] Start deployment
[Pipeline] sh
+ set +x

PLAY [wordpress] ***************************************************************

TASK [Gathering Facts] *********************************************************

ok: [test.tianyiyun.com]

TASK [wordpress : Update yum dependency] ***************************************

changed: [test.tianyiyun.com]

TASK [wordpress : Disable system firewall] *************************************

ok: [test.tianyiyun.com]

TASK [wordpress : Disable SELINX] **********************************************

ok: [test.tianyiyun.com]

TASK [wordpress : Setup epel yum source for nginx and mariadb(mysql)] **********

ok: [test.tianyiyun.com]

TASK [wordpress : Setup webtatic yum source for php-fpm] ***********************

ok: [test.tianyiyun.com]

TASK [wordpress : Ensure nginx is at the latest version] ***********************

ok: [test.tianyiyun.com]

TASK [wordpress : Write the nginx config file] *********************************
ok: [test.tianyiyun.com]

TASK [wordpress : Create nginx root folder] ************************************
ok: [test.tianyiyun.com]

TASK [wordpress : Copy info.php to remote] *************************************

changed: [test.tianyiyun.com]

TASK [wordpress : Restart nginx service] ***************************************

changed: [test.tianyiyun.com]

TASK [wordpress : Setup php-fpm] ***********************************************

changed: [test.tianyiyun.com]

TASK [wordpress : Restart php-fpm service] *************************************
changed: [test.tianyiyun.com]

TASK [wordpress : Copy php-fpm config file to remote] **************************

ok: [test.tianyiyun.com]

TASK [wordpress : Restart php-fpm service] *************************************

changed: [test.tianyiyun.com]

TASK [wordpress : Run the health check locally] ********************************
changed: [test.tianyiyun.com -> localhost]

TASK [wordpress : debug] *******************************************************
ok: [test.tianyiyun.com] => {
    "msg": "180.163.84.151,8092\nThe remote side is healthy"
}

TASK [wordpress : Setup mariadb(mysql)] ****************************************

changed: [test.tianyiyun.com]

TASK [wordpress : Backup current www folder] ***********************************
changed: [test.tianyiyun.com]

TASK [wordpress : Close git ssl verification] **********************************
changed: [test.tianyiyun.com]

TASK [wordpress : Clone WordPress repo to remote] ******************************

changed: [test.tianyiyun.com]

TASK [wordpress : Change www folder permission] ********************************
changed: [test.tianyiyun.com]

PLAY [nginx] *******************************************************************

TASK [Gathering Facts] *********************************************************
ok: [182.61.46.239]
ok: [172.17.0.3]

TASK [nginx : install epel] ****************************************************
ok: [182.61.46.239]

changed: [172.17.0.3]

TASK [nginx : install nginx] ***************************************************
ok: [172.17.0.3]
ok: [182.61.46.239]

TASK [nginx : install config file] *********************************************

changed: [172.17.0.3]
ok: [182.61.46.239]

TASK [nginx : start nginx] *****************************************************

ok: [172.17.0.3]
ok: [182.61.46.239]

TASK [keepalived : install keepalived] *****************************************

ok: [182.61.46.239]

changed: [172.17.0.3]

TASK [keepalived : install config file] ****************************************
changed: [172.17.0.3]

ok: [182.61.46.239]

TASK [keepalived : start keepalived] *******************************************
changed: [172.17.0.3]
ok: [182.61.46.239]

PLAY RECAP *********************************************************************
172.17.0.3                 : ok=8    changed=5    unreachable=0    failed=0   
182.61.46.239              : ok=8    changed=0    unreachable=0    failed=0   
test.tianyiyun.com         : ok=22   changed=12   unreachable=0    failed=0   

[Pipeline] echo
[INFO] Deployment finished...
[Pipeline] }
[Pipeline] // dir
[Pipeline] }

[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```

### Gitlab

http://49.232.126.90:8091/    root

![](https://img.imgdb.cn/item/600a819e3ffa7d37b31565ee.png)

### 两台nginx服务器上的keepalived和nginx都正常启动

![](https://img.imgdb.cn/item/600a82003ffa7d37b315a405.png)

![](https://img.imgdb.cn/item/600a823d3ffa7d37b315bf2e.png)

### Wordpress

可通过代理服务器成功访问 Keepalived master nginx2: http://182.61.46.239/

![](https://img.imgdb.cn/item/600a82ae3ffa7d37b315f5bc.png)

交付对象上的服务也已经正常启动 http://180.163.84.151:8092/

![](https://img.imgdb.cn/item/6002c65a3ffa7d37b3f0feb6.png)