FROM 	ibmcom/ace

#Move bar file compiled via Jenkinsfile
COPY 	compiled.bar bars/

#Change permissions from copied bar
USER	root
RUN	chown -R aceuser:mqbrkrs bars/

#Deploy compiled bar 
USER	aceuser
RUN  	ls -la bars/ && \
    	 ace_compile_bars.sh
