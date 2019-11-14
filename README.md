# sentry-docker-compose
Easy to install docker by using docker-compose file

## Getting Started

### Prerequisites
* Unix-like operating system (macOS or Linux)
* Docker and Docker-Compose should be installed
* env/sentry is configured

### Basic Installation

#### via bash
```shell
bash deploy.sh 
```

#### via other
```shell
./deploy.sh
```

#### via setup
> First generate a secret_key.

> Second make sure the env/sentry variables is configured.

> Finally run the rest services.

##### Generate secret_key
```bash
docker-compose run --rm sentry config generate-secret-key
```
##### Configure the env/sentry
```vim
for example:
SENTRY_SECRET_KEY=%#_*3rfly#yd_51r%e6cx)_v2rsk4q+ghq)-@h=fzfxh!ey=hj
```
##### Configure superuser
```bash
docker-compose run --rm sentry sentry upgrade
```
##### Run the rest services
```bash
docker-compose up -d sentry sentry-cron sentry-worker-1
```