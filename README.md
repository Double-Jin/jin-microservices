# 介绍

Jin-microservices是基于 php 语言 + hyperf 微服务 框架的完整微服务demo。

# 关于 JM

作为php、go双修的开发者，在 go 语言的微服务体系已了如指掌，go 语言微服务的相关文章、开源项目一搜一大堆，让会 go 语言的开发者能容易地上手并实现微服务，毕竟微服务是go语言的主要优势之一。

php语言的优势在于web生态，开发的应用绝大多数为单体应用架构。近年来随着基于 swoole 扩展的 hyperf框架的出现，让php也能开发微服务架构，但用 "php + 微服务 "作为关键词时，搜索出来的文章、开源项目都是一些简单的案例，开发者并不能通过这些简单的案例来了解微服务，这让我有了想写本项目的原始动力。

# 前言

JM 是一款基于 php 语言 + hyperf 微服务 框架编写的完整微服务demo，与网上能找到的单一功能点简单实现的文章不同，JM从实际项目需求出发，力求做到让你git clone 项目下来后对着文件帮你构建微服务完整的知识体系，在你实际用hyperf开发微服务项目时能粘贴复制本项目的代码。

微服务架构不是比单体架构先进的架构，只是在项目体量、项目开发者人数达到一定量级后的一种选择。切勿盲目鼓吹微服务，在团队开发、运维能力不足的情况下强行推进微服务架构恐怕会适得其反。

下面提到的组件并不是微服务才能使用，如elk、nacos、dtm这些，单体应用也有十分合适的场景。生产上用到这些组件最好编译安装或购买云服务

## 功能亮点

* 完整微服务架构
* JsonRpc调用
* 统一异常处理
* 服务注册与服务发现
* 链接追踪
* 配置中心
* 服务限流
* 服务降级
* 分布式日志
* 分布式事务

# 准备
微服务是把单体应用进行分拆后的架构，分拆后带来的问题通过引用第三方组件来解决，安装部署这些组件的时候你将会遇到很多奇奇怪怪的问题。为减低难度，本项目大量采用docker来安装，即便如此还是会存在如http/tcp访问、端口、内存、docker版本等问题，同样的操作换了台电脑就可能出问题，这需要你自行解决。
- 能提供空闲4核8G资源的电脑
- 熟悉docker
- 了解网络协议
- 基本的运维能力

# 安装

Mysql

  ```bash  
  1.安装 - 略
  2.新建order-srv数据库
  3.导出/jin-microservices/order-srv.sql
  4.新建user-srv数据库
  5.导出/jin-microservices/user-srv.sql
```

Redis
 ```bash  
  1.安装 - 略
```

Nacos
 ```bash  
  1.docker run --name nacos-standalone -e MODE=standalone
  -e JVM_XMS=512m -e JVM_XMN=256m -p 8848:8848 -d
  nacos/nacos-server:v2.1.0
  2.访问http://127.0.0.1:8848/nacos/#/login
  3.用户名密码: nacos/nacos
  4.命名空间->新建命名空间->增加空间 `dev`
  5.配置管理->配置列表->dev->导入配置->/jin-microservices/nacos_config.zip
```

ELK

 ```bash  
  1.vi /etc/sysctl.conf
    #末尾添加一行
    vm.max_map_count=262144
    #查看结果
    sysctl -p
  2.docker run -p 5601:5601 -p 9200:9200 、
  -p 5044:5044 -itd --name elk sebp/elk:780
  3.docker exec -it elk bin/bash
  4.cd /etc/logstash/conf.d
    vi logstash.conf
    input {
        tcp {
            port => 5044
        }
    }
    output {
      elasticsearch {
        action => "index"
        hosts => ["localhost"]
        index => "jm-log"
      }
    }
  5.docker restart elk
  6.测试http://39.108.236.73:9200
  7.访问http://39.108.236.73:5601/app/kibana
```

Filebeat
 ```bash 
 1.wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.13.3-linux-x86_64.tar.gz
 2.tar -xvf filebeat-7.13.3-linux-x86_64.tar.gz
 3.vi filebeat.yml
    filebeat.inputs:
      - type: log
        paths:
          - /microservices/*/runtime/logs/*.log
        multiline.pattern: '^\[[0-9]{4}-[0-9]{2}-[0-9]{2}'
        multiline.negate: true
        multiline.match: after
        multiline.timeout: 5s
        scan_frequency: 5s
    output:
      # 输出到logstash中,logstash更换为自己的ip
      logstash:
        hosts: ["127.0.0.1:5044"]
 4. ./filebeat-7.13.3-linux-x86_64/filebeat -e -c filebeat.yml 
 ```

Zipkin

 ```bash  
  1.docker run --name zipkin
  -d -p 9411:9411 openzipkin/zipkin
  2.访问 http://127.0.0.1:9411/zipkin/ 
```

DTM

 ```bash  
  1.docker run -itd  --name dtm
  -p 36789:36789 -p 36790:36790  yedf/dtm:1.14
  2.访问http://127.0.0.1:36789
```

项目代码
  ```bash  
 1.docker run --name hyperf
-v /workspace/skeleton:/data/project
-p 9501:9501 -p 9502:9502  -p 9503:9503  -it
--privileged -u root
--entrypoint /bin/sh
hyperf/hyperf:8.0-alpine-v3.15-swoole-v4.8 
2.docker exec -it hyperf /bin/bash
3.cd /data/project/
4.git clone https://gitee.com/ljj96/jin-microservices.git
5.cd jin-microservices/api-gateway/
    composer update
    复制.env.example为.env配置
    php bin/hyperf.php start
6.cd jin-microservices/user_srv/
    composer update
    复制.env.example为.env配置
    php bin/hyperf.php start
7.cd jin-microservices/order_srv/
    composer update
    复制.env.example为.env配置
    php bin/hyperf.php start
``` 

# 使用

* 完整微服务架构

![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/kMfvfSVjP3.png!large)

* JsonRpc调用
  - `GET http://127.0.0.1:9501/User/UserInfo` 通讯单一服务
  - `GET http://127.0.0.1:9501/User/UserBonusList` 通讯单一服务
  - `GET http://127.0.0.1:9501/User/UserStoredList` 通讯单一服务
  - `GET http://127.0.0.1:9501/Order/OrderList` 通讯多个服务
* 统一异常处理

  - 封装AppServiceExceptionHandler.php 统一处理http请求异常
  - 封装RateLimitExceptionHandler.php 统一处理限流异常
  - 封装JsonRpcExceptionHandler.php 统一处理JsonPrc通讯异常
  - 封装DtmExceptionHandler.php 统一处理DTM事务中间件异常

* 服务注册与服务发现

![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/03VknWhiB6.png!large)

* 链接追踪

![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/PaiIwXUVrr.png!large)

* 配置中心

![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/SfiKibJ55r.png!large)

![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/K4Zf5zlBhq.png!large)

* 服务限流

![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/QpZmGG31WD.png!large)

* 服务降级

![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/bpVBwAgOKl.png!large)

* 分布式日志

![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/qFqXMfcYu2.png!large)

* 分布式事务

数据库事务可以确保该事务范围内的所有操作都可以全部成功或者全部失败。但对分布式系统来说，数据的操作来自多个不同的数据库，单个数据库事务的成功或失败不代表整个系统的数据一致性是对的，只能够通过分布式事务来解决。

分布式事务就是指事务的发起者、资源及资源管理器和事务协调者分别位于分布式系统的不同节点之上。行业上常用的有二阶段提交、SAGA、TCC等方案，当了解原理后，你自行用http/tcp也能实现二阶段提交、SAGA、TCC。

下面的接口通过DTM调度实现在一个SAGA案例。

	- `POST http://127.0.0.1:9501/Order/CreateOrder` 分布式事务	
![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/7tiJcnKiXi.png!large)

![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/a5v6AdYVT2.png!large)

![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/fEfisaY9qi.png!large)

# 不足
* 不支持gRpc的服务注册与服务发现
* 配置中心组件只支持config调用，无法做到env的动态写入与框架重启，但可通过k8s实现

