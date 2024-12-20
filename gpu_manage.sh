#!/bin/bash

show_gpu_memory() {
    echo "GPU Memory Usage:"
    nvidia-smi --query-gpu=memory.used,memory.total --format=csv
}

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi

ACTION=$1
SERVICES=("comfyui.service" "fooocus.service")

show_gpu_memory

if [[ "$ACTION" == "stop" ]]; then
     echo "Stopping GPU-heavy services..."
     for service in "${SERVICES[@]}"; do
          if systemctl is-active --quiet $service; then
                echo "Stopping $service..."
                systemctl stop $service
          fi
     done
     echo "Killing remaining GPU processes..."
     lsof /dev/nvidia* | awk '{print $2, $1}' | tail -n +2 | sort -u | grep -v "nvtop" | awk '{print $1}' | xargs -r kill -9
     echo "GPU memory cleared."
elif [[ "$ACTION" == "start" ]]; then
     echo "Starting GPU-heavy services..."
     for service in "${SERVICES[@]}"; do
          systemctl start $service
     done
else
     echo "Usage: $0 {start|stop}"
fi

show_gpu_memory
