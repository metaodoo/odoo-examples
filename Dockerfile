FROM klovercloud/odoo-base-image:14.0

# replace existing config with your custom config
COPY odoo.conf /etc/odoo/odoo.conf

# replace custom init script
COPY ./kc-init.sh /
RUN chmod +x /kc-init.sh
RUN sed -i 's/\r$//' /kc-init.sh

# copy addons to addons folder
COPY addons/. /mnt/extra-addons/.

USER odoo