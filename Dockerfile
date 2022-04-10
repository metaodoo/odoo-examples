FROM klovercloud/odoo-base-image:14.0

RUN apt-get -y update && apt-get -y install vim git procps xvfb xauth xfonts-base xfonts-75dpi fontconfig fonts-beng python3 python3-pip openssl build-essential libssl-dev libxrender-dev libfontconfig1-dev libfreetype6-dev wget python3-dev python3-venv python3-wheel libxslt-dev libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less libpng16-16 libjpeg-dev gdebi nodejs npm

RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb -P /tmp
RUN sudo apt -y install /tmp/wkhtmltox_0.12.6-1.focal_amd64.deb

RUN npm install -g less
RUN npm install -g less-plugin-clean-css

RUN usermod -u 1000 odoo
RUN id -u odoo

# replace existing config with your custom config
COPY odoo.conf /etc/odoo/odoo.conf

# replace custom init script
COPY ./kc-init.sh /
RUN chmod +x /kc-init.sh
RUN sed -i 's/\r$//' /kc-init.sh

# copy addons to addons folder
COPY addons/. /mnt/extra-addons/.
COPY custom-addons/. /mnt/custom-addons/.

USER odoo
