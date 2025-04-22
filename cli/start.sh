#!/bin/bash

function help() {
    echo "Available commands:"
    grep "^function.*#" $0 | sed 's/function //g' | sed 's/() { #/\t/g'
}

function start() { # Start in background
    docker-compose up -d --remove-orphans
}

function startl() { # Start with logs in background
    docker-compose up -d --remove-orphans
    docker-compose logs -f --tail="500"
}

function up() { # Start in foreground
    docker-compose up
}

function startb() { # Start with build
    docker-compose up --build
}

function startbl() { # Start with build and logs
    docker-compose up -d --build
    docker-compose logs -f --tail="100"
}

function pull() { # Pull images
    docker-compose pull
}

function logs() { # Show logs
    docker-compose logs -f --tail="300"
}

function restart() { # Restart
    docker-compose restart
}

function restartl() { # Restart with logs
    docker-compose restart
    docker-compose logs -f --tail="50"
}

function restartrm() { # Restart with remove
    docker-compose stop
    docker-compose rm -f
    docker-compose up -d
}

function stop() { # Stop
    docker-compose stop
}

function stoprm() { # Stop and remove containers
    docker-compose stop
    docker-compose rm -f
}

function down() { # Stop and remove containers
    docker-compose stop
    docker-compose rm -f
}

function rm() { # Remove containers
    docker-compose rm
}

function clean() { # Clean - docker-compose down
    docker-compose down
}

function status() { # Show status
    docker-compose ps
}

function ps() { # Show status
    status
}

function deploy() { # Deploy - pull images, stop and remove containers, start, print logs
    pull
    down
    startl
}

function config() { # Show docker-compose configured with env
    docker-compose config
}

# If no arguments provided, show help
if [ $# -eq 0 ]; then
    help
    exit 1
fi

# Execute the function passed as argument
$1 "${@:2}"