from flask import Flask

app = Flask(__name__)


@app.get("/")
def home():
    return "Application DevOps opérationnelle"


@app.get("/health")
def health():
    return "OK"


@app.get("/version")
def version():
    return "Version 1.0"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
