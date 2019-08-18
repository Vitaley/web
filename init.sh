#!/bin/bash

# remove old config for nginx
if [ -f /etc/nginx/sites-enabled/default ]; then
  sudo rm /etc/nginx/sites-enabled/default
fi

# make hardlink for nginx config and restart nginx
#sudo unlink /etc/nginx/sites-enabled/default
sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/test
sudo /etc/init.d/nginx restart

# make hrdlink for unicorn config and restart gunicorn
sudo ln -sf /home/box/web/etc/gunicorn.py /etc/gunicorn.d/gunicorn.py
#sudo ln -sf /home/box/web/etc/gunicorn_ask.conf /etc/gunicorn.d/ask
#sudo ln -sf /home/box/web/hello.py /etc/gunicorn.d/hello.py
sudo gunicorn -c /etc/gunicorn.d/gunicorn.py hello:app &
#gunicorn -b 0.0.0.0:8080 hello:app_me&
#sudo /etc/init.d/mysql start
