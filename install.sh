

# 1. install
sudo docker run --detach \
  --hostname gitlab.example.com \
  --publish 8929:8929 --publish 2289:22 \
  --name gitlab \
  --restart always \
  --volume $(pwd)/config:/etc/gitlab:Z \
  --volume $(pwd)/logs:/var/log/gitlab:Z \
  --volume $(pwd)/data:/var/opt/gitlab:Z \
  gitlab/gitlab-ce:latest

# 2. config: You then need to appropriately configure $(pwd)/config/gitlab.rb:

external_url "http://gitlab.example.com:8929"
gitlab_rails['gitlab_shell_ssh_port'] = 2289

# reference: https://docs.gitlab.com/omnibus/docker/#expose-gitlab-on-different-ports