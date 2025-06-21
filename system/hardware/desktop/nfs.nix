{pkgs, ...}:
{
    environment.systemPackages = with pkgs; [ nfs-utils ];
    boot.supportedFilesystems = [ "nfs" ];
    services.nfs = {};
    fileSystems."/home/fernando/Drives/network" = {
        device = "192.168.1.218:/home/fernando/media";
        fsType = "nfs";
    };
}
