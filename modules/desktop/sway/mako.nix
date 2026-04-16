{ ... }:
{
  # Notification daemon
  services.mako = {
    enable = true;
    settings = {
      border-size = 2;
      default-timeout = 10000;
    };
  };
}
