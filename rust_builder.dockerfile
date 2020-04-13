FROM debian

RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get install curl build-essential git pkg-config libssl-dev -y
   
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > install_rustup.sh

RUN chmod o+x install_rustup.sh

RUN ./install_rustup.sh -y

ENV PATH="/root/.cargo/bin:${PATH}"

RUN rustup -V
RUN rustc -V
RUN cargo -V

RUN cargo install cargo-deb
