#!/bin/bash
# simple script to send a dimming pattern to a light connected to leshan
# usage:
#  ./control.sh <deviceid> <leshan server ip>

while true; do
	curl -v -H "Content-Type: application/json" -X PUT -d '{ "id": 5851, "value": '100'}' http://$2:8081/api/clients/$1/3311/0/585
        curl -v -H "Content-Type: text/plain" -X PUT -d "true" http://$2:8081/api/clients/$1/3311/0/5850
	curl -v -H "Content-Type: application/json" -X PUT -d '{ "id": 5851, "value": '100'}' http://$2:8081/api/clients/$1/3311/0/5851
	sleep 0.5
	curl -v -H "Content-Type: application/json" -X PUT -d '{ "id": 5851, "value": '75'}' http://$2:8081/api/clients/$1/3311/0/5851
	sleep 0.5
	curl -v -H "Content-Type: application/json" -X PUT -d '{ "id": 5851, "value": '50'}' http://$2:8081/api/clients/$1/3311/0/5851
	sleep 0.5
	curl -v -H "Content-Type: application/json" -X PUT -d '{ "id": 5851, "value": '25'}' http://$2:8081/api/clients/$1/3311/0/5851
	sleep 0.5
	curl -v -H "Content-Type: text/plain" -X PUT -d "false" http://$2:8081/api/clients/$1/3311/0/5850
	sleep 1
done
