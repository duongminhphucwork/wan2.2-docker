# start from a clean base image
FROM runpod/worker-comfyui:5.3.0-base

# Copy model files vào đúng thư mục trong image
COPY wan2.2_ti2v_5B_fp16.safetensors /comfyui/models/diffusion_models/
COPY umt5_xxl_fp8_e4m3fn_scaled.safetensors /comfyui/models/text_encoders/
COPY wan2.2_vae.safetensors /comfyui/models/vae/

# Ghi đè handler mặc định
COPY handler.py /handler.py
