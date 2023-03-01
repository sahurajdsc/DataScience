import pickle
import numpy as np
from flask import Flask,render_template,request
app = Flask(__name__,template_folder='page')
model = pickle.load(open('End_to_End_HR_Analytics.pkl','rb'))
@app.route('/')
def home():
    return render_template('HR_Home.html')

@app.route('/predict',methods=['POST'])
def predict():
    features = [x for x in request.form.values()]
    final_features = np.array(features,dtype="object").reshape(1,8)
    output = model.predict(final_features)
    if output[0]==0:
        textoutput = "Not Eligible"
    else:
        textoutput = "Eligible"
    return render_template('HR_Home.html',output_text="Employee is {}".format(textoutput))

if __name__ == "__main__":
    app.run(debug=True)