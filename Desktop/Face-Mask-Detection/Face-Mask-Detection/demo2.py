import numpy as np
from IPython.display import Image
import time
import numpy
import cv2
import torch
from yolov5 import detect
# torch.cuda.is_available()

from flask import Flask, render_template, request, send_file, send_from_directory, jsonify,redirect
# import numpy as np
# import pandas as pd
import io
app = Flask(__name__, static_folder='static', template_folder='templates')

# model = torch.hub.load('ultralytics/yolov5', 'custom', path='models_train/best.pt')
# # Image
# img = '45.jpg'

# # Inference
# results = model(img)
# results.pandas().xyxy[0]


@app.route('/')
def home():
    return render_template("index.html")


@app.route('/predict', methods=['GET', 'POST'])
def predict():
    if request.method == 'POST':
        # file = request.files['ima']
        # print(file)
        # img = cv2.imdecode(np.frombuffer(file.read(), dtype=np.uint8),
        #                       cv2.IMREAD_UNCHANGED)
        # img = cv2.imread(file, cv2.IMREAD_UNCHANGED)
        # # print('Original Dimensions : ', img.shape)
        # dim = (640, 640)
        # resized = cv2.resize(img, dim, interpolation=cv2.INTER_AREA)
        # print('Resized Dimensions : ', resized.shape)
        if "file" not in request.files:
            return redirect(request.url)
        file = request.files["ima"]
        if not file:
            return
        img_bytes = file.read()
        img = Image.open(io.BytesIO(img_bytes))
        img_resize = img.resize(1,3,640,640)
        detect.run(weights='./models_train/model.pt', source=img)
        img_pred = Image(img)
        return render_template("prediction.html", predict=img_pred)
    if request.method == 'GET':
        return render_template("index.html")


# #         # detect.py --source ./image/45.jpg --weights ./model_face/best.pt
if __name__ == '__main__':
    app.run(debug=False, threaded=False)
