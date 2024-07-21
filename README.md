# Containerized Nginx PHP MySQL

### Prerequisites

- [Docker](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- `build-essential` package (on Debian-based systems)

### Installation

1. **Install Docker and Docker Compose:**

    - Follow the installation instructions for [Docker](https://docs.docker.com/engine/install) and [Docker Compose](https://docs.docker.com/compose/install/) based on your operating system.

2. **Install `build-essential` package:**

    On Debian-based systems (like Ubuntu), you need the `build-essential` package for compiling and building software. This package includes important tools like `gcc`, `g++`, `make`, and others that are often required for building software from source.

    ```sh
    sudo apt install build-essential
    ```

3. **Clone the repository:**

    ```sh
    git clone https://github.com/cdew13/docker-php-mysql-nginx.git
    
4. **Move content to your project directory:**

    ```sh
    cd docker-php-mysql-nginx /
    mv * your-project-dir

5. **Create a `.env` file in docker directory based on `.env.example`:**

    ```sh
    cp .env.example .env
    ```

6. **Configure environment variables in the `.env` file as needed.**

### Usage

#### Available Makefile Commands

You can use the Makefile to manage Docker containers. Here is a list of available commands:

- `make help`: Show a list of available commands.
- `make build`: Build the containers.
- `make up`: Start the containers in detached mode.
- `make start`: Start already existing containers.
- `make down`: Stop and remove the containers.
- `make destroy`: Stop and remove the containers along with their volumes.
- `make stop`: Stop the containers.
- `make restart`: Restart the containers.
- `make logs`: Show logs of all containers.
- `make logs-app`: Show logs of the PHP container.
- `make ps`: Show the status of all containers.
- `make exec-app`: Execute a command in the PHP container.
- `make mysql-dump`: Create a backup of the databases.
- `make mysql-restore`: Restore the databases from a backup.

### Project Structure
 ```sh
.
└── project
    ├── docker
    │   ├── data
    │   │   └── db
    │   │       └──  dumps
    │   ├── etc
    │   │   ├── php
    │   │   │   ├── php.ini
    │   │   │   └── xdebug.ini
    │   │   └──  nginx
    │   │        ├── default.conf
    │   │        └── default.template.conf
    │   ├── docker-compose.yml 
    │   ├── Dockerfile 
    │   └── .env.example 
    └── Makefile
```

