FROM klovercloud/odoo-base-image:14.0

RUN apt-get -y update && apt-get -y install vim git procps wkhtmltopdf xvfb xauth xfonts-base xfonts-75dpi fontconfig

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
