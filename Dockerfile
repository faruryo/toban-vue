FROM node:14.11.0-buster AS base

ARG USERNAME=node
ARG USER_UID=1000
ARG USER_GID=$USER_UID

USER $USERNAME
WORKDIR /app

# ---------------------------------------------------------
FROM base AS devcontainer
ARG USERNAME

USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends zsh \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g @vue/cli@4.5.6

USER $USERNAME

RUN cp /etc/zsh/newuser.zshrc.recommended ~/.zshrc

ENTRYPOINT ["/bin/zsh"]
