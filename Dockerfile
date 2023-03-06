FROM theorangeone/website-server

# Download pre-built cyberchef
RUN wget -c https://github.com/gchq/CyberChef/releases/download/v9.55.0/CyberChef_v9.55.0.zip -O - | unzip -d /srv - && mv /srv/CyberChef_*.html /srv/index.html

# Copy some overrides for a more secure environment
COPY ./nginx-extra.conf /etc/nginx/extra.conf
