from keras_cv.models import StableDiffusion
from PIL import Image
import sys
import os.path
import datetime

model = StableDiffusion()
prompt_str = sys.argv[1]
filename = sys.argv[2]

txtname = "prompt.txt"
dirname = "src/main/pythonapp/results/"
output_path = os.path.join(dirname, txtname)

# results 디렉토리가 없으면 생성
if not os.path.exists(dirname):
    os.makedirs(dirname)
    
# prompt.txt 파일이 없으면 생성
if not os.path.isfile(output_path):
    with open(output_path, "w") as f:
        pass

with open(output_path, "a") as f:
    # 파일이 비어있지 않다면 줄바꿈 문자 추가
    if os.path.getsize(output_path) > 0:
        f.write("\n")
    # 현재 시간과 함께 prompt_str 한 줄 추가
    current_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    f.write(f"{current_time} [{filename}] {prompt_str}")

if not filename.endswith(".png"):
    # 파일 이름과 확장자를 튜플 형태로 반환 후 더하기
    filename = os.path.splitext(filename)[0] + ".png"

img = model.text_to_image(prompt_str)
Image.fromarray(img[0]).save(f'{dirname}{filename}')
