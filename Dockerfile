FROM theorangeone/website-server

# renovate: datasource=github-tags depName=gchq/cyberchef
ENV CYBERCHEF_VERSION=v10.17.0

# Download pre-built cyberchef
RUN wget -c https://github.com/gchq/CyberChef/releases/download/${CYBERCHEF_VERSION}/CyberChef_${CYBERCHEF_VERSION}.zip -O - | unzip -d /srv - && mv /srv/CyberChef_*.html /srv/index.html

# Copy some overrides for a more secure environment
COPY ./nginx-extra.conf /etc/nginx/extra.conf

# Copy in some extra files
COPY ./extra /srv
