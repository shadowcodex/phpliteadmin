[![Discord](https://img.shields.io/discord/630805507782868992.svg?label=&logo=discord&logoColor=ffffff&color=7389D8&labelColor=6A7EC2)](https://discord.gg/GghbTQA)

# Dockerized phpLiteAdmin
This is a Dockerized flavor of phpLiteAdmin 1.9.8.

## What is phpLiteAdmin?
phpLiteAdmin is a web-based SQLite database admin tool written in PHP with support for SQLite3 and SQLite2. Following in the spirit of the flat-file system used by SQLite, phpLiteAdmin consists of a single source file, `phpliteadmin.php`, that after being deployed with the Docker container, is visited in a browser.

### phpLiteAdmin Links
* Website: http://www.phpliteadmin.org/
* Bitbucket: https://bitbucket.org/phpliteadmin/public/
* Demo - A live demo of phpLiteAdmin can be found here: http://demo.phpliteadmin.org/

## Setup
1. Open `phpliteadmin.config.php` in a text editor.
2. Modify the `$password` variable to be the password you want for gaining access to the phpLiteAdmin tool. Default is nothing so autologin. (super unsecure)
3. Run it using the steps below. 
4. Profit.

## Requirements

- Docker - Get it at https://docs.docker.com/install/

## Run
simply run:

```
chmod +x go.sh
./go.sh /path/to/db/directory
```

Where `/path/to/db/directory` is to the **DIRECTORY** that contains your db and not a path to the db itself. The go.sh script will handle building the docker container and launching it as a daemon.

Access the admin page at http://localhost:2015/phpliteadmin.php

**OR**

Replace the `/path/to/db/directory` below with the actual path where your db is. 
```
docker run -it --rm -p 2015:2015 -v /path/to/db/directory:/db --name websql shadowcodex/phpliteadmin
```

Access the admin page at http://localhost:2015/phpliteadmin.php

## Advanced Configuration
### PHPLiteAdmin
You can update the `phpliteadmin.config.php` file to contain your config setup. For more info check out the [phpliteadmin repo](https://bitbucket.org/phpliteadmin/public/wiki/Configuration)

### Caddyfile
Port number, IP and other items can be set in the Caddyfile. See instructions on the [Caddy website](https://caddyserver.com/docs/caddyfile).

### Let's Encrypt Auto SSL
See the Docker hub [abiosoft/caddy](https://hub.docker.com/r/abiosoft/caddy/) page.
