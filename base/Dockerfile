FROM ubuntu:18.04
MAINTAINER Brian Myers

SHELL ["/bin/bash", "-c"]
RUN set -eux; \
    apt-get update; \
    apt-get upgrade -y; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        dirmngr \
        locales \
        git \
        gnupg \
        netbase \
        sudo \
        wget \
        \
        autoconf \
		automake \
		bzip2 \
        clang \
		dpkg-dev \
		file \
		g++ \
		gcc \
		imagemagick \
		libbz2-dev \
		libc6-dev \
		libcurl4-openssl-dev \
		libdb-dev \
		libevent-dev \
		libffi-dev \
		libgdbm-dev \
		libglib2.0-dev \
		libgmp-dev \
		libjpeg-dev \
		libkrb5-dev \
		liblzma-dev \
		libmagickcore-dev \
		libmagickwand-dev \
		libmaxminddb-dev \
		libncurses5-dev \
		libncursesw5-dev \
		libpng-dev \
		libpq-dev \
		libreadline-dev \
		libsqlite3-dev \
		libssl-dev \
		libtool \
		libwebp-dev \
		libxml2-dev \
		libxslt-dev \
		libyaml-dev \
		make \
		patch \
		unzip \
		xz-utils \
		zlib1g-dev; \
    useradd -g root -G sudo -m -s /bin/bash alice; \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers; \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen; \
    locale-gen;
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8
USER alice
WORKDIR /home/alice

ENV NODE_VERSION 13.5.0
RUN set -eux; \
    for key in \
        94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
        FD3A5288F042B6850C66B31F09FE44734EB7990E \
        71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
        DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
        C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
        B9AE9905FFD7803F25714661B63B535A4C206CA9 \
        77984A986EBC2AA786BC0F66B01FBB92821C587A \
        8FCCA13FEF1D0C2E91008E09770F7A9A5AE15600 \
        4ED778F539E3634C779C87C6D7062848A1AB005C \
        A48C2BEE680E841632CD4E44F07496B3EB3C1762 \
        B9E2F5981AA6E0CD28160D9FF13993A75599653C \
    ; do \
        gpg --batch --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" || \
        gpg --batch --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "$key" || \
        gpg --batch --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ; \
    done; \
    curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz"; \
    curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc"; \
    gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc; \
    grep " node-v$NODE_VERSION-linux-x64.tar.xz\$" SHASUMS256.txt | sha256sum -c -; \
    sudo tar -xJf "node-v$NODE_VERSION-linux-x64.tar.xz" -C /usr/local --strip-components=1 --no-same-owner; \
    rm "node-v$NODE_VERSION-linux-x64.tar.xz" SHASUMS256.txt.asc SHASUMS256.txt; \
    sudo ln -s /usr/local/bin/node /usr/local/bin/nodejs

ENV YARN_VERSION 1.21.1
RUN set -eux; \
    for key in \
        6A010C5166006599AA17F08146C2130DFD2497F5 \
    ; do \
        gpg --batch --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" || \
        gpg --batch --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "$key" || \
        gpg --batch --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ; \
    done; \
    curl -fsSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz"; \
    curl -fsSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz.asc"; \
    gpg --batch --verify yarn-v$YARN_VERSION.tar.gz.asc yarn-v$YARN_VERSION.tar.gz; \
    sudo mkdir -p /usr/local/opt; \
    sudo tar -xzf yarn-v$YARN_VERSION.tar.gz -C /usr/local/opt/; \
    sudo ln -s /usr/local/opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn; \
    sudo ln -s /usr/local/opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg; \
    rm yarn-v$YARN_VERSION.tar.gz.asc yarn-v$YARN_VERSION.tar.gz;

ENV RUST_VERSION=1.40.0 \
    RUSTUP_HASH=e68f193542c68ce83c449809d2cad262cc2bbb99640eb47c58fc1dc58cc30add \
    RUSTUP_VERSION=1.20.2
ENV PATH="/home/alice/.cargo/bin:$PATH"
RUN set -eux; \
    curl -O "https://static.rust-lang.org/rustup/archive/$RUSTUP_VERSION/x86_64-unknown-linux-gnu/rustup-init"; \
    echo "$RUSTUP_HASH *rustup-init" | sha256sum -c -; \
    chmod +x rustup-init; \
    ./rustup-init -y --no-modify-path --default-toolchain $RUST_VERSION; \
    rm rustup-init; \
    rustup --version; \
    cargo --version; \
    rustc --version;

RUN set -eux; \
    sudo apt-get update; \
    sudo apt-get upgrade -y; \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        software-properties-common; \
    sudo add-apt-repository ppa:deadsnakes/ppa; \
    sudo apt-get update; \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        python2.7 python2.7-dev python3.8 python3.8-dev python3.8-venv; \
    sudo ln -s /usr/bin/python2.7 /usr/local/bin/python2; \
    sudo ln -s /usr/bin/python2.7 /usr/local/bin/python2.7; \
    sudo ln -s /usr/bin/python3.8 /usr/local/bin/python; \
    sudo ln -s /usr/bin/python3.8 /usr/local/bin/python3; \
    sudo ln -s /usr/bin/python3.8 /usr/local/bin/python3.8;

ENV PYTHON_PIP_VERSION=19.3.1 \
    PYTHON_GET_PIP_URL=https://github.com/pypa/get-pip/raw/ffe826207a010164265d9cc807978e3604d18ca0/get-pip.py \
    PYTHON_GET_PIP_SHA256=b86f36cc4345ae87bfd4f10ef6b2dbfa7a872fbff70608a1e43944d283fd0eee
RUN set -eux; \
	wget -O get-pip.py "$PYTHON_GET_PIP_URL"; \
	echo "$PYTHON_GET_PIP_SHA256 *get-pip.py" | sha256sum --check --strict -; \
    sudo /usr/local/bin/python2 get-pip.py \
		--disable-pip-version-check \
		--no-cache-dir \
		"pip==$PYTHON_PIP_VERSION"; \
	sudo /usr/local/bin/python3 get-pip.py \
		--disable-pip-version-check \
		--no-cache-dir \
		"pip==$PYTHON_PIP_VERSION"; \
    rm -f get-pip.py; \
    pip2 install -U pip; \
    pip3 install -U pip;

RUN set -eux; \
    cargo install bat cargo-update exa fd-find ripgrep;

RUN set -eux; \
    sudo mkdir -p /usr/local/opt; \
    cd /usr/local/opt; \
    sudo curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage; \
    sudo chmod 775 nvim.appimage; \
    sudo ./nvim.appimage --appimage-extract; \
    sudo mv ./squashfs-root ./neovim; \
    sudo chmod -R 775 ./neovim; \
    sudo ln -s /usr/local/opt/neovim/usr/bin/nvim /usr/local/bin/nvim; \
    sudo pip2 install pynvim; \
    sudo pip3 install pynvim; \
    yarn global add neovim;

RUN set -eux; \
    sudo apt-get update; \
    sudo apt-get upgrade -y; \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        bash-completion \
        htop \
        tree \
        tzdata \
        xclip;

COPY --chown=alice:root .bash_logout /home/alice/.bash_logout
COPY --chown=alice:root .bash_profile /home/alice/.bash_profile
COPY --chown=alice:root .bashrc /home/alice/.bashrc
COPY --chown=alice:root .config/nvim /home/alice/.config/nvim
COPY --chown=alice:root .inputrc /home/alice/.inputrc
COPY --chown=alice:root .profile /home/alice/.profile
COPY --chown=alice:root .vim /home/alice/.vim
COPY --chown=alice:root .vimrc /home/alice/.vimrc
