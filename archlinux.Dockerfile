FROM archlinux:latest
COPY ./archlinux_setup.sh /setup.sh
RUN /setup.sh && rm /setup.sh
