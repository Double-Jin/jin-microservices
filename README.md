English | [中文](./README-CN.md)

# Introduction

Jin microservices is a complete microservice demo based on PHP language + hyperf microservices framework

github：https://github.com/Double-Jin/jin-microservices

gitee：https://gitee.com/ljj96/jin-microservices

# About JM

As a developer of both php and go, the microservice system of the go language has been basically mastered. There are a lot of articles and open source projects related to the go language on the Internet, which makes it easy for developers who know the go language Get started and implement microservices. After all, go language is the most suitable language for microservices other than java.

The advantage of the php language lies in the web ecosystem, and most of the applications developed are monolithic application architectures. In recent years, with the emergence of hyperf framework based on swoole extension, php can also develop microservice architecture, thanks to open source workers. However, when using "php + microservices" as the keyword, the articles and open source projects searched are simple cases. Developers cannot understand microservices through these simple cases, which makes me want to write this project. raw power.

# Foreword

JM is a complete microservice demo written based on php language + hyperf microservice framework. Unlike articles that can be found on the Internet with simple implementation of a single function point, JM starts from the actual project requirements and strives to achieve the git clone project. The file can help you build a complete knowledge system for microservices, so that you can paste and copy the code of this project when you actually use hyperf to develop a microservice project.

The microservice architecture is not an architecture that is more advanced than the monolithic architecture, but a choice after the project volume and the number of project developers reach a certain order of magnitude. Do not blindly advocate microservices. Forcibly promoting the microservice architecture when the team's development and operation and maintenance capabilities are insufficient may be counterproductive.

The components mentioned below are not only used in microservice architecture, such as elk, nacos, and dtm. They are also used in suitable scenarios in monolithic applications, and the essence of them can be used to meet business needs. If these components are used in production, it is best to choose to compile and install or purchase cloud services

## Feature

* Complete microservice architecture
* JsonRpc call
* Jwt authority authentication
* Upload the file
* Unified exception handling
* Service Registration and Service Discovery
* Message queue
* Link tracking
* Configuration Center
* Service current limit
* Service downgrade
* Distributed log
* Distributed transaction

# Prepare
Microservices are an architecture that splits a monolithic application. By using third-party components to solve the problems caused by the split, you will encounter many strange problems when installing and deploying these components. In order to reduce the difficulty, most of the components of this project are installed by docker. I have verified the overall process several times on different computers. Even so, there are still problems such as composer, github, http/tcp access, ports, memory, docker version, etc. , the same operation may cause problems if you change the computer, which requires you to find relevant information according to the content of the error to solve it yourself.

- 8 core 16G computer
- familiar with docker
- Learn about network protocols
- Basic operation and maintenance capabilities

# Install

- docker install
  - [github](https://github.com/Double-Jin/jin-microservices/blob/main/doc/DEPLOY_ONE.md)
  - [gitee](https://gitee.com/ljj96/jin-microservices/blob/main/doc/DEPLOY_ONE.md)
- docker-compose install
  - [github](https://github.com/Double-Jin/jin-microservices/blob/main/doc/DEPLOY_TWO.md)
  - [gitee](https://gitee.com/ljj96/jin-microservices/blob/main/doc/DEPLOY_TWO.md)

# Use

* Directory Structure
  ```
    |-- api-gateway //Gateway service project code 
    |-- order-srv //Order service project code
    |-- user-srv // User service project code
    |-- task-srv // Timed task and queue service project code
    |-- doc // Documentation directory
    |-- README.md //English description
    |-- README-CN.md //Chinese description
  ```

* Complete microservice architecture
  ![完整的php微服务案例](https://cdn.learnku.com/uploads/images/202206/15/36324/zfxnraiUJx.png!large)

* JsonRpc call
  - `GET http://127.0.0.1:9501/User/UserInfo` Communication single service
  - `GET http://127.0.0.1:9501/User/UserBonusList` Communication single service
  - `GET http://127.0.0.1:9501/User/UserStoredList` Communication single service
  - `GET http://127.0.0.1:9501/Order/OrderList` Communication multiple services

* Jwt authority authentication
  - `GET http://127.0.0.1:9501/Auth/Login` User login
  - `GET http://127.0.0.1:9501/Auth/Logout
    Authorization : 	Bearer {{token}}` User logged out


* Upload the file
  - RPC in microservices is a lightweight communication framework that is good at transporting strings. Not very friendly for text file transfers,
    And for the file if it is forced into String, it will be a bunch of garbled characters. Therefore, the general solution idea is that regardless of the file type, 
  - all are converted into binary, and then the binary is Base64 encoded into String, and the encoded String is transferred to the background, and the background is restored to binary according to Base64 decoding, and the File object can be constructed through binary.
  - `POST http://127.0.0.1:9501/File/UploadFile` The file is converted to a base64 string and transferred via json-rpc
  - `file-srv.app.JsonRpc.FileRpcService.uploadFile` Generate a file by receiving a base64 string via json-rpc


* Unified exception handling
  - Encapsulate AppServiceExceptionHandler.php http request exceptions
  - Encapsulate RateLimitExceptionHandler.php current limiting exceptions
  - Encapsulate JsonRpcExceptionHandler.php JsonPrc exceptions
  - Encapsulate DtmExceptionHandler.php DTM Distributed transaction exceptions

* Service Registration and Service Discovery
  ![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/03VknWhiB6.png!large)

* Message queue
  - `GET http://127.0.0.1:9501/User/UserRabbitMQ` Call the delivery user message queue interface
  - `GET http://127.0.0.1:9501/Order/OrderRabbitMQ` Call the delivery order message queue interface
  ![完整的php微服务案例](https://cdn.learnku.com/uploads/images/202206/15/36324/0BU5P5RHTL.jpeg!large)
  
* Link tracking
  ![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/PaiIwXUVrr.png!large)

* Configuration Center
  ![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/SfiKibJ55r.png!large)
  ![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/K4Zf5zlBhq.png!large)

* Service current limit
  `GET http://127.0.0.1:9501/RateLimit/Test`
  ![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/QpZmGG31WD.png!large)

* Service downgrade
  `GET http://127.0.0.1:9501/CircuitBreaker/Test`
  ![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/bpVBwAgOKl.png!large)

* Distributed log

  When the system becomes a cluster, the application logs on dozens or even hundreds of different servers can realize the functions of unified search, analysis and archiving of logs, which can be called a distributed log system.

  There are many solutions in production, such as outputting logs directly to Elasticsearch, such as using log collection provided by cloud service providers. In this case, the log is synchronized to ELK through filebeat.
  ![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/qFqXMfcYu2.png!large)


* Distributed transaction

  A database transaction ensures that all operations within the scope of the transaction can either succeed or fail. But for distributed systems, data operations come from multiple different databases, and the success or failure of a single database transaction does not mean that the data consistency of the entire system is correct, and can only be resolved through distributed transactions.

  Distributed transaction means that the initiator, resource and resource manager and transaction coordinator of the transaction are located on different nodes of the distributed system. Two-phase submission, SAGA, TCC and other schemes are commonly used in the industry. After understanding the principle, you can also use http/tcp to achieve two-phase submission, SAGA, and TCC.

  The following interface is implemented in a SAGA case via DTM scheduling.
  
  `POST http://127.0.0.1:9501/Order/CreateOrder` Distributed transaction
  ![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/7tiJcnKiXi.png!large)
  ![带你走进微服务](https://cdn.learnku.com/uploads/images/202205/31/36324/a5v6AdYVT2.png!large)
  ![完整的php微服务案例](https://cdn.learnku.com/uploads/images/202206/15/36324/txAseIwfVr.png!large)
  
# Question
* Service registration and service discovery without gRpc support
* The configuration center component only supports config calls, and cannot do dynamic writing of env and framework restarts, but it can be achieved through k8s

# Thank
- hyperf：https://hyperf.wiki/2.2/#/README
- dtm：https://en.dtm.pub/
- nacos：https://nacos.io/zh-cn/docs/what-is-nacos.html
- elk：https://www.elastic.co/cn/what-is/elk-stack 