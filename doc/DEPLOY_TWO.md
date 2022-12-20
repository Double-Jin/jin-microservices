# docker-composer安装

docker-compose

```bash  
 1.vi /etc/sysctl.conf
    #末尾添加一行
    vm.max_map_count=262144
    #查看结果
    sysctl -p
 2.修改docker-composer.services.hyperf.volumes目录映射地址
 3.docker-compose up
 4.docker exec -it rabbit /bin/bash
 5.rabbitmq-plugins enable rabbitmq_management
 6.docker exec -it elk bin/bash
 7.cd /etc/logstash/conf.d
 8.vim logstash.conf
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
 9.rm 02-beats-input.conf  10-syslog.conf  11-nginx.conf  30-output.conf
 10.docker restart elk
 11.连接mysql
 12.新建order-srv数据库
 13.新建user-srv数据库
 14.访问http://127.0.0.1:8848/nacos/#/login
 15.用户名密码: nacos/nacos
 16.命名空间->新建命名空间->增加空间 `dev`
 17.配置管理->配置列表->dev->导入配置->/jin-microservices/doc/nacos_config.zip
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

验证
```bash
 1.访问http://127.0.0.1:8848/nacos/#/login 用户名密码: nacos/nacos
 2.访问http://127.0.0.1:15672 用户名密码: guest/guest
 2.访问http://127.0.0.1:9200
 3.访问http://127.0.0.1:5601/app/kibana
 4.访问http://127.0.0.1:9411/zipkin/ 
 5.访问http://127.0.0.1:36789
```

启动服务
```bash
1.docker exec -it hyperf /bin/bash
2.cd /data/project/
3.git clone https://github.com/Double-Jin/jin-microservices.git
4.cd jin-microservices/api-gateway/
    composer update
    复制.env.example为.env配置
    php bin/hyperf.php start
5.cd jin-microservices/user-srv/
    composer update
    复制.env.example为.env配置
    php bin/hyperf.php migrate
    php bin/hyperf.php db:seed
    php bin/hyperf.php start
6.cd jin-microservices/order-srv/
    composer update
    复制.env.example为.env配置
    php bin/hyperf.php migrate
    php bin/hyperf.php db:seed
    php bin/hyperf.php start
7.cd jin-microservices/task-srv/
    composer update
    复制.env.example为.env配置
    php bin/hyperf.php start
8.cd jin-microservices/file-srv/
    composer update
    复制.env.example为.env配置
    php bin/hyperf.php start
```

