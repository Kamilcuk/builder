FROM intel/oneapi-hpckit
ENTRYPOINT ["bash", "-c", "source /root/.oneapi_env_vars && \"$@\"", "--"]
CMD ["bash"]
