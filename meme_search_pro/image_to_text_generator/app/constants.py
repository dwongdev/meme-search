import os


# system constants
APP_PORT = os.environ.get("APP_PORT", "3000")
APP_URL = f"http://meme_search_pro:{APP_PORT}/image_cores/"
JOB_DB = "/app/db/job_queue.db"

# model constants
default_model = "Florence-2-base"
available_models = ["test", default_model, "Florence-2-large", "SmolVLM-256M-Instruct", "SmolVLM-500M-Instruct",  "moondream2"]
