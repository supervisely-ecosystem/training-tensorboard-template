FROM supervisely/base-py-sdk:6.70.13

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
