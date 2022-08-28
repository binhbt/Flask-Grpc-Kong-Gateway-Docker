# RUN docker  
docker-compose up --build  
# Register kong service and config route  
bash kong/entrypoint.sh  
# Htpp server run on port 80  
curl http://0.0.0.0/api/v1
See the console log  
# Grpc server run on port 1020 concurrent  
./grpc_cli ls localhost:1020  
./grpc_cli call localhost:1020 Hello/SayHello "name:'Tome'"  

# Grpc-gateway plugin for Kong - A Kong plugin to allow access to a gRPC service via HTTP REST requests and translate requests and responses in a JSON format.   
https://docs.konghq.com/hub/kong-inc/grpc-gateway/  
https://github.com/Kong/kong-plugin-grpc-gateway  

# Access grpc via kong  
curl -XGET localhost/v1/messages/Kong2.0  
