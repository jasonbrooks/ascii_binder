FROM centos/ruby-22-centos7

RUN scl enable rh-ruby22 -- gem install ascii_binder
USER root
RUN yum install -y java-1.7.0-openjdk && \
    yum clean all

LABEL url http://www.asciibinder.org \
      summary a documentation system built on Asciidoctor \
      description AsciiBinder is for documenting versioned, interrelated projects. Run this container image from the documentation repository, which is mounted into the container. Note: Generated files will be owned by root. \
      RUN docker run -it --rm \
          -v `pwd`:/docs:z \
          IMAGE

ENV LANG=en_US.UTF-8
WORKDIR /docs
CMD asciibinder package
