FROM ghcr.io/ihaskell/ihaskell-notebook:master@sha256:7105b6519a07515babc254b7d3582f7e631149bc9b8ae5f2df0a215d4143cec6

# USER root
COPY stack.yaml /home/$NB_USER/stack.yaml
COPY package.yaml /home/$NB_USER/package.yaml
COPY LICENSE /home/$NB_USER/LICENSE
COPY src /home/$NB_USER/src
# USER $NB_UID
RUN cd /home/$NB_USER && stack build

ENV JUPYTER_ENABLE_LAB=yes
