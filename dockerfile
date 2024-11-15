FROM python:3.8-slim

# create wpork directory
WORKDIR /app

# Copy the requirements to directory app
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code in app
COPY . .

RUN mkdir -p /app/tp3_devops/plots

# Run the application
ENTRYPOINT ["python3", "main.py", "--mode", "test", "--data_path", "./data/test/", "--model_path", "./models/cnn_resnet18_freeze_backbone_False.pth"]
