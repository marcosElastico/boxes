FROM centos

LABEL com.elasticbox.id=Magento

ENV ELASTICBOX_URL              https://elasticbox.com
ENV ELASTICBOX_PATH             /opt/ebx
ENV ELASTICBOX_INSTANCE_PATH    /var/elasticbox

WORKDIR ${ELASTICBOX_PATH}

# Install ElasticBox bootstrap
RUN (echo GET /docker | nc beta.elasticbox.com 80 || urlgrabber -o /dev/stdout http://beta.elasticbox.com/docker) | bash

# Create Boxes directory
RUN mkdir -p ${ELASTICBOX_PATH}/boxes

# Add Boxes
ADD [ "./Nginx", "${ELASTICBOX_PATH}/boxes/Nginx" ]
ADD [ "./NFS Client", "${ELASTICBOX_PATH}/boxes/NFS Client" ]
ADD [ "./PHP-FPM", "${ELASTICBOX_PATH}/boxes/PHP-FPM" ]
ADD [ "./Magento", "${ELASTICBOX_PATH}/boxes/Magento" ]

EXPOSE 80

# Setup the start box
RUN elasticbox setup Magento

# Execute install scripts
RUN elasticbox config --input='boxes/Nginx/events/install' --scope='nginx' | bash
RUN elasticbox config --input='boxes/PHP-FPM/events/install' --scope='php' | bash
RUN elasticbox config --input='boxes/NFS Client/events/install' --scope='nfs' | bash
RUN elasticbox config --input='boxes/Magento/events/install' | bash

CMD elasticbox run
