# Use an official Python runtime as the base image
FROM python:3.9

# git clone https://github.com/paloli1/RAG1

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

#COPY . .

# Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
#RUN <any_setup_commands>


CMD conda create -n myenv python=3.9
CMD conda activate ./myenv

CMD curl -fsSL https://ollama.com/install.sh | sh

CMD mkdir data
CMD mkdir chroma

RUN uvicorn api:app --reload --port=8000
RUN http://localhost:8000/docs

# Run the Python application
CMD ["python", "api.py"]
