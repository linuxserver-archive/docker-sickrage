![http://linuxserver.io](http://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)

The [LinuxServer.io](https://www.linuxserver.io/) team brings you another quality container release featuring auto-update on startup, easy user mapping and community support. Be sure to checkout our [forums](https://forum.linuxserver.io/index.php) or for real-time support our [IRC](https://www.linuxserver.io/index.php/irc/) on freenode at `#linuxserver.io`.

# linuxserver/sickrage

Automatic Video Library Manager for TV Shows. It watches for new episodes of your favorite shows, and when they are posted it does its magic. [Sickrage](https://github.com/SiCKRAGETV/SickRage)

## Usage

```
docker create --name=sickrage -v /etc/localtime:/etc/localtime:ro -v <path to config>:/config -v <path to downloads>:/downloads -v <path to tv-shows>:/tv -e PGID=<gid> -e PUID=<uid>  -p 8081:8081 linuxserver/sickrage
```

**Parameters**

* `-p 8081` - the port(s)
* `-v /etc/localtime` for timesync - *optional*
* `-v /config` - where sickrage should store config files.
* `-v /downloads` - your downloads folder
* `-v /tv` - your tv-shows folder
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation

It is based on phusion-baseimage with ssh removed, for shell access whilst the container is running do `docker exec -it sickrage /bin/bash`.

### User / Group Identifiers

**TL;DR** - The `PGID` and `PUID` values set the user / group you'd like your container to 'run as' to the host OS. This can be a user you've created or even root (not recommended).

Part of what makes our containers work so well is by allowing you to specify your own `PUID` and `PGID`. This avoids nasty permissions errors with relation to data volumes (`-v` flags). When an application is installed on the host OS it is normally added to the common group called users, Docker apps due to the nature of the technology can't be added to this group. So we added this feature to let you easily choose when running your containers.

## Setting up the application 

Web interface is at <your ip>:8081 , set paths for downloads, tv-shows to match docker mappings via the webui.


## Updates

* Upgrade to the latest version simply `docker restart sickrage`.
* To monitor the logs of the container in realtime `docker logs -f sickrage`.



## Versions

+ **20.11.2015:** Updated to new repo, by Sickbeard Team.
+ **15.10.2015:** Initial Release


