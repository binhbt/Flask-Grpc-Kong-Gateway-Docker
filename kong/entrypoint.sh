#!/bin/bash
# set -e
# apt-get update && apt-get install -y \
# curl
# sleep 20

####################################################################################################
# no-auth.com
####################################################################################################
BASE_URL=http://localhost
# Register rest service API
curl -i -X POST \
  --url $BASE_URL:8001/services/ \
  --data 'name=flask-service' \
  --data 'host=flask' \
  --data 'port=5000'


#Create public route for rest api
curl -i -X POST \
  --url $BASE_URL:8001/services/flask-service/routes \
  --data 'paths[]=/api/v1' \
  --data 'name=flask-route' \
  --data 'strip_path=false'

# Register rest service API
curl -i -X POST \
  --url $BASE_URL:8001/services/ \
  --data 'name=grpc-service' \
  --data 'host=flask' \
  --data 'protocol=grpc' \
  --data 'port=1020' \

#Create public http route for grpc api
curl -i -X POST \
  --url $BASE_URL:8001/services/grpc-service/routes \
  --data 'paths[]=/v1/messages/' \
  --data 'name=grpc-route' \
  --data 'strip_path=false'

#Install grpc-gateway plugin
curl -X POST $BASE_URL:8001/routes/grpc-route/plugins \
  --data name=grpc-gateway \
  --data 'config.proto=/etc/kong/protos/hello.proto'