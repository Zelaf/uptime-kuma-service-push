<div align='center'>
  
# Uptime-Kuma-Service-Push
**A script generator to check system services for Uptime-Kuma**
  
</div>

---

## About 🌟
**Uptime-Kuma-Service-Push** is a bash script made using **[Bashly](https://bashly.dannyb.co/)** that makes scripts to check the status of a service.

All you need is the Uptime-Kuma push URL from a Push Monitor and the name of a service. **Uptime-Kuma-Service-Push** generates the script and saves it to a file that you can run in any way you want!

**Heres the kicker; because it's using the Push Monitor, it can run on any server as long as it has access to the Uptime-Kuma Push URL!**

## Usage📜
I tried to make Uptime-Kuma-Service-Push as easy to use as possible, so here's a short guide to get started!
* Make a Push Monitor in Uptime-Kuma
* Copy the URL of the Push Monitor
* Write in the URL and Service as arguments into the script

**Command:**
```bash
./uptime-kuma-service-push generate docker 'https://example.com/api/push/JSHs372KL8?status=up&msg=OK&ping='
```
Now you have a script in the same directory you ran the command in that you can plug to either cron, systemd, or any other preferred method!

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

**Also thanks to [DannyBen](https://github.com/DannyBen) for [Bashly](https://bashly.dannyb.co/) and [LouisLam](https://github.com/louislam) for [Uptime-Kuma](https://uptime.kuma.pet/)**
