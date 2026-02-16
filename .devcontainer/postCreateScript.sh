#!/bin/bash

# .venvの作成
[ -d .venv ] || uv venv .venv
source .venv/bin/activate

# GPUチェック: nvidia-smiコマンドが成功するかどうか
if command -v nvidia-smi &> /dev/null && nvidia-smi &> /dev/null; then
  echo "Nvidia GPU detected. Installing with CUDA support..."
  uv sync --extra cuda
else
  echo "Nvidia GPU not detected. Installing CPU version..."
fi
