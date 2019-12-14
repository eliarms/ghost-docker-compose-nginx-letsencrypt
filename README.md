### This repo automatically installs docker, docker-compose and spin up Ghost CMS with NGINX, MYSQL, phpMyAdmin. It also takes care of the auto-renew of your Let´s Encrypt SSL certificates.

## Installation
 #### 1) Clone the repo 
```sh
git clone https://github.com/eliarms/ghost-docker-compose-nginx-letsencrypt.git
 ```
#### 2) The repo comes with two main branches (master and feature/letsencrypt)

- Master Branch (default branch) : 
  Use this branch if you already have your own certificate and you don’t need a free one from let’s encrypt
```sh 
git checkout master
 ```

-	Feature/letsencrypt : 
 This branch automatically generate a free certificate from let’s encrypt and also take care of the certificate renewal 😊.
```sh  
git checkout feature/letsencrypt
 ```
#### 3) Make a copy of our. env.sample and rename it to .env:
Update all the occurrence of “REPLACEME” with your own value
#### 4) Run the init script

```sh
./init.sh
  ```
#### NB: By default the init.sh script will look for a '.env' file but you can also pass a different environment file as describe below.
  
```sh
./init.sh env.sample
```
