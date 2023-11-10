#!/bin/bash

#
#
# My ngrok startup script 
# Requirements:
# - Install ngrok command (https://ngrok.com/)
# - Configure variable NGROK_CMD 
#
# From https://github.com/ktxo/my-linux-stuff
#


PORT=6767
USER=""
PASS=""
AUTH=""
PROTOCOL="http"
NGROK_CMD="/sw/ngrok"

usage() { 
    if [ -f "${NGROK_CMD}" ];then
        NGROK_CMD_=${NGROK_CMD}
    else
        NGROK_CMD_="Missing, please install and configure NGROK_CMD var"
    fi
    echo "NAME"
    echo " Wrapper for ngrok command (https://ngrok.com/)"
    echo ""
    echo " ngrok command=${NGROK_CMD_}"
    echo ""
    echo "USAGE"
    echo " run_ngrok.sh [-P port_number] [-u user -p pass]  [-c http|tcp]" 1>&2
    echo ""
    echo "EXAMPLES"
    echo " run_ngrok.sh -P 8989                      # expose HTTP 8989"
    echo " run_ngrok.sh -P 8989 -u admin -p passw0rd # expose HTTP 8989 with basic auth admin:passw0rd" 
    echo ""
    exit 1 
}

while getopts ":P:u:p:c:" o; do
    case "${o}" in
        P)
            PORT=${OPTARG}
            ;;
        u)
            USER=${OPTARG}
            ;;
        p)
            PASS=${OPTARG}
			;;
        c)
            PROTOCOL=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))


[ -z "${PORT}" ] && usage 

[ -n "${USER}" ] &&  AUTH="${USER}:${PASS}"


echo "Using PORT=${PORT} AUTH=${AUTH}"
if [ -z "${AUTH}" ]
then
	${NGROK_CMD} $PROTOCOL $PORT
else
	${NGROK_CMD} $PROTOCOL $PORT --basic-auth=$AUTH

fi