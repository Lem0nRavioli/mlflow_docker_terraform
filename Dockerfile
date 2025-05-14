FROM python:3.12-slim

# Install Python dependencies (pinning mlflow version is better for reproducibility)
RUN pip install --no-cache-dir mlflow

# Set working directory inside the container
WORKDIR /mlflow

# Copy your training script into the image
COPY train.py .

# Expose the port used by MLflow UI
EXPOSE 5000

# Default command: run training, then start MLflow UI
CMD python train.py && mlflow ui --host 0.0.0.0 --port 5000
