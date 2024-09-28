ARG GLYR_VERSION="1.0.10"
FROM debian:bookworm-slim AS base
FROM base AS runner

RUN \
	apt-get update && \
	apt-get -y install --no-install-recommends glyrc abcde flac cdparanoia eject && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN adduser cdripper --disabled-password --no-create-home
RUN mkdir /workdir && chown cdripper /workdir
RUN mkdir /workdir/cd && chown cdripper /workdir/cd
COPY ./abcde.conf /workdir/abcde.conf

WORKDIR /workdir

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]

CMD ["/usr/bin/abcde", "-c", "/workdir/abcde.conf"]

