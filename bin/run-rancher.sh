#!/usr/bin/env bash

api_port=8080
api_addr=192.168.56.1
api_url="http://${api_addr}:${api_port}"
docker run --rm --name rancher -d -p ${api_port}:8080 rancher/server:latest
#docker logs -f rancher
until curl -s "${api_url}"; do echo 'Waiting for Rancher to come up...'; sleep 5; done

# TODO: nie dziala
# based on https://github.com/galal-hussein/Rancher-Ansible/blob/master/roles/rancher_reg/tasks/main.yml
project_id=$(curl -s ${api_url}/v1/projects | jq '.data[0].id')
echo PROJECT_ID=${project_id}
token_data="$(curl -s "${api_url}/v1/registrationtokens?projectId=${project_id}" -X POST)"
echo
echo TOKEN_DATA="${token_data}"
