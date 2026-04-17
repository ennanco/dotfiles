# ~/.config/bash/conf.d/gpu-linux.sh
# CUDA/NVIDIA environment for Linux hosts with GPU

if [ -d "/usr/local/cuda" ]; then
    export CUDA_HOME="/usr/local/cuda"

    case ":$PATH:" in
        *":$CUDA_HOME/bin:"*) ;;
        *) export PATH="$CUDA_HOME/bin:$PATH" ;;
    esac

    if [ -d "$CUDA_HOME/lib64" ]; then
        case ":${LD_LIBRARY_PATH:-}:" in
            *":$CUDA_HOME/lib64:"*) ;;
            *) export LD_LIBRARY_PATH="$CUDA_HOME/lib64${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}" ;;
        esac
    fi

    if [ -d "$CUDA_HOME/extras/CUPTI/lib64" ]; then
        case ":${LD_LIBRARY_PATH:-}:" in
            *":$CUDA_HOME/extras/CUPTI/lib64:"*) ;;
            *) export LD_LIBRARY_PATH="$CUDA_HOME/extras/CUPTI/lib64${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}" ;;
        esac
    fi

    if [ -d "/usr/local/lib" ]; then
        case ":${LD_LIBRARY_PATH:-}:" in
            *":/usr/local/lib:"*) ;;
            *) export LD_LIBRARY_PATH="/usr/local/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}" ;;
        esac
    fi
fi
