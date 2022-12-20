[English](./README.md) | [中文]

# 介绍

Jin-microservices是基于 php 语言 + hyperf 微服务 框架的完整微服务demo。

github：https://github.com/Double-Jin/jin-microservices

gitee：https://gitee.com/ljj96/jin-microservices

# 关于 JM

作为php、go双修的开发者， go 语言的微服务体系已经基本掌握，go 语言相关的微服务的文章、开源项目在网上搜索一搜一大堆，这让会 go 语言的开发者能容易地上手并实现微服务，毕竟go语言是除java外最合适做微服务的语言这一。

php语言的优势在于web生态，开发的应用绝大多数为单体应用架构。近年来随着基于 swoole 扩展的 hyperf框架的出现，让php也能开发微服务架构，这里要感谢开源工作者。但用 "php + 微服务 "作为关键词时，搜索出来的文章、开源项目都是一些简单的案例，开发者并不能通过这些简单的案例来了解微服务，这让我有了想写本项目的原始动力。

# 前言

JM 是一款基于 php 语言 + hyperf 微服务 框架编写的完整微服务demo，与网上能找到的单一功能点简单实现的文章不同，JM从实际项目需求出发，力求做到git clone 项目下来后对着文件就能帮你构建微服务完整的知识体系，让你实际用hyperf开发微服务项目时能粘贴复制本项目的代码。

微服务架构并不是比单体架构先进的架构，只是在项目体量、项目开发者人数达到一定量级后的一种选择。切勿盲目鼓吹微服务，在团队开发、运维能力不足的情况下强行推进微服务架构恐怕会适得其反。

下面提到的组件并不是微服务架构才能使用，如elk、nacos、dtm这些，在单体应用里面也有合适的场景用到，取其精华来满足业务上的需要。如在生产上用到这些组件最好选择编译安装或购买云服务

## 功能亮点

* 完整微服务架构
* JsonRpc调用
* JWT认证
* 文件上传
* 统一异常处理
* 服务注册与服务发现
* 消息队列
* 链接追踪
* 配置中心
* 服务限流
* 服务降级
* 分布式日志
* 分布式事务

# 准备
微服务是把单体应用进行分拆后的架构，通过引用第三方组件来解决分拆后带来的问题，安装部署这些组件的时候你将会遇到很多奇奇怪怪的问题。为减低难度，本项目大部分组件采用docker来安装，整体流程我已在不同的电脑上验证数遍，即便如此还是会存在如composer、github、http/tcp访问、端口、内存、docker版本等问题，同样的操作换了台电脑就可能出问题，这需要你跟据报错内容查找相关资料自行解决。

- 8核16G电脑
- 熟悉docker
- 了解网络协议
- 基本的运维能力

# 安装

- docker安装
  - [github](https://github.com/Double-Jin/jin-microservices/blob/main/doc/DEPLOY_ONE.md)
  - [gitee](https://gitee.com/ljj96/jin-microservices/blob/main/doc/DEPLOY_ONE.md)
- docker-compose安装
  - [github](https://github.com/Double-Jin/jin-microservices/blob/main/doc/DEPLOY_TWO.md)
  - [gitee](https://gitee.com/ljj96/jin-microservices/blob/main/doc/DEPLOY_TWO.md)

# 使用

* 目录结构
  ```
    |-- api-gateway //网关服务项目代码 
    |-- order-srv //订单服务项目代码
    |-- fIle-srv //文件服务项目代码
    |-- user-srv // 用户服务项目代码
    |-- task-srv // 定时任务、队列消费服务项目代码
    |-- doc // 文档目录
    |-- README.md //英文说明
    |-- README-CN.md //中文说明
  ```

* 完整微服务架构
  ![完整的php微服务案例](https://cdn.learnku.com/uploads/images/202206/15/36324/zfxnraiUJx.png!large)

* JsonRpc调用
  - `GET http://127.0.0.1:9501/User/UserInfo` 通讯单一服务
  - `GET http://127.0.0.1:9501/User/UserBonusList` 通讯单一服务
  - `GET http://127.0.0.1:9501/User/UserStoredList` 通讯单一服务
  - `GET http://127.0.0.1:9501/Order/OrderList` 通讯多个服务

* JWT认证
  - `GET http://127.0.0.1:9501/Auth/Login` 用户登录
  - `GET http://127.0.0.1:9501/Auth/Logout
    Authorization : 	Bearer {{token}}` 用户退出登录


* 文件上传
  - 微服务中rpc是轻量级通信框架，擅长传输字符串。对于文本文件传输不太友好，
  而对于文件如果强行都成String，就会是一堆乱码。因此，大致的解决思路是，不管文件类型，统统转化成二进制，再将二进制进行Base64编码成String，传输编码后的String到RPC服务，RPC服务按照Base64解码还原成二进制，通过二进制构造File对象即可。
  - `POST http://127.0.0.1:9501/File/UploadFile` 文件转为base64字符串通过json-rpc传输
  - `file-srv.app.JsonRpc.FileRpcService.uploadFile` 通过json-rpc接收base64字符串生成文件


* 统一异常处理
  - 封装AppServiceExceptionHandler.php 统一处理http请求异常
  - 封装RateLimitExceptionHandler.php 统一处理限流异常
  - 封装JsonRpcExceptionHandler.php 统一处理JsonPrc通讯异常
  - 封装DtmExceptionHandler.php 统一处理DTM事务中间件异常

* 服务注册与服务发现
  ![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/03VknWhiB6.png!large)

* 消息队列
  - `GET http://127.0.0.1:9501/User/UserRabbitMQ` 调用投递用户消息队列接口
  - `GET http://127.0.0.1:9501/Order/OrderRabbitMQ` 调用投递订单消息队列接口
  ![完整的php微服务案例](https://cdn.learnku.com/uploads/images/202206/15/36324/0BU5P5RHTL.jpeg!large)
  
* 链接追踪
  ![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/PaiIwXUVrr.png!large)

* 配置中心
  ![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/SfiKibJ55r.png!large)
  ![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/K4Zf5zlBhq.png!large)

* 服务限流
  `GET http://127.0.0.1:9501/RateLimit/Test`
  ![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/QpZmGG31WD.png!large)

* 服务降级
  `GET http://127.0.0.1:9501/CircuitBreaker/Test`
  ![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/bpVBwAgOKl.png!large)

* 分布式日志
  
  当系统变为集群后，应用日志在数十台甚至是上百台不同的服务器上，能实现日志的统一查找、分析和归档等功能便可称为分布式日志系统。
  
  生产上方案会有很多，如将日志直接输出来Elasticsearch，如使用云服务商提供的日志收集。本案例采用的是通过filebeat将日志同步到ELK中。
  ![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/qFqXMfcYu2.png!large)


* 分布式事务
  
  数据库事务可以确保该事务范围内的所有操作都可以全部成功或者全部失败。但对分布式系统来说，数据的操作来自多个不同的数据库，单个数据库事务的成功或失败不代表整个系统的数据一致性是对的，只能够通过分布式事务来解决。
  
  分布式事务就是指事务的发起者、资源及资源管理器和事务协调者分别位于分布式系统的不同节点之上。行业上常用的有二阶段提交、SAGA、TCC等方案，当了解原理后，你自行用http/tcp也能实现二阶段提交、SAGA、TCC。
  
  下面的接口通过DTM调度实现在一个SAGA案例。
  `POST http://127.0.0.1:9501/Order/CreateOrder` 分布式事务
  ![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/7tiJcnKiXi.png!large)
  ![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/a5v6AdYVT2.png!large)
  ![完整的php微服务案例](https://cdn.learnku.com/uploads/images/202206/15/36324/txAseIwfVr.png!large)
  
# 不足
* 不支持gRpc的服务注册与服务发现
* 配置中心组件只支持config调用，无法做到env的动态写入与框架重启，但可通过k8s实现


# 感谢
- hyperf：https://hyperf.wiki/2.2/#/README
- dtm：https://en.dtm.pub/
- nacos：https://nacos.io/zh-cn/docs/what-is-nacos.html
- elk：https://www.elastic.co/cn/what-is/elk-stack 