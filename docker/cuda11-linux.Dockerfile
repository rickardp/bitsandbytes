FROM nvidia/cuda:11.8.0-devel-ubuntu22.04 AS base
# Remove static libs as they waste space and will not be used in this project
RUN find /usr/local -type f -name '*.a' -delete

FROM scratch

COPY --link=true --from=base / /

ENV NVARCH=sbsa,NVIDIA_CPU_ONLY=1,NVIDIA_PRODUCT_NAME=CUDA,PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENTRYPOINT [ "/bin/bash" ]
