#!/bin/bash
wget https://ssmt.iiit.ac.in/uploads/data_mining/HimangY-oneMT-Models-V1-2.zip --no-check-certificate
unzip HimangY-oneMT-Models-V1-2.zip;mv HimangY-oneMT-Models-V1-2 himangy-ct2
mkdir himangy_triton_repo
cd himangy_triton_repo
cp -r ../triton_models/nmt .
cp -r ../triton_models/demuxer .
cp -r ../triton_models/tokenizer .
cp -r ../triton_models/model_ct2 himangy-en-hi;mv ../himangy-ct2/en-hi himangy-en-hi/1/translator;mv ../himangy-ct2/en-hi.src tokenizer/1/bpe_src;sed -i 's/model_name/himangy-en-hi/' himangy-en-hi/config.pbtxt;sed -i "s/input_lang, output_lang/'en', 'hi'/" himangy-en-hi/1/model.py
cp -r ../triton_models/model_ct2 himangy-hi-en;mv ../himangy-ct2/hi-en himangy-hi-en/1/translator;mv ../himangy-ct2/hi-en.src tokenizer/1/bpe_src;sed -i 's/model_name/himangy-hi-en/' himangy-hi-en/config.pbtxt;sed -i "s/input_lang, output_lang/'hi', 'en'/" himangy-hi-en/1/model.py
cp -r ../triton_models/model_ct2 himangy-en-te;mv ../himangy-ct2/en-te himangy-en-te/1/translator;mv ../himangy-ct2/en-te.src tokenizer/1/bpe_src;sed -i 's/model_name/himangy-en-te/' himangy-en-te/config.pbtxt;sed -i "s/input_lang, output_lang/'en', 'te'/" himangy-en-te/1/model.py
cp -r ../triton_models/model_ct2 himangy-te-en;mv ../himangy-ct2/te-en himangy-te-en/1/translator;mv ../himangy-ct2/te-en.src tokenizer/1/bpe_src;sed -i 's/model_name/himangy-te-en/' himangy-te-en/config.pbtxt;sed -i "s/input_lang, output_lang/'te', 'en'/" himangy-te-en/1/model.py
cp -r ../triton_models/model_ct2 himangy-hi-te;mv ../himangy-ct2/hi-te himangy-hi-te/1/translator;mv ../himangy-ct2/hi-te.src tokenizer/1/bpe_src;sed -i 's/model_name/himangy-hi-te/' himangy-hi-te/config.pbtxt;sed -i "s/input_lang, output_lang/'hi', 'te'/" himangy-hi-te/1/model.py
cp -r ../triton_models/model_ct2 himangy-te-hi;mv ../himangy-ct2/te-hi himangy-te-hi/1/translator;mv ../himangy-ct2/te-hi.src tokenizer/1/bpe_src;sed -i 's/model_name/himangy-te-hi/' himangy-te-hi/config.pbtxt;sed -i "s/input_lang, output_lang/'te', 'hi'/" himangy-te-hi/1/model.py
cp -r ../triton_models/model_ct2 himangy-hi-ur;mv ../himangy-ct2/hi-ur himangy-hi-ur/1/translator;mv ../himangy-ct2/hi-ur.src tokenizer/1/bpe_src;sed -i 's/model_name/himangy-hi-ur/' himangy-hi-ur/config.pbtxt;sed -i "s/input_lang, output_lang/'hi', 'ur'/" himangy-hi-ur/1/model.py
cp -r ../triton_models/model_ct2 himangy-ur-hi;mv ../himangy-ct2/ur-hi himangy-ur-hi/1/translator;mv ../himangy-ct2/ur-hi.src tokenizer/1/bpe_src;sed -i 's/model_name/himangy-ur-hi/' himangy-ur-hi/config.pbtxt;sed -i "s/input_lang, output_lang/'ur', 'hi'/" himangy-ur-hi/1/model.py
cp -r ../triton_models/model_onmt himangy-hi-gu;mv ../himangy-ct2/hi-gu.pt himangy-hi-gu/1/translator.pt;mv ../himangy-ct2/hi-gu.src tokenizer/1/bpe_src;sed -i 's/model_name/himangy-hi-gu/' himangy-hi-gu/config.pbtxt;sed -i "s/input_lang, output_lang/'hi', 'gu'/" himangy-hi-gu/1/model.py
cp -r ../triton_models/model_ct2 himangy-gu-hi;mv ../himangy-ct2/gu-hi himangy-gu-hi/1/translator;mv ../himangy-ct2/gu-hi.src tokenizer/1/bpe_src;sed -i 's/model_name/himangy-gu-hi/' himangy-gu-hi/config.pbtxt;sed -i "s/input_lang, output_lang/'gu', 'hi'/" himangy-gu-hi/1/model.py
cp -r ../triton_models/model_onmt himangy-hi-pa;mv ../himangy-ct2/hi-pa.pt himangy-hi-pa/1/translator.pt;mv ../himangy-ct2/hi-pa.src tokenizer/1/bpe_src/hi-pa.src;sed -i 's/model_name/himangy-hi-pa/' himangy-hi-pa/config.pbtxt;sed -i "s/input_lang, output_lang/'hi', 'pa'/" himangy-hi-pa/1/model.py
cp -r ../triton_models/model_ct2 himangy-hi-or;mv ../himangy-ct2/hi-or himangy-hi-or/1/translator;mv ../himangy-ct2/hi-or.src tokenizer/1/bpe_src;sed -i 's/model_name/himangy-hi-or/' himangy-hi-or/config.pbtxt;sed -i "s/input_lang, output_lang/'hi', 'or'/" himangy-hi-or/1/model.py
cp -r ../triton_models/model_ct2 himangy-or-hi;mv ../himangy-ct2/or-hi himangy-or-hi/1/translator;mv ../himangy-ct2/or-hi.src tokenizer/1/bpe_src;sed -i 's/model_name/himangy-or-hi/' himangy-or-hi/config.pbtxt;sed -i "s/input_lang, output_lang/'or', 'hi'/" himangy-or-hi/1/model.py
cp -r ../triton_models/model_ct2 himangy-en-gu;mv ../himangy-ct2/en-gu himangy-en-gu/1/translator;mv ../himangy-ct2/en-gu.src tokenizer/1/bpe_src;sed -i 's/model_name/himangy-en-gu/' himangy-en-gu/config.pbtxt;sed -i "s/input_lang, output_lang/'en', 'gu'/" himangy-en-gu/1/model.py
cp -r ../triton_models/model_ct2 himangy-gu-en;mv ../himangy-ct2/gu-en himangy-gu-en/1/translator;mv ../himangy-ct2/gu-en.src tokenizer/1/bpe_src;sed -i 's/model_name/himangy-gu-en/' himangy-gu-en/config.pbtxt;sed -i "s/input_lang, output_lang/'gu', 'en'/" himangy-gu-en/1/model.py
cd ..
rm -rf himangy-ct2;rm -f HimangY-oneMT-Models-V1-2.zip
