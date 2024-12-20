# GPU Management Script

This project provides a simple bash script to manage GPU memory usage by starting and stopping GPU-heavy services. The script also displays the current GPU memory usage.

## Features

- Display GPU memory usage
- Start GPU-heavy services
- Stop GPU-heavy services and clear GPU memory

## Prerequisites

- NVIDIA GPU with `nvidia-smi` installed
- Systemd services for GPU-heavy applications

## Usage

1. Clone the repository:
    ```bash
    git clone <repository_url>
    cd gpu_manage
    ```

2. Make the script executable:
    ```bash
    chmod +x gpu_manage.sh
    ```

3. Run the script as root:
    ```bash
    sudo ./gpu_manage.sh {start|stop}
    ```

## Script Details

- `show_gpu_memory`: Function to display the current GPU memory usage.
- `SERVICES`: Array containing the names of GPU-heavy services to manage.
- `ACTION`: Command-line argument to specify whether to start or stop the services.

### Commands

- `start`: Starts the GPU-heavy services.
- `stop`: Stops the GPU-heavy services and kills remaining GPU processes.

### Example

To start the services:
```bash
sudo ./gpu_manage.sh start
```

To stop the services and clear GPU memory:
```bash
sudo ./gpu_manage.sh stop
```

## License

This project is licensed under the MIT License.