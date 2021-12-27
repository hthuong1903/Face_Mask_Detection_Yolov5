import io
from PIL import Image
import cv2
import torch
import torchvision

from flask import Flask, render_template, request, make_response
from werkzeug.exceptions import BadRequest
import os

app = Flask(__name__, static_folder='static', template_folder='templates')
# app = Flask(__name__)
dictOfModels = {}
# create a list of keys to use them in the select part of the html code
listOfKeys = []
for r, d, f in os.walk("models_train"):
    for file in f:
        if ".pt" in file:
            # example: file = "model1.pt"
            # the path of each model: os.path.join(r, file)
            dictOfModels[os.path.splitext(file)[0]] = torch.hub.load('ultralytics/yolov5', 'custom', path=os.path.join(r, file), force_reload=True)
            # you would obtain: dictOfModels = {"model1" : model1 , etc}
    for key in dictOfModels :
        listOfKeys.append(key)     # put all the keys in the listOfKeys
    print(listOfKeys)

def get_prediction(img_bytes,model):
    img = Image.open(io.BytesIO(img_bytes))
    results = model(img, size=640)  
    return results

@app.route('/', methods=['GET'])
def get():
    return render_template("index.html", len = len(listOfKeys), listOfKeys = listOfKeys)

@app.route('/predict', methods=['GET','POST'])
def predict():
    if request.method == 'POST':
        file = extract_img(request)
        img_bytes = file.read()
        # choice of the model
        results = get_prediction(img_bytes,dictOfModels[request.form.get("model_choice")])
        print(f'User selected model : {request.form.get("model_choice")}')
        # updates results.imgs with boxes and labels
        results.render()
        # encoding the resulting image and return it
        for img in results.imgs:
            RGB_img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
            im_arr = cv2.imencode('.jpg', RGB_img)[1]
            response = make_response(im_arr.tobytes())
            # response.headers['Content-Type'] = 'image/jpeg'
        # return your image with boxes and labels
        # return response
        return render_template("prediction.html", predict=response)
    if request.method == 'GET':
        return render_template("index.html")




def extract_img(request):
    # checking if image uploaded is valid
    if 'file' not in request.files:
        raise BadRequest("Missing file parameter!")
    file = request.files['ima']
    if file.filename == '':
        raise BadRequest("Given file is invalid")
    return file

if __name__ == '__main__':
    # app.run(debug=True,host='0.0.0.0')
    app.run(debug=True, threaded=False)
#     # predict()