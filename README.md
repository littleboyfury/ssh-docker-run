# ssh-docker-run

## how to use

this action use ssh to deploy docker container

1. add your server id_rsa.pub to authorized_keys
2. run `cat id_rsa | base64`, copy it to github secret
3. create docker repository

```yaml
name: 'Test action job'

on: 'push'

jobs:
  job:
    name: Push action job
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: Push test
        uses: littleboyfury/ssh-docker-run@v1.0.0
        with:
          deploy_token: ${{secrets.DEPLOY_TOKEN}}
          server_host: ${{secrets.SERVER_HOST}}
          docker_host: ${{secrets.HOST}}
          docker_username: ${{secrets.USERNAME}}
          docker_password: ${{secrets.PASSWORD}}
          docker_namespace: ${{secrets.NAMESPACE}}
          docker_repo: ${{secrets.REPO}}
          image_tag: 'latest'
          container_port: '7000:80'
```

## args

| arg              | require | info                                         |
|------------------|---------|----------------------------------------------|
| deploy_token     | true    | server id_rsa base64 string                  |
| server_host      | true    | server connect host (username@host)          |
| docker_host      | true    | docker connect host (ccr.ccs.tencentyun.com) |
| docker_username  | true    | docker login username                        |
| docker_password  | true    | docker login password                        |
| docker_namespace | true    | docker namespace (skyfury)                   |
| docker_repo      | true    | docker repository (test)                     |
| image_tag        | true    | docker image tag (latest)                    |
| container_port   | true    | docker container port(8001:80)               |

docker image name: docker_host/docker_namespace/docker_repo:image_tag  
docker image name example: ccr.ccs.tencentyun.com/skyfury/test:latest
