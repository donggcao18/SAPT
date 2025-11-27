# SAPT

> The official implementation for the ACL 2024 paper *SAPT: A Shared Attention Framework for Parameter-Efficient Continual Learning of Large Language Models*.

<img src="https://img.shields.io/badge/Venue-ACL--24-278ea5" alt="venue"/> <img src="https://img.shields.io/badge/Status-Accepted-success" alt="status"/> <img src="https://img.shields.io/badge/Issues-Welcome-red">

## Requirements
* Python 3.10.12
* PyTorch 2.1.0
* Transformers 4.30.2
* CUDA 12.2

## Preparation
1. Setting up env
```sh
conda create -y -n nlp python=3.10.12
conda activate nlp 
cd SAPT
pip install -r requirements_v2.txt
```

2. Generating data for CodeTask dataset 
```sh
python CODETASK_Benchmark/parse_into_json.py
```

3. Config for CodeTask has been already created and stored in  `configs/CodeTask`


4. And the generated pseudo data points are in `/generated_data`.

## Training

To implement T5 model on the CodeTask benchmark:

```sh
bash my_script.sh
```



## Citation
If you find our work useful for your research, please kindly cite our paper as follows:
```
@inproceedings{zhao2024sapt,
  title={Sapt: A shared attention framework for parameter-efficient continual learning of large language models},
  author={Zhao, Weixiang and Wang, Shilong and Hu, Yulin and Zhao, Yanyan and Qin, Bing and Zhang, Xuanyu and Yang, Qing and Xu, Dongliang and Che, Wanxiang},
  booktitle={Proceedings of the 62nd Annual Meeting of the Association for Computational Linguistics (Volume 1: Long Papers)},
  pages={11641--11661},
  year={2024}
}
```

## Credits
The code of this repository partly relies on [O-LoRA](https://github.com/cmnfriend/O-LoRA) and I would like to show my sincere gratitude to authors of it.
