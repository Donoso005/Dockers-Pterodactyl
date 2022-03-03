FROM        --platform=$TARGETOS/$TARGETARCH mongo:5-focal

LABEL       author="Don_oso005"

ENV         DEBIAN_FRONTEND noninteractive

RUN         apt update -y \
            && apt install -y netcat iproute2 \
            && useradd -d /home/container -m container -s /bin/bash

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./routes.sh /routes.sh
CMD ["/bin/bash", "/entrypoint.sh"]
