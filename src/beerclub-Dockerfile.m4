include(00-details.m4)
include(01-usebase.m4)

EXPOSE 8080
ENV container docker

RUN /usr/bin/yum makecache && /usr/bin/yum upgrade -y && /usr/bin/yum -y install git sqlite httpd mod_wsgi python2-pip python-devel openldap-devel gcc  iputils iproute && /usr/bin/yum clean all;

# Clone the software
# Install deps.

RUN mkdir -p /var/www/empty
# Check out one revision?
RUN git clone --depth 1 https://github.com/Firstyear/beerclub.git /var/www/its_django

RUN pip install -r /var/www/its_django/requirements.txt

# Change ownership of logs for startup
RUN chown -R apache: /var/log/httpd
RUN chown -R apache: /run/httpd
RUN chown -R apache: /var/www/its_django

COPY beerclub/00-base.conf /etc/httpd/conf.modules.d/00-base.conf
COPY beerclub/10-wsgi.conf /etc/httpd/conf.modules.d/10-wsgi.conf
COPY beerclub/10-beerclub.conf /etc/httpd/conf.d/10-beerclub.conf
COPY beerclub/httpd.conf /etc/httpd/conf/httpd.conf
COPY beerclub/local_settings.py /var/www/its_django/its_django/

# Make a local config?

# Collect static?

# How can we change the ownership of this properly?
RUN mkdir -p /var/www/db/django/ && chown -R apache: /var/www/db/django
`USER' apache
RUN cd /var/www/its_django/ && python manage.py migrate && python manage.py collectstatic --noinput
VOLUME /var/www/db


# Really? -X only starts one worker ....

# How can we run migrations at start up?
CMD ["httpd", "-X"]

