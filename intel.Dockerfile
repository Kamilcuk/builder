FROM intel/oneapi-hpckit
ENV DEBIAN_FRONTEND=noninteractive
ENTRYPOINT ["bash", "-c", "source /root/.oneapi_env_vars && \"$@\"", "--"]
CMD ["bash"]
