# docker安装

Mysql

  ```bash  
  1.安装 - 略
  2.新建order-srv数据库
  3.新建user-srv数据库
```

Redis
 ```bash  
  1.安装 - 略
```

Nacos
 ```bash  
  1.docker run --name nacos-standalone -e MODE=standalone \
  -e JVM_XMS=512m -e JVM_XMN=256m -p 8848:8848 -d
  nacos/nacos-server:v2.1.0
  2.访问http://127.0.0.1:8848/nacos/#/login
  3.用户名密码: nacos/nacos
  4.命名空间->新建命名空间->增加空间 `dev`
  5.配置管理->配置列表->dev->导入配置->/jin-microservices/doc/nacos_config.zip
```

Rabbitmq
 ```bash  
  1.docker run -d  --name rabbit -p 15672:15672 -p 5672:5672 rabbitmq:3.9.2
  2.docker exec -it rabbit /bin/bash
  3.rabbitmq-plugins enable rabbitmq_management
  4.访问http://127.0.0.1:15672 
  5.用户名密码: guest/guest
```

ELK

 ```bash  
  1.vi /etc/sysctl.conf
    #末尾添加一行
    vm.max_map_count=262144
    #查看结果
    sysctl -p
  2.docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 -itd --name elk sebp/elk:7.17.1
  3.docker exec -it elk bin/bash
  4.cd /etc/logstash/conf.d
  5.vim logstash.conf
		  input {
			  beats {
				port => 5044
				codec => plain { charset => "UTF-8" }
			  }
		  }
			# 格式化日志
		  filter {
			  grok {
				  match => [ "message","\[%{TIMESTAMP_ISO8601:logtime}\] %{WORD:env}\.(?<level>[A-Z]{4,5})\: %{GREEDYDATA:msg}}" ]
				  }
		   }
		   output {
				elasticsearch {
					 action => "index"
					 hosts => ["localhost"]
					 index => "jm-log"
				 }
			}
  6.rm 02-beats-input.conf  10-syslog.conf  11-nginx.conf  30-output.conf
  7.docker restart elk
  8.测试http://127.0.0.1:9200
  9.访问http://127.0.0.1:5601/app/kibana
```

Filebeat
 ```bash 
 1.wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.13.3-linux-x86_64.tar.gz
 2.tar -xvf filebeat-7.13.3-linux-x86_64.tar.gz
 3.vi filebeat.yml
    filebeat.inputs:
      - type: log
        paths:
          - /jin-microservices/*/runtime/logs/*.log
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
  1.docker run --name zipkin -d -p 9411:9411 openzipkin/zipkin
  2.访问 http://127.0.0.1:9411/zipkin/ 
```

DTM

 ```bash  
  1.docker run -itd  --name dtm -p 36789:36789 -p 36790:36790  yedf/dtm:1.14
  2.访问http://127.0.0.1:36789
```

项目代码
  ```bash  
 1.docker run --name hyperf \
-v /workspace/skeleton:/data/project \
-p 9501:9501 -p 9502:9502  -p 9503:9503  -it  -p 9507:9507  -it \
--privileged -u root \
--entrypoint /bin/sh \
hyperf/hyperf:8.1-alpine-v3.15-swoole-v5
2.docker exec -it hyperf /bin/bash
3.cd /data/project/
4.git clone https://github.com/Double-Jin/jin-microservices.git
5.cd jin-microservices/api-gateway/
    composer update
    复制.env.example为.env配置
    php bin/hyperf.php start
6.cd jin-microservices/user-srv/
    composer update
    复制.env.example为.env配置
    php bin/hyperf.php migrate
    php bin/hyperf.php db:seed
    php bin/hyperf.php start
7.cd jin-microservices/order-srv/
    composer update
    复制.env.example为.env配置
    php bin/hyperf.php migrate
    php bin/hyperf.php db:seed
    php bin/hyperf.php start
8.cd jin-microservices/task-srv/
    composer update
    复制.env.example为.env配置
    php bin/hyperf.php start
9.cd jin-microservices/file-srv/
    composer update
    复制.env.example为.env配置
    php bin/hyperf.php start
``` 
