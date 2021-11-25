FROM archlinux:latest
COPY ./archlinux_setup.sh ./common_archlinux.sh /
RUN bash /archlinux_setup.sh && rm /archlinux_setup.sh /common_archlinux.sh
