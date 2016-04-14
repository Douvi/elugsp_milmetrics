start: grafana influxdb
stop:
	docker kill $$(docker ps -q)

server:
	mix phoenix.server

grafana:
	cd automation/grafana && \
		docker build -t grafana . && \
		docker run -d -p 3000:3000 -t grafana

influxdb:
	cd automation/influxdb && \
		docker build -t influxdb . && \
		docker run -d -p 8083:8083 -p 8086:8086 -t influxdb
