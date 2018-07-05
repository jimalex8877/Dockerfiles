FROM changmingjiang/openjdk8-jre:latest

LABEL maintainer="changming.jiang<changming.jiang@qq.com>"

RUN set -ex; \
	\
	JENKINS_VERSION=2.121.1; \
	\
	echo "deb http://pkg.jenkins.io/debian-stable binary/" >> /etc/apt/sources.list; \
	\
	wget --quiet -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -; \
	apt-get update && apt-get install -y jenkins="$JENKINS_VERSION" git maven; \
	rm -rf /var/lib/apt/lists/*;

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]