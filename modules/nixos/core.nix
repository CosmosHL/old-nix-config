{ lib, pkgs, ... }:
{
  # Salli kaupallisia lisenssejä sisältävien pakettien asennus
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    # Sallitaan kehitteillä olevien ominaisuuksien käyttö järjestelmätasolla
    experimental-features = ["nix-command" "flakes"];
    # Optimoi Nix:in pakettien tilankäyttö
    auto-optimise-store = true;
  };

  # Aikavyöhyke
  time.timeZone = "Europe/Helsinki";
  # Konsoli näppäimistöasettelu
  console.keyMap = "fi";
  # Järjestelmän kieliasetukset
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fi_FI.UTF-8";
    LC_MONETARY = "fi_FI.UTF-8";
    LC_MEASUREMENT = "fi_FI.UTF-8";
    LC_NUMERIC = "fi_FI.UTF-8";
    LC_PAPER = "fi_FI.UTF-8";
    LC_TELEPHONE = "fi_FI.UTF-8";
    LC_TIME = "fi_FI.UTF-8";
  };

  # SSH Palvelu
  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = false;
      PermitRootLogin = "no";
      PasswordAuthentication = true;
    };
  };

  # Järjestelmätason paketit
  environment.systemPackages = with pkgs; [
    neovim
    curl
    wget
    git
  ];

  # Järjestelmän oletus tekstieditori
  environment.variables.EDITOR = "nvim";
}