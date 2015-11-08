FROM ubuntu

LABEL com.elasticbox.id=Nginx

ENV ELASTICBOX_URL              https://elasticbox.com
ENV ELASTICBOX_PATH             /opt/ebx
ENV ELASTICBOX_INSTANCE_PATH    /var/elasticbox

WORKDIR ${ELASTICBOX_PATH}

# Install ElasticBox bootstrap
RUN echo GET /docker | nc beta.elasticbox.com 80 | bash

# Create Boxes directory
RUN mkdir -p ${ELASTICBOX_PATH}/boxes

# Add Boxes
ADD [ "./Nginx", "${ELASTICBOX_PATH}/boxes/Nginx" ]


# Setup the start box
RUN elasticbox setup Nginx

# Execute install scripts
RUN elasticbox config --input='boxes/Nginx/events/install' | bash

CMD elasticbox run
