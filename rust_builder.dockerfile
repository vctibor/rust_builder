FROM debian

RUN apt-get update && \
    apt-get upgrade && \
    apt-get install -y curl
   
RUN apt-get install -y build-essential

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > install_rustup.sh

RUN chmod o+x install_rustup.sh

RUN ./install_rustup.sh -y

ENV PATH="/root/.cargo/bin:${PATH}"

RUN rustup -V
RUN rustc -V
RUN cargo -V

RUN cargo install cargo-deb
