# Use an official Python runtime as the base image
FROM python:3.9
# git clone https://github.com/paloli1/RAG1
# Set the working directory in the container
WORKDIR /app
# Copy the current directory contents into the container at /app
COPY . /app
#COPY . .
# Install any needed dependencies specified in requirements.txt
#RUN <any_setup_commands>
RUN pip install --no-cache-dir -r requirements.txt
#CMD <command_to_run>
# Setup a conda environment 
CMD conda create -n myenv python=3.9
# Activate conda environment
CMD conda activate ./myenv
#Install Ollama
CMD curl -fsSL https://ollama.com/install.sh | sh
#Create 2 empty Directories
CMD mkdir data
CMD mkdir chroma
#run the application with following command in the terminal
#RUN uvicorn api:app --reload --port=8000
visit the below link for access fast api docs
#RUN http://localhost:8000/docs

# Run the Python application
CMD ["python", "api.py"]
