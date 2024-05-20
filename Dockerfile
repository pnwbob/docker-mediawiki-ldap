FROM mediawiki:lts

RUN apt-get update \
	&& apt-get install --yes --no-install-recommends libldap2-dev libpq-dev \
	&& docker-php-ext-install ldap pgsql pdo pdo_pgsql \
	&& rm -rf /var/lib/apt/lists

RUN	curl https://extdist.wmflabs.org/dist/extensions/LDAPProvider-REL1_39-c800dd6.tar.gz --output /tmp/ldapprovider.tar.gz \
	&& tar --extract --file=/tmp/ldapprovider.tar.gz --directory=/var/www/html/extensions \
	&& rm -f /tmp/ldapprovider.tar.gz \
	&& chown -R www-data:www-data /var/www/html/extensions/LDAPProvider

RUN	curl https://extdist.wmflabs.org/dist/extensions/LDAPAuthentication2-REL1_39-2ed6e51.tar.gz --output /tmp/LDAPAuthentication2.tar.gz \
	&& tar --extract --file=/tmp/LDAPAuthentication2.tar.gz --directory=/var/www/html/extensions \
	&& rm -f /tmp/LDAPAuthentication2.tar.gz \
	&& chown -R www-data:www-data /var/www/html/extensions/LDAPAuthentication2

RUN	curl https://extdist.wmflabs.org/dist/extensions/PluggableAuth-REL1_39-1884a12.tar.gz --output /tmp/PluggableAuth.tar.gz \
	&& tar --extract --file=/tmp/PluggableAuth.tar.gz --directory=/var/www/html/extensions \
	&& rm -f /tmp/PluggableAuth.tar.gz \
	&& chown -R www-data:www-data /var/www/html/extensions/PluggableAuth

RUN	curl https://extdist.wmflabs.org/dist/extensions/DarkMode-REL1_39-96c9f8b.tar.gz --output /tmp/DarkMode.tar.gz \
	&& tar --extract --file=/tmp/DarkMode.tar.gz --directory=/var/www/html/extensions \
	&& rm -f /tmp/DarkMode.tar.gz \
	&& chown -R www-data:www-data /var/www/html/extensions/DarkMode

