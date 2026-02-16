#!/bin/bash

# .venvの作成（存在しない場合）
[ -d .venv ] || uv venv .venv
source .venv/bin/activate

# GPUチェック: nvidia-smiコマンドが成功するかどうか
if command -v nvidia-smi &> /dev/null && nvidia-smi &> /dev/null; then
    echo "Nvidia GPU detected. Installing with CUDA support..."
    uv sync --extra cuda
else
    echo "GPU not detected (or macOS). Installing CPU version..."
    uv sync
fi