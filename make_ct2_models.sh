#!/bin/bash
python3 -m venv ./ssmt_ct2
source ./ssmt_ct2/bin/activate
pip install -U pip wheel; pip install ctranslate2 "OpenNMT-py==1.2.0"
unzip ~/projects/himangy_models/models.zip;mv models himangy-v0.1;cd himangy-v0.1
ct2-opennmt-py-converter --model_path 1.pt --quantization "float32" --output_dir en-hi;mv 1.src en-hi.src;rm 1.pt
ct2-opennmt-py-converter --model_path 2.pt --quantization "float32" --output_dir hi-en;mv 2.src hi-en.src;rm 2.pt
mv 3.pt en-te.pt;mv 3.src en-te.src
ct2-opennmt-py-converter --model_path 4.pt --quantization "float32" --output_dir te-en;mv 4.src te-en.src;rm 4.pt
ct2-opennmt-py-converter --model_path 6.pt --quantization "float32" --output_dir hi-te;mv 6.src hi-te.src;rm 6.pt
ct2-opennmt-py-converter --model_path 7.pt --quantization "float32" --output_dir te-hi;mv 7.src te-hi.src;rm 7.pt
ct2-opennmt-py-converter --model_path 8.pt --quantization "float32" --output_dir en-gu;mv 8.src en-gu.src;rm 8.pt
ct2-opennmt-py-converter --model_path 9.pt --quantization "float32" --output_dir gu-en;mv 9.src gu-en.src;rm 9.pt
cd ..
unzip ~/projects/himangy_models/HimangY-oneMT-Models-V1.zip;mv HimangY-oneMT-Models-V1 himangy-v1.0;cd himangy-v1.0
ct2-opennmt-py-converter --model_path 150001.pt --quantization "float32" --output_dir en-hi;mv 150001.src en-hi.src;rm 150001.pt
ct2-opennmt-py-converter --model_path 150002.pt --quantization "float32" --output_dir hi-en;mv 150002.src hi-en.src;rm 150002.pt
ct2-opennmt-py-converter --model_path 150003.pt --quantization "float32" --output_dir en-te;mv 150003.src en-te.src;rm 150003.pt
ct2-opennmt-py-converter --model_path 150004.pt --quantization "float32" --output_dir te-en;mv 150004.src te-en.src;rm 150004.pt
ct2-opennmt-py-converter --model_path 150005.pt --quantization "float32" --output_dir hi-te;mv 150005.src hi-te.src;rm 150005.pt
ct2-opennmt-py-converter --model_path 150006.pt --quantization "float32" --output_dir te-hi;mv 150006.src te-hi.src;rm 150006.pt
ct2-opennmt-py-converter --model_path 150007.pt --quantization "float32" --output_dir hi-ur;mv 150007.src hi-ur.src;rm 150007.pt
ct2-opennmt-py-converter --model_path 150008.pt --quantization "float32" --output_dir ur-hi;mv 150008.src ur-hi.src;rm 150008.pt
mv 150009.pt hi-gu.pt;mv 150009.src hi-gu.src
ct2-opennmt-py-converter --model_path 150010.pt --quantization "float32" --output_dir gu-hi;mv 150010.src gu-hi.src;rm 150010.pt
mv 150011.pt hi-pa.pt;mv 150011.src hi-pa.src
ct2-opennmt-py-converter --model_path 150013.pt --quantization "float32" --output_dir hi-or;mv 150013.src hi-or.src;rm 150013.pt
ct2-opennmt-py-converter --model_path 150014.pt --quantization "float32" --output_dir or-hi;mv 150014.src or-hi.src;rm 150014.pt
ct2-opennmt-py-converter --model_path 150015.pt --quantization "float32" --output_dir hi-ta;mv 150015.src hi-ta.src;rm 150015.pt
ct2-opennmt-py-converter --model_path 150017.pt --quantization "float32" --output_dir hi-kn;mv 150017.src hi-kn.src;rm 150017.pt
ct2-opennmt-py-converter --model_path 150018.pt --quantization "float32" --output_dir kn-hi;mv 150018.src kn-hi.src;rm 150018.pt
ct2-opennmt-py-converter --model_path 150019.pt --quantization "float32" --output_dir ta-te;mv 150019.src ta-te.src;rm 150019.pt
ct2-opennmt-py-converter --model_path 150020.pt --quantization "float32" --output_dir te-ta;mv 150020.src te-ta.src;rm 150020.pt
cd ..
unzip ~/projects/himangy_models/v2.5-Himangy.zip -d himangy-v2.5;cd himangy-v2.5
ct2-opennmt-py-converter --model_path en-hi.pt --quantization "float32" --output_dir en-hi;rm en-hi.pt
ct2-opennmt-py-converter --model_path en-te.pt --quantization "float32" --output_dir en-te;rm en-te.pt
ct2-opennmt-py-converter --model_path hi-en.pt --quantization "float32" --output_dir hi-en;rm hi-en.pt
ct2-opennmt-py-converter --model_path te-en.pt --quantization "float32" --output_dir te-en;rm te-en.pt
cd ..
mkdir himangy-ct2
mv himangy-v2.5/en-hi himangy-ct2;mv himangy-v2.5/en-hi.src himangy-ct2
mv himangy-v2.5/hi-en himangy-ct2;mv himangy-v2.5/hi-en.src himangy-ct2
mv himangy-v2.5/en-te himangy-ct2;mv himangy-v2.5/en-te.src himangy-ct2
mv himangy-v2.5/te-en himangy-ct2;mv himangy-v2.5/te-en.src himangy-ct2
mv himangy-v1.0/hi-te himangy-ct2;mv himangy-v1.0/hi-te.src himangy-ct2
mv himangy-v1.0/te-hi himangy-ct2;mv himangy-v1.0/te-hi.src himangy-ct2
mv himangy-v1.0/hi-ur himangy-ct2;mv himangy-v1.0/hi-ur.src himangy-ct2
mv himangy-v1.0/ur-hi himangy-ct2;mv himangy-v1.0/ur-hi.src himangy-ct2
mv himangy-v1.0/hi-gu.pt himangy-ct2;mv himangy-v1.0/hi-gu.src himangy-ct2
mv himangy-v1.0/gu-hi himangy-ct2;mv himangy-v1.0/gu-hi.src himangy-ct2
mv himangy-v1.0/hi-pa.pt himangy-ct2;mv himangy-v1.0/hi-pa.src himangy-ct2
mv himangy-v1.0/hi-or himangy-ct2;mv himangy-v1.0/hi-or.src himangy-ct2
mv himangy-v1.0/or-hi himangy-ct2;mv himangy-v1.0/or-hi.src himangy-ct2
mv himangy-v1.0/hi-ta himangy-ct2;mv himangy-v1.0/hi-ta.src himangy-ct2
mv himangy-v1.0/hi-kn himangy-ct2;mv himangy-v1.0/hi-kn.src himangy-ct2
mv himangy-v1.0/kn-hi himangy-ct2;mv himangy-v1.0/kn-hi.src himangy-ct2
mv himangy-v1.0/ta-te himangy-ct2;mv himangy-v1.0/ta-te.src himangy-ct2
mv himangy-v1.0/te-ta himangy-ct2;mv himangy-v1.0/te-ta.src himangy-ct2
mv himangy-v0.1/en-gu himangy-ct2;mv himangy-v0.1/en-gu.src himangy-ct2
mv himangy-v0.1/gu-en himangy-ct2;mv himangy-v0.1/gu-en.src himangy-ct2
rm -rf himangy-v0.1 himangy-v1.0 himangy-v2.5
zip -9 -r himangy-ct2.zip himangy-ct2
rm -rf himangy-ct2
deactivate;rm -rf ssmt_ct2
