FROM python:3.8

WORKDIR /app

# Install necessary dependencies
RUN apt-get update -y && \
    apt-get install -y xvfb \
    apt-get install -y \
    wget \
    unzip \
    libgconf-2-4

# Download and install ChromeDriver correct version????
RUN wget https://chromedriver.storage.googleapis.com/<CHROME_DRIVER_VERSION>/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && \
    mv chromedriver /usr/local/bin/

# Install Python dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

EXPOSE 80

CMD ["xvfb-run", "python", "./Scrape.py"]
