{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    openjdk17
    graalvm17
    maven
    bazel
    go
    docker
    docker-compose
    kubectl
    helm
    k3s
    k9s
    httpie
    jq
    grpcurl
  ];
}
