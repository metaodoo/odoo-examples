FROM klovercloud/odoo-base-image:14.0

RUN apt-get -y update
RUN apt-get -y install wkhtmltopdf xvfb xauth xfonts-base xfonts-75dpi fontconfig

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
