{
  description = "Ftz4OS NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
    sops-nix.url = "github:Mic92/sops-nix";
    swww.url = "github:LGFae/swww";

    ags.url = "git+https://github.com/Aylur/ags?rev=60180a184cfb32b61a1d871c058b31a3b9b0743d";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hypr-dynamic-cursors = {
      url = "github:VirtCode/hypr-dynamic-cursors";
      inputs.hyprland.follows = "hyprland";
    };

    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      settings = import ./settings.nix { inherit pkgs inputs; };
      pkgs = import nixpkgs {
        system = settings.system;
        config.allowUnfree = true;
      };
    in
    {
      # Entrypoint para NixOS
      nixosConfigurations = {
        ${settings.hostname} = nixpkgs.lib.nixosSystem {
          modules = [
            inputs.stylix.nixosModules.stylix
            inputs.sops-nix.nixosModules.sops
            (./profiles + "/${settings.profile}/configuration.nix")
          ];
          specialArgs = {
            inherit inputs settings;
          };
        };
      };

      # Entrypoint para Home Manager
      homeConfigurations = {
        ${settings.username} = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${settings.system};
          modules = [
            (./profiles + "/${settings.profile}/home.nix")
            inputs.plasma-manager.homeManagerModules.plasma-manager
            inputs.stylix.homeModules.stylix
            inputs.nixvim.homeManagerModules.nixvim
            inputs.sops-nix.homeManagerModules.sops
          ];
          extraSpecialArgs = {
            inherit inputs settings;
          };
        };
      };

      # DevShell para DB Internals + Java + K8s
      devShells = {
        ${settings.system}.db-internals = import ./shells/db-dev/shell.nix {
          inherit pkgs;
        };
      };
    };
}
