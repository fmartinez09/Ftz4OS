{ pkgs }:

pkgs.mkShell {
  name = "db-internals-env";
  buildInputs = with pkgs; [
    foundationdb
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
  ];
  shellHook = ''
    echo "✅ Entorno listo: DB Internals + Java + K8s"
  '';
}
