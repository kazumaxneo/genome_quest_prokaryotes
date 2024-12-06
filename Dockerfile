

# ベースイメージを指定
FROM ubuntu:latest

# 必要な依存関係をインストール
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    bzip2 \
    make \
    gcc \
    perl \
    pigz \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Minicondaをインストール
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -b -p /opt/conda && \
    rm /tmp/miniconda.sh

# 環境変数を設定
ENV PATH="/opt/conda/bin:$PATH"

# mambaをインストール
RUN conda install -n base -c conda-forge mamba

# Perlモジュールのインストール
RUN echo "yes | cpan" && \
    cpan install Statistics::Basic && \
    cpan install Statistics::Lite

# Minimap2のインストール
RUN curl -L https://github.com/lh3/minimap2/releases/download/v2.28/minimap2-2.28_x64-linux.tar.bz2 | tar -jxvf - && \
    cp minimap2-2.28_x64-linux/minimap2 /usr/local/bin/ && \
    rm -rf minimap2-2.28_x64-linux

# SV-Questのインストール
RUN git clone https://github.com/kazumaxneo/SV-Quest.git && \
    mv SV-Quest/SV-Quest.pl /usr/local/bin/SV-Quest1.pl && \
    rm -rf SV-Quest

# tax-check.plとpilon-1.24.jarの配置
COPY tax-check.pl pilon-1.24.jar /usr/local/bin/

# データベースファイルの作成とコピー
RUN mkdir /nodeDB
COPY nodesDB.txt uniprot_ref_proteomes.taxids /nodeDB/

# genome_quest環境のインストール
COPY env.yaml /root/env.yaml
RUN mamba env create --file /root/env.yaml && \
    rm /root/env.yaml

# Conda環境を初期化し、環境をアクティベート
RUN /opt/conda/bin/conda init bash && \
    echo "conda activate genome_quest" >> /root/.bashrc

# 作業ディレクトリを設定
WORKDIR /root

# デフォルトでBashを起動
CMD ["/bin/bash"]

