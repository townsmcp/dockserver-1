#!/usr/bin/with-contenv bash
# shellcheck shell=bash
# Copyright (c) 2020, MrDoob
# All rights reserved.
migrateenv() {
    basefolder="/opt/appdata"
    #bypass the dark them bug
    sed -i "s/organizr-dark/organizr/g" $basefolder/compose/.env

    source $basefolder/compose/.env
    echo -e "##Environment for Docker-Compose

## TRAEFIK
CLOUDFLARE_EMAIL=${CLOUDFLARE_EMAIL:-CF-EMAIL}
CLOUDFLARE_API_KEY=${CLOUDFLARE_API_KEY:-CF-API-KEY}
DOMAIN1_ZONE_ID=${DOMAIN1_ZONE_ID:-CF-ZONE_ID}
DOMAIN=${DOMAIN:-example.com}
CLOUDFLARED_UUID=${CLOUDFLARED_UUID:-TUNNEL_UUID_HERE}

## TRAEFIK-ERROR-PAGES
TEMPLATE_NAME=${TEMPLATE_NAME:-l7-dark}

## APPPART
TZ=${TZ}
ID=${ID:-1000}
DOCKERNETWORK=${DOCKERNETWORK:-proxy}
SERVERIP=${SERVERIP:-SERVERIP_ID}
APPFOLDER=${APPFOLDER:-/opt/appdata}
RESTARTAPP=${RESTARTAPP:-unless-stopped}
UMASK=${UMASK:-022}
LOCALTIME=${LOCALTIME:-/etc/localtime}
TP_HOTIO=${TP_HOTIO:-true}
PLEX_CLAIM=${PLEX_CLAIM:-PLEX_CLAIM_ID}

## DOCKERSECURITY
NS1=${NS1:-1.1.1.1}
NS2=${NS2:-8.8.8.8}
PORTBLOCK=${PORTBLOCK:-127.0.0.1}
SOCKET=${SOCKET:-/var/run/docker.sock}
SECURITYOPS=${SECURITYOPS:-no-new-privileges}
SECURITYOPSSET=${SECURITYOPSSET:-true}

## rutorrent
RT_DHT_PORT=${RT_DHT_PORT:-6881}
XMLRPC_PORT=${XMLRPC_PORT:-8000}
RUTORRENT_PORT=${RUTORRENT_PORT:-8080}
WEBDAV_PORT=${WEBDAV_PORT:-9000}
RT_INC_PORT=${RT_INC_PORT:-50000}
RU_LOCALE=${RU_LOCALE:-UTF8}

### DONT CHANGE THIS ABOVE ITS AUTOGENERATED ###

##CUSTOMEVARIABLES

## KASM Workspace Variables
VNC_PW=${VNC_PW:-passwordbasic}
VNC_RESOLUTION=${VNC_RESOLUTION:-1920x1080}

## MediaServer
PLEXIMAGE=${PLEXIMAGE:-ghcr.io/dockserver/docker-plex:latest}
PLEXTHEME=${PLEXTHEME:-organizr}
PLEXADDON=${PLEXADDON:-overseerr-side-menu}
PLEXVERSION=${PLEXVERSION:-latest}
EMBYIMAGE=${EMBYIMAGE:-ghcr.io/dockserver/docker-emby:latest}
EMBYTHEME=${EMBYTHEME:-organizr}
JELLYFINIMAGE=${JELLYFINIMAGE:-ghcr.io/dockserver/docker-jellyfin:latest}
JELLYFINTHEME=${JELLYFINTHEME:-organizr}

## MediaManager
FENRUSIMAGE=${FENRUSIMAGE:-ghcr.io/dockserver/docker-fenrus:latest}
BAZARRIMAGE=${BAZARRIMAGE:-ghcr.io/dockserver/docker-bazarr:latest}
BAZARRTHEME=${BAZARRTHEME:-organizr}
BAZARR4KIMAGE=${BAZARR4KIMAGE:-ghcr.io/dockserver/docker-bazarr:latest}
BAZARR4KTHEME=${BAZARR4KTHEME:-organizr}
CALIBREIMAGE=${CALIBREIMAGE:-ghcr.io/linuxserver/calibre-web}
CALIBRETHEME=${CALIBRETHEME:-organizr}
RADARRIMAGE=${RADARRIMAGE:-ghcr.io/dockserver/docker-radarr:latest}
RADARRTHEME=${RADARRTHEME:-organizr}
RADARR4KIMAGE=${RADARR4KIMAGE:-ghcr.io/dockserver/docker-radarr:latest}
RADARR4KTHEME=${RADARR4KTHEME:-organizr}
RADARRHDRIMAGE=${RADARRHDRIMAGE:-ghcr.io/dockserver/docker-radarr:latest}
RADARRHDRTHEME=${RADARRHDRTHEME:-organizr}
READARRIMAGE=${READARRIMAGE:-ghcr.io/dockserver/docker-readarr:latest}
READARRTHEME=${READARRTHEME:-organizr}
PROWLARRIMAGE=${PROWLARRIMAGE:-ghcr.io/dockserver/docker-prowlarr:latest}
PROWLARRTHEME=${PROWLARRTHEME:-organizr}
PROWLARR4KIMAGE=${PROWLARR4KIMAGE:-ghcr.io/dockserver/docker-prowlarr:latest}
PROWLARR4KTHEME=${PROWLARR4KTHEME:-organizr}
PROWLARRHDRIMAGE=${PROWLARRHDRIMAGE:-ghcr.io/dockserver/docker-prowlarr:latest}
PROWLARRHDRTHEME=${PROWLARRHDRTHEME:-organizr}
SONARRIMAGE=${SONARRIMAGE:-ghcr.io/dockserver/docker-sonarr:latest}
SONARRTHEME=${SONARRTHEME:-organizr}
SONARR4KIMAGE=${SONARR4KIMAGE:-ghcr.io/dockserver/docker-sonarr:latest}
SONARR4KTHEME=${SONARR4KTHEME:-organizr}
SONARRHDRIMAGE=${SONARRHDRIMAGE:-ghcr.io/dockserver/docker-sonarr:latest}
SONARRHDRTHEME=${SONARRHDRTHEME:-organizr}
TAUTULLIIMAGE=${TAUTULLIIMAGE:-ghcr.io/dockserver/docker-tautulli:latest}
TAUTULLITHEME=${TAUTULLITHEME:-organizr}
TAUTULLMULTIIMAGE=${TAUTULLMULTIIMAGE:-ghcr.io/dockserver/docker-multitautulli:latest}
TAUTULLIMULTITHEME=${TAUTULLIMULTITHEME:-organizr}
LIDARRIMAGE=${LIDARRIMAGE:-ghcr.io/dockserver/docker-lidarr:latest}
LIDARRTHEME=${LIDARRTHEME:-organizr}
LAZYLIBRARIANIMAGE=${LAZYLIBRARIANIMAGE:-ghcr.io/linuxserver/lazylibrarian:latest}
LAZYLIBRARIANTHEME=${LAZYLIBRARIANTHEME:-organizr}
KOMGAIMAGE=${KOMGAIMAGE:-gotson/komga}

## DownloadClients
DELUGEIMAGE=${DELUGEIMAGE:-ghcr.io/dockserver/docker-deluge:latest}
DELUGETHEME=${DELUGETHEME:-organizr}
JACKETTIMAGE=${JACKETTIMAGE:-ghcr.io/dockserver/docker-jackett:latest}
JACKETTTHEME=${JACKETTTHEME:-organizr}
NZBGETIMAGE=${NZBGETIMAGE:-ghcr.io/dockserver/docker-nzbget:latest}
NZBGETTHEME=${NZBGETTHEME:-organizr}
SABNZBDIMAGE=${SABNZBDIMAGE:-ghcr.io/dockserver/docker-sabnzbd:latest}
SABNZBDTHEME=${SABNZBDTHEME:-organizr}
QBITORRENTIMAGE=${QBITORRENTIMAGE:-ghcr.io/dockserver/docker-qbittorrent:latest}
QBITORRENTTHEME=${QBITORRENTTHEME:-organizr}


### APP CUSTOMEVARIABLES

## Komga
KOMGA_SERVER_PORT=${KOMGA_SERVER_PORT:-8088}

## gluetun
GLUETUN_VPN_SERVICE_PROVIDER=${GLUETUN_VPN_SERVICE_PROVIDER:-VPNSP}
GLUETUN_VPN_TYPE=${GLUETUN_VPN_TYPE:-openvpn}
GLUETUN_OPEN_VPN_USER=${GLUETUN_OPEN_VPN_USER:-OPENVPNUSER}
GLUETUN_OPEN_VPN_PASSWORD=${GLUETUN_OPEN_VPN_PASSWORD:-OPENVPNPASSWORD}
GLUETUN_VPN_REGION=${GLUETUN_VPN_REGION:-VPNREGION}

## Watchtower
WATCHTOWER_CLEANUP=${WATCHTOWER_CLEANUP:-true}
WATCHTOWER_REMOVE_VOLUMES=${WATCHTOWER_REMOVE_VOLUMES:-true}
WATCHTOWER_INCLUDE_STOPPED=${WATCHTOWER_INCLUDE_STOPPED:-false}
WATCHTOWER_NO_STARTUP_MESSAGE=${WATCHTOWER_NO_STARTUP_MESSAGE:-true}
WATCHTOWER_POLL_INTERVAL=${WATCHTOWER_POLL_INTERVAL:-7200}
WATCHTOWER_LABEL_ENABLE=${WATCHTOWER_LABEL_ENABLE:-true}
WATCHTOWER_ROLLING_RESTART=${WATCHTOWER_ROLLING_RESTART:-false}
WATCHTOWER_TIMEOUT=${WATCHTOWER_TIMEOUT:-180s}

## Webtop
WEBTOP_IMAGE=${WEBTOP_IMAGE:-ghcr.io/linuxserver/webtop:ubuntu-xfce}
WEBTOP_SHM_SIZE=${WEBTOP_SHM_SIZE:-1gb}

## APIs
IMDBAPI=${IMDBAPI:-YOUR_IMDB_API}
TVDBAPI=${TVDBAPI:-YOUR_TVDB_API}
TMDBAPI=${TMDBAPI:-YOUR_TMDB_API}

## Scrutiny
SCRUTINY_DEV1=${SCRUTINY_DEV1:-/dev/sda}
SCRUTINY_DEV2=${SCRUTINY_DEV2:-/dev/sdb}

## plex-meta-manager
PMM_TIME=${PMM_TIME:-06:00}
PMM_COLLECTIONS_ONLY=${PMM_COLLECTIONS_ONLY:-false}
PMM_LIBRARIES_ONLY=${PMM_LIBRARIES_ONLY:-false}
PMM_NO_MISSING=${PMM_NO_MISSING:-false}

## Pihole
PIHOLEIMAGE=${PIHOLEIMAGE:-pihole/pihole}
PIHOLEWEBPASSWORD=${PIHOLEWEBPASSWORD:-passwordbasic}
PIHOLEDNSSEC=${PIHOLEDNSSEC:-false}

## Krusader
KRUSADER_PASSWORD=${KRUSADER_PASSWORD:-passwordbasic}
KRUSADER_WEBPAGE_TITLE=${KRUSADER_WEBPAGE_TITLE:-Tower}

## plex-update-tool
RUN_EVERY_N_HOURS=${RUN_EVERY_N_HOURS:-12}

## Code-Server
PASSWORD=${PASSWORD:-passwordbasic}

## joplin-server
POSTGRES_PASSWORD=${POSTGRES_PASSWORD:-joplinpw}
POSTGRES_USER=${POSTGRES_USER:-joplin}
POSTGRES_DB=${POSTGRES_DB:-joplin_db}

## koel
MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-koelrootpw}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-koelpw}
MYSQL_USER=${MYSQL_USER:-koel}
MYSQL_DATABASE=${MYSQL_DATABASE:-koel_db}

## ferdi
FERDI_REGISTRATION=${FERDI_REGISTRATION:-true}
FERDI_CREATION=${FERDI_CREATION:-false}
FERDI_DASHBOARD=${FERDI_DASHBOARD:-true}

## MariaDB
MARIADB_ROOT_PASSWORD=${MARIADB_ROOT_PASSWORD:-rootpw}

## AMD
AMD_MBRAINZMIRROR=${AMD_MBRAINZMIRROR:-https://musicbrainz.org/}
AMD_LidarrUrl=${AMD_LidarrUrl:-http://lidarr:8686}
AMD_LidarrAPIkey=${AMD_LidarrAPIkey:-123456789}
AMD_ARL_TOKEN=${AMD_ARL_TOKEN:-123456789}
AMD_PLEXLIBRARYNAME=${AMD_PLEXLIBRARYNAME:-Music}
AMD_PLEXURL=${AMD_PLEXURL:-http://plex:32400}
AMD_PLEXTOKEN=${AMD_PLEXTOKEN:-123456789}

## WG-Manager
WGADMIN_USERNAME=${WGADMIN_USERNAME:-admin}
WGADMIN_PASSWORD=${WGADMIN_PASSWORD:-admin}

## Wordpress
WORDPRESS_MARIADB_PASSWORD=${WORDPRESS_MARIADB_ROOT_PASSWORD:-wordpressrootpw}
WORDPRESS_MARIADB_PASSWORD=${WORDPRESS_MARIADB_PASSWORD:-wordpresspw}
WORDPRESS_MARIADB_USER=${WORDPRESS_MARIADB_USER:-wordpress}
WORDPRESS_MARIADB_DATABASE=${WORDPRESS_MARIADB_DATABASE:-wordpress_db}

## flaresolverr
FLARE_LOG_LEVEL=${FLARE_LOG_LEVEL:-info}
FLARE_LOG_HTML=${FLARE_LOG_HTML:-false}
FLARE_CAPTCHA_SOLVER=${FLARE_CAPTCHA_SOLVER:-none}

## davos
DAVOS_PASSWORD=${DAVOS_PASSWORD:-passwordbasic}

##EOF" >$basefolder/compose/.env
}

migrateenv
#E-o-F#
