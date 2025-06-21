{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    foundationdb
    sqlite
  ];
}
