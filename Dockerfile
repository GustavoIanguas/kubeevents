FROM python:3.9

WORKDIR /app

RUN apt update && apt-get install apt-transport-https ca-certificates gnupg curl -y
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
RUN az --version

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN kubectl version --client

COPY app.py .
COPY requeriments.txt .

RUN pip install -r requeriments.txt

CMD ["setup.sh" ]
ENTRYPOINT [ "python3", "app.py"]