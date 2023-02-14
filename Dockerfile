FROM alpine:3.16

# https://ftp.gnu.org/gnu/bash/?C=M;O=D
ENV _BASH_VERSION 3.0.22

RUN set -eux; \
	\
	apk add --no-cache --virtual .build-deps \
		bison \
		coreutils \
		dpkg-dev dpkg \
		gcc \
		libc-dev \
		make \
		ncurses-dev \
		tar \
	; \
		

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["bash"]
