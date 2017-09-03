FROM rust

RUN \
	apt-get update -y

RUN \
	apt-get install -y software-properties-common gcc git curl ca-certificates

RUN \
	add-apt-repository ppa:chris-lea/libsodium

RUN \
	apt-get install -y build-essential libsodium-dev \
		libleveldb-dev pkg-config

RUN \
	git clone https://github.com/exonum/exonum.git /exonum

WORKDIR /exonum

RUN \
	cargo test --manifest-path /exonum/exonum/Cargo.toml

ADD . /cryptocurrency

WORKDIR /cryptocurrency

EXPOSE 8888

EXPOSE 2222

CMD ["cargo", "run"]