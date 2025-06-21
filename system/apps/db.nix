{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    foundationdb
    postgresql
    sqlite
  ];
}
