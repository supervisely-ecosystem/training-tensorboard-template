FROM supervisely/base-py-sdk:latest

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
