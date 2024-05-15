<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.

# mt-model-deploy-dhruva

## TL;DR

This repo contains code for python backend CTranslate2 based triton models for the SSMT project.
Prerequisites: `python3.xx-venv`, `nvidia-docker`, `bash`

Quantization disabled until qualitative testing is performed.
```bash
git clone https://ssmt.iiit.ac.in/meitygit/ssmt/mt-model-deploy-dhruva.git
cd mt-model-deploy-dhruva
bash make_triton_model_repo.sh
docker build -t dhruva/himangy-model-server:1 .
nvidia-docker run --gpus=all --rm --shm-size 5g --network=host --name dhruva-himangy-triton-server -v./himangy_triton_repo:/models dhruva/himangy-model-server:1
```

## What this repo does

* This repo contains the templates and component triton models for the SSMT project.
* Also contained is a Dockerfile to construct the triton server instance.
* Dynamic batching and caching is supported and enabled by default.
* The repository folder can me mounted to the dhruva himangy triton server on `/models` and can be queried via a client.
* Sample client code is also given as an ipython notebook.

## Architecture of the pipeline

The pipeline consists of 4 components, executed in order:
* Tokenizer - This model is CPU only and tokenizes and applies BPE on the input string.
* Model Demuxer - This model is CPU only and depending on the language pair requested, queues up an `InferenceRequest` for the appropriate model and returns it as the response.
* Model - This is a GPU based model and it processes the tokenized text and returns the final form of the translated text to the caller.
* Pipeline - This is an ensemble model that wraps the above three components together and is the one meant to be exposed to the client.

The exact specifications of the model inputs and outputs can be looked at in the corresponding `config.pbtxt` files.
One can construct the triton repo like so:
```bash
git clone https://ssmt.iiit.ac.in/meitygit/ssmt/mt-model-deploy-dhruva.git
cd mt-model-deploy-dhruva
bash make_triton_model_repo.sh
```

## Starting the triton server

We customize the tritonserver image with the required python packages in a venv and enable the cache in the startup command. After the model repo has beeen built, one can build and run the server like so:
```bash
docker build -t dhruva/himangy-model-server:1 .
nvidia-docker run --gpus=all --rm --shm-size 5g --network=host --name dhruva-himangy-triton-server -v./himangy_triton_repo:/models dhruva/himangy-model-server:1
```

## Querying the triton server

We provide a sample ipython notebook that shows how to concurrently request the client for translations.
Prerequisites: `pip install "tritonclient[all]" tqdm numpy wonderwords`

## Data and Model Training
Please refer to the training-code folder and the [README](https://ssmt.iiit.ac.in/meitygit/ssmt/mt-model-deploy-dhruva/-/blob/master/training-code/README.md) within for the links to the data and checkout the Ipython notebook for an annotated version of the training script.



## Already Trained Models Link

[download](https://ssmt.iiit.ac.in/uploads/data_mining/HimangY-oneMT-Models-V1-2.zip)

### supported language pairs

| Source - Target (Bi-direction)| 
|-------------------------------|
|Hindi - Telugu, Urdu, Gujarati, Odia, Punjabi|
|English - Hindi, Telugu, Gujarati|


## Citation
```bash
@inproceedings{mujadia-sharma-2022-ltrc,
    title = "The {LTRC} {H}indi-{T}elugu Parallel Corpus",
    author = "Mujadia, Vandan  and Sharma, Dipti",
    booktitle = "Proceedings of the Thirteenth Language Resources and Evaluation Conference",
    month = jun,
    year = "2022",
    address = "Marseille, France",
    publisher = "European Language Resources Association",
    url = "https://aclanthology.org/2022.lrec-1.365",
    pages = "3417--3424",
}

@inproceedings{mujadia-sharma-2021-english,
title = "{E}nglish-{M}arathi Neural Machine Translation for {L}o{R}es{MT} 2021",
author = "Mujadia, Vandan  and Sharma, Dipti Misra",
booktitle = "Proceedings of the 4th Workshop on Technologies for MT of Low Resource Languages (LoResMT2021)",
month = aug,
year = "2021",
address = "Virtual",
publisher = "Association for Machine Translation in the Americas",
url = "https://aclanthology.org/2021.mtsummit-loresmt.16",
pages = "151--157",
}
```