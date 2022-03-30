FROM klovercloud/odoo-base-image:14.0

RUN apt-get -y update && apt-get -y install vim git procps wkhtmltopdf xvfb xauth xfonts-base xfonts-75dpi fontconfig fonts-beng python3 python3-pip build-essential wget python3-dev python3-venv python3-wheel libxslt-dev libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less libpng12-0 libjpeg-dev gdebi nodejs npm

RUN pip3 install -r https://github.com/odoo/odoo/raw/14.0/requirements.txt
RUN pip3 install psycopg2-binary pdfminer.six num2words ofxparse dbfread ebaysdk firebase_admin pyOpenSSL

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
