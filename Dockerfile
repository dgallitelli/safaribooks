# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:slim

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install git
RUN apt-get update \
    && apt-get install -y --no-install-recommends git \
    && apt-get purge -y --auto-remove \
    && rm -rf /var/lib/apt/lists/*


# Install Safaribooks from GitHub
RUN git clone https://github.com/lorenzodifuccia/safaribooks.git
WORKDIR safaribooks
RUN python -m pip install -r requirements.txt

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
ENTRYPOINT ["python", "safaribooks.py"]
