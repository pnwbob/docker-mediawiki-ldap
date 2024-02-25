FROM mediawiki:1.39.4

RUN apt-get update \
	&& apt-get install --yes --no-install-recommends libldap2-dev libpq-dev \
	&& docker-php-ext-install ldap pgsql pdo pdo_pgsql \
	&& rm -rf /var/lib/apt/lists

RUN	curl https://extdist.wmflabs.org/dist/extensions/LDAPProvider-REL1_39-740f097.tar.gz --output /tmp/ldapprovider.tar.gz \
	&& tar --extract --file=/tmp/ldapprovider.tar.gz --directory=/var/www/html/extensions \
	&& rm -f /tmp/ldapprovider.tar.gz

RUN	curl https://extdist.wmflabs.org/dist/extensions/LDAPAuthentication2-REL1_39-2d399b4.tar.gz --output /tmp/LDAPAuthentication2.tar.gz \
	&& tar --extract --file=/tmp/LDAPAuthentication2.tar.gz --directory=/var/www/html/extensions \
	&& rm -f /tmp/LDAPAuthentication2.tar.gz

RUN	curl https://extdist.wmflabs.org/dist/extensions/PluggableAuth-REL1_39-0963667.tar.gz --output /tmp/PluggableAuth.tar.gz \
	&& tar --extract --file=/tmp/PluggableAuth.tar.gz --directory=/var/www/html/extensions \
	&& rm -f /tmp/PluggableAuth.tar.gz
