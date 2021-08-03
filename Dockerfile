FROM fr3akyphantom/ttk_base:latest

RUN apt-get install -qqy xterm screen file nginx

WORKDIR /

RUN git clone https://github.com/yash-dk/TorToolkit-Telegram -b master --depth 1 /torapp

WORKDIR /torapp

RUN echo -e "\nlaunchpadlib" >> requirements.txt && \
  pip3 install --no-cache-dir -r requirements.txt

WORKDIR /tmp

RUN curl -fsSL https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -o ngrok.zip && \
  unzip -q ngrok.zip ngrok && rm ngrok.zip && \
  chmod +x ngrok && mv ngrok /usr/local/bin/

WORKDIR /torapp
