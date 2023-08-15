FROM ddeer1109/bwell:certs
ADD create_certificates.sh .
VOLUME work:/work
RUN ls $JAVA_HOME
#CMD ["echo $JAVA_HOME"]
CMD ["bash"]
