FROM debian:bookworm-slim

ARG MDBOOK_VERSION=v0.5.2
ARG MDBOOK_PANDOC_VERSION=v0.11.0

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl ca-certificates xz-utils \
        pandoc \
        texlive-xetex \
        texlive-fonts-recommended \
        texlive-latex-recommended \
        fonts-noto-core \
        fonts-noto-mono \
        lmodern \
        zip \
    && curl -sSL https://github.com/rust-lang/mdBook/releases/download/${MDBOOK_VERSION}/mdbook-${MDBOOK_VERSION}-x86_64-unknown-linux-gnu.tar.gz \
        | tar xz -C /usr/local/bin \
    && curl -sSL https://github.com/max-heller/mdbook-pandoc/releases/download/${MDBOOK_PANDOC_VERSION}/mdbook-pandoc-x86_64-unknown-linux-gnu.tar.xz \
        | tar xJ --strip-components=1 -C /usr/local/bin \
    && apt-get purge -y --auto-remove curl ca-certificates xz-utils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work
