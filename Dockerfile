FROM runpod/worker-comfyui:5.3.0-base

# Gỡ comfyUI cũ cài bằng comfy-cli và thay bằng bản mới nhất từ GitHub
RUN rm -rf /comfyui && \
    git clone https://github.com/comfyanonymous/ComfyUI.git /comfyui && \
    pip install -r /comfyui/requirements.txt

# Copy model files
COPY wan2.2_ti2v_5B_fp16.safetensors /comfyui/models/diffusion_models/
COPY umt5_xxl_fp8_e4m3fn_scaled.safetensors /comfyui/models/text_encoders/
COPY wan2.2_vae.safetensors /comfyui/models/vae/

# Override handler
COPY handler.py /handler.py
