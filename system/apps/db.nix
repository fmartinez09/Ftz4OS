{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    foundationdb
    scylladb
    postgresql
    sqlite
  ];
}
