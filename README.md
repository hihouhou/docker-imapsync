# docker-imapsync
imapsync for docker

##How to run it ?
docker run -it -e 'OPTIONS=--host1 imap-mail.outlook.com --user1 totofrom@toto.com --password1 $pwd1 --host2 mail.toto.com --user2 tototo@toto.com --password2 $pwd2 --folder "Junk" --prefix2 toto_' --name imapsync hihouhou/imapsync:latest
