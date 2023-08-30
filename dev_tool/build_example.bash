#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
PORT=${1:-/dev/ttyUSB0}
MROS2_DIR=${2:-${SCRIPT_DIR}/../../mros2-esp32}
WORKSPACE=${3:-${SCRIPT_DIR}/../workspace/echoback_string}
TARGET=${4:-esp32}
MONITOR=${5}

if [ ${PORT} == "--help" ]; then
    echo "Usage: ./build_example.bash [PORT] [MROS2_DIR] [WORKSPACE] [TARGET] [MONITOR]"
    echo "PORT: serial port (default: /dev/ttyUSB0)"
    echo "MROS2_DIR: mros2-esp32 directory"
    echo "WORKSPACE: workspace directory"
    echo "TARGET: esp32 target (esp32 or esp32s2, esp32s3, esp32c3...)"
    echo "MONITOR: --monitor or nothing"
    exit 0
fi

echo "====================="
echo "PORT: ${PORT}"
echo "MROS2_DIR: ${MROS2_DIR}"
echo "WORKSPACE: ${WORKSPACE}"
echo "TARGET: ${TARGET}"
echo "MONITOR: ${MONITOR}"
echo "====================="

if [ ! -d ${WORKSPACE} ]; then
    echo "workspace directory not found."
    exit 1
fi
if [ ! -d ${MROS2_DIR} ]; then
    echo "mros2-esp32 directory not found."
    exit 1
fi
if [ ${MONITOR} == "--monitor" ]; then
    docker-compose up --build esp_monitor
    exit 0
fi

rm -rf ${SCRIPT_DIR}/.env
echo "PORT=${PORT}" > ${SCRIPT_DIR}/.env
echo "MROS2_DIR=${MROS2_DIR}" >> ${SCRIPT_DIR}/.env
echo "WORKSPACE=${WORKSPACE}" >> ${SCRIPT_DIR}/.env
echo "TARGET=${TARGET}" >> ${SCRIPT_DIR}/.env

cd ${SCRIPT_DIR}

if [ ! -d ${MROS2_DIR} ]; then
    echo "mros2-esp32 directory not found."
fi

docker-compose up --build mros2_esp32
