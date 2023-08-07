<div align='center'>
  
# Uptime-Kuma-Service-Push
**A script generator to check system services for Uptime-Kuma**
  
</div>

---

## About 🌟
**Uptime-Kuma-Service-Push** is a bash script made using **[Bashly](https://bashly.dannyb.co/)** that makes scripts to check the status of a service.

All you need is the Uptime-Kuma push URL from a Push Monitor and the name of a service. **Uptime-Kuma-Service-Push** generates the script and saves it to a file that you can run in any way you want!

**Heres the kicker; because it's using the Push Monitor, it can run on any server as long as it has access to the Uptime-Kuma Push URL!**

## Getting started🚀
**I tried to make Uptime-Kuma-Service-Push as easy to use as possible, so here's a short guide to get started!**

The script will do a root user check so make sure to run it as root!

Download the script
```
curl -O https://github.com/Zelaf/uptime-kuma-service-push/releases/latest/download/uptime-kuma-service-push
```
Add execution permissions
```
chmod +x uptime-kuma-service-push
```
Use the install command
```
./uptime-kuma-service-push config install
```
You can now do `uptime-kuma-service-push --help` to get help with generating scripts, adding the monitor script and monitoring services, configure systemd to run the script and you can also check the `config.ini` in the install location to see what options you can change!
## Features📜
### Generate push-scripts that checks if a service is running.
If the service does run it will tell Uptime-Kuma that it's running and if it doesn't it will send the 5 last lines of the log to Uptime-Kuma!

### Monitor
With the monitor feature you can add a script that runs scripts inside of the monitored-scripts folder. You can add and remove already generated scripts from Uptime-Kuma-Service-Push!

### Systemd unit
Uptime-Kuma-Service-Push can automatically make two systemd units, one service and one timer that automatically runs the monitor script!

### Installable
Uptime-Kuma-Service-Push does most of its referencing from the scripts own file path! That includes symlinking to `/usr/local/bin` and generating the files, this means it can be put pretty much run from anywhere! If you want to just give it a try you can easily do so without installing it and run the install command afterwards!

---

## Why:dog:
I wanted a way to get notifications about downed services on my servers while using my favourite status panel Uptime-Kuma! At first, this project started out as a basic script with variables you had to manually edit, but I wanted to practice my bash scripting and saw the potential of even easier configuration. I also wanted the project to potentially grow in features so I looked into how I could make that happen.

I found **[Bashly](https://bashly.dannyb.co/)** shortly thereafter and decided to use that as a basis to get a more "software-like" experience
and to have the ability to expand on the script features and ease of use!

## Special Thanks:gift_heart:
* **[Thomas](https://github.com/thomasdouwes)** 
  - For helping me figuring out bash errors and testing.
* **[CTalvio](https://github.com/CTalvio)**
  - For showing me his own scripts and helping with formatting.
* **[DannyBen](https://github.com/DannyBen)**
  - For rewriting his config.sh library for Bashly to add sections.

**Also thanks to [DannyBen](https://github.com/DannyBen) for [Bashly](https://bashly.dannyb.co/) and [LouisLam](https://github.com/louislam) for [Uptime-Kuma](https://uptime.kuma.pet/)**
