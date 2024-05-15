FROM nvcr.io/nvidia/tritonserver:23.07-py3
WORKDIR /opt/tritonserver
RUN apt-get update && apt-get install -y python3.10-venv
ENV VIRTUAL_ENV=/opt/dhruva-mt
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN pip install -U ctranslate2 OpenNMT-py==1.2.0 git+https://github.com/vmujadia/tokenizer.git
CMD ["tritonserver", "--model-repository=/models/himangy_triton_repo", "--cache-config=local,size=1048576"]
EXPOSE 8000
EXPOSE 8001
EXPOSE 8002
