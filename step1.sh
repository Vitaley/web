mkdir web
mkdir web/public
mkdir web/public/img
mkdir web/public/css
mkdir web/public/js
mkdir web/uploads
mkdir web/etc
nano web/etc/nginx.conf

sudo ln -sf /home/box/web/etc/nginx.conf /etc/ngonx/sites-enabled/test
sudo rm -rf /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart
