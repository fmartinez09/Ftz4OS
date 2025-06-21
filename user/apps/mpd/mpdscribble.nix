{config, ...}:
{
    services.mpdscribble = {
        enable = true;
        verbose = 3;
        endpoints = {
            "last.fm" = {
                passwordFile = "/run/secrets/lastfm";
                username = "fernando";
            };
            "listenbrainz" = {
                passwordFile = "/run/secrets/listenbrainz";
                username = "serpent1an";
            };
        };
    };
}
