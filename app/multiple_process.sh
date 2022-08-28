#!/bin/bash

# Start the first process
gunicorn -w 4 --bind 0.0.0.0:5000 wsgi &
  
# Start the second process
python grpc_simple.py &
  
# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?