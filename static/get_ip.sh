#!/usr/bin/env bash
pattern=${1:-'192.168.56.[0-9]+'}

get_ip () {
  ip a | grep -o -P "${pattern}(?=/)"
}

ip=$(get_ip)
while [ -z "${ip}" ]; do
  ip=$(get_ip)
  sleep 1
done

echo -n ${ip}