# ssh-docker-run

## how to use

this action use ssh to deploy docker container

1. add your server id_rsa.pub to authorized_keys
2. run `cat id_rsa | base64`, copy it to GitHub secret
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
          docker_image_url: 'nginx'
          docker_image_tag: 'latest'
          docker_container_name: 'test_name'
          docker_options: '-itd --rm -p 7000:80 -v /opt:/app/config --name test_name'
```

## args

| arg                   | require | info                                                                       |
|-----------------------|---------|----------------------------------------------------------------------------|
| deploy_token          | true    | server id_rsa base64 string                                                |
| server_host           | true    | server connect host (username@host)                                        |
| docker_host           | true    | docker connect host (ccr.ccs.tencentyun.com)                               |
| docker_username       | true    | docker login username                                                      |
| docker_password       | true    | docker login password                                                      |
| docker_image_url      | true    | docker image url (nginx)                                                   |
| docker_image_tag      | true    | docker image tag (latest)                                                  |
| docker_container_name | true    | docker container name                                                      |
| docker_options        | true    | docker options (-itd --rm -p 7000:80 -v /opt:/app/config --name test_name) |
