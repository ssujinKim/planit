#!/usr/bin/env python
# coding: utf-8

# # 색상 추출 UDF

# In[1]:


import cv2 as cv
import numpy as np
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
from scipy.spatial.distance import cdist
from collections import Counter
import pandas as pd

cluster_info_list = []
result_colors = []  # 이름 변경: represent_color -> result_colors

# 주어진 함수 및 데이터
colors_dict = {
    '빨간색': (255, 0, 0),'오렌지색': (255, 165, 0),'노란색': (255, 255, 0),'초록색': (0, 255, 0),'파란색': (0, 0, 255),
    '남색': (0, 0, 128),'보라색': (128, 0, 128),'청록색': (0, 255, 220),'하늘색': (135, 206, 235),'분홍색': (255, 192, 203),
    '자홍색': (255, 0, 255),'갈색': (165, 42, 42),'금색': (255, 215, 0),'흰색': (255, 255, 255),'검은색': (0, 0, 0),
    '스카이 블루':(135, 206, 250),'파워 블루': (0, 51, 102),'네이비 블루': (0, 0, 128),'로열 블루': (65, 105, 225),
    '라임색': (0, 255, 0),'연두색': (173, 255, 47),'올리브색': (128, 128, 0), '감나무색': (34,139,34), 
    '진한 주황색': (255, 69, 0), '진한 분홍색': (255, 20, 147)}

def calculate_rgb_difference(color1, color2):
    r1, g1, b1 = color1
    r2, g2, b2 = color2
    return abs(r1 - r2) + abs(g1 - g2) + abs(b1 - b2)

def find_closest_color(target_color, color_list):
    min_difference = float('inf')
    closest_color = None

    for color_name, color_value in color_list.items():
        difference = calculate_rgb_difference(target_color, color_value)

        if difference < min_difference:
            min_difference = difference
            closest_color = color_name

    return closest_color

def palette_perc_with_color_conversion(k_cluster, color_list):
    width = 300
    palette = np.zeros((50, width, 3), np.uint8)

    n_pixels = len(k_cluster.labels_)
    counter = Counter(k_cluster.labels_)
    perc = {}
    for i in counter:
        perc[i] = np.round(counter[i] / n_pixels, 2)
    perc = dict(sorted(perc.items(), key=lambda item: item[1], reverse=True))

    step = 0
    top_colors = Counter()  # Counter 객체를 사용하여 각 색상의 빈도를 합산

    for idx, centers in enumerate(k_cluster.cluster_centers_):
        closest_color_name = find_closest_color(centers, color_list)
        closest_color_value = color_list[closest_color_name]
        palette[:, step:int(step + perc[idx] * width + 1), :] = closest_color_value
        step += int(perc[idx] * width + 1)

        if closest_color_name in top_colors:
            top_colors[closest_color_name] += perc[idx]
        else:
            top_colors[closest_color_name] = perc[idx]

    return palette, top_colors

def calculate_within_cluster_avg_distance_(data, labels, centers, cluster_idx):
    cluster_data = data[labels == cluster_idx]
    center = centers[cluster_idx]
    return np.mean(cdist(cluster_data, [center]))

def process_single_image(image, colors_dict):
    # 이미지 전처리
    img_rgb = cv.cvtColor(image, cv.COLOR_BGR2RGB)
    data = img_rgb.reshape(-1, 3)

    # KMeans 군집화 수행
    clt = KMeans(n_clusters=10, random_state=1)
    clt_result = clt.fit(data)
    unique, counts = np.unique(clt_result.labels_, return_counts=True)
    palette, top_colors = palette_perc_with_color_conversion(clt_result, colors_dict)

    # 각 클러스터에 대한 정보 출력 및 딕셔너리에 저장
    print("Cluster Information:")
    for cluster_idx in unique:
        cluster_data = data[clt_result.labels_ == cluster_idx]
        center = clt_result.cluster_centers_[cluster_idx]
        freq = counts[cluster_idx]
        avg_distance_1 = calculate_within_cluster_avg_distance_(data, clt_result.labels_, clt_result.cluster_centers_, cluster_idx)
        closest_color = find_closest_color(center, colors_dict)

        print(f"Cluster {cluster_idx} - Closest Color: {closest_color} - RGB: {center}, Frequency: {freq}, Avg Distance: {avg_distance_1:.2f}")

        cluster_info = {
            'Cluster Index': cluster_idx,
            'Closest Color': closest_color,
            'RGB': center,
            'Frequency': freq,
            'Avg Distance': avg_distance_1
        }

        cluster_info_list.append(cluster_info)


def represent_color(df):
    result_df = df.groupby(['Closest Color'])['Frequency'].sum().reset_index()
    result_df['Frequency Ratio'] = result_df['Frequency'] / 150000
    represent_colors = []  # 이름 변경: represent_color -> represent_colors

    # result_df에서 Frequency Ratio의 최대값 찾기
    max_freq_ratio = result_df['Frequency Ratio'].max()

    if max_freq_ratio > 0.142:
        # Frequency Ratio가 0.142를 넘는 모든 Closest Color를 represent_color에 추가
        represent_colors.extend(result_df[result_df['Frequency Ratio'] > 0.142]['Closest Color'].tolist())
    else:
        # Frequency Ratio가 최대인 Closest Color를 represent_color에 추가
        max_freq_color = result_df.loc[result_df['Frequency Ratio'].idxmax(), 'Closest Color']
        represent_colors.append(max_freq_color)

    # 결과 출력
    # print("Represent Color:", represent_colors)
    return represent_colors  # 수정: 결과를 반환하도록 변경


# # 이미지 분류 모델

# In[2]:


import os
import numpy as np
import pandas as pd
from tensorflow.keras.preprocessing.image import load_img, img_to_array
from tensorflow.keras.applications.imagenet_utils import decode_predictions
from tensorflow.keras.models import load_model
from keras.preprocessing.image import ImageDataGenerator


# 추천 여행지 파일
recommend_csv = pd.read_csv('C:/Plan-it/Jeju_recommend.csv')


# 저장한 모델 파일 경로
model_path = 'C:/Plan-it/Plan_it.h5'
TRAIN_PATH = 'C:/Plan-it/train'
# 저장한 모델 불러오기
model = load_model(model_path)

# 이미지 클래스 이름 지정해주기
classGen = ImageDataGenerator()

class_generator = classGen.flow_from_directory(
    directory=TRAIN_PATH,
    target_size=(224, 224),
    batch_size=32,
    class_mode="categorical"
)


# In[21]:


result_colors = []
max_pre = []

img_path = 'C:/Plan-it/uploaded_image.jpg'  # 예측하고자 하는 이미지 경로
target_size = (224, 224)  # 모델이 학습시킨 이미지 사이즈와 동일하게 설정

# 이미지 불러오기
image = cv.imread(img_path)

# 함수 호출
process_single_image(image, colors_dict)
df = pd.DataFrame(cluster_info_list)

# represent_color 함수 결과를 result_colors 리스트에 추가
current_result_colors = represent_color(df)
result_colors.append(current_result_colors)
print("Current Result Colors:", current_result_colors)  # 디버깅용 출력

# 이미지 전처리
img = load_img(img_path, target_size=target_size)
x = img_to_array(img)
x = np.expand_dims(x, axis=0)
x = x / 255.0  # 이미지 스케일링

# 예측
preds = model.predict(x)
# 클래스 이름 받는 Dictionary 만들기
pre_dict = {}
# 클래스별 확률 값 출력
class_indices = class_generator.class_indices
class_names = list(class_indices.keys())

for i in range(len(class_names)):
    pre_dict[class_names[i]] = round(preds[0][i] * 100, 2)

sorted_pre_dict = sorted(pre_dict.items(), key=lambda x: x[1], reverse=True)

for key, value in sorted_pre_dict:
    print(f"{key}: {value}%")

if max(pre_dict.values()) < 40:
    print('\n\n다른 사진을 업로드 해주세요!\n\n')
else:
    max_pre = max(pre_dict, key=pre_dict.get)
    print('카테고리: ', max_pre)
    #print(recommend_csv.loc[recommend_csv['토픽'] == max_pre, :])


# result_colors 리스트 출력
#print("Final Result Colors:", result_colors)


# # 여행지 추천

# In[14]:


# result_colors를 flatten하여 리스트 생성
flat_result_colors = [color for sublist in result_colors for color in sublist]


# In[15]:


img_des = recommend_csv.loc[(recommend_csv['토픽'] == max_pre), :]
img_des


# In[16]:


col_img_des = recommend_csv.loc[(recommend_csv['토픽'] == max_pre) & (recommend_csv['Closest Color'].isin(flat_result_colors)), :]

result = col_img_des['이름'].drop_duplicates()
print("l")
for i in range(len(result)):
    print(result.values[i])
    
print("c")
color_res = col_img_des['Closest Color'].drop_duplicates()
for i in range(len(color_res)):
    print(color_res.values[i])
    
# print(col_img_des)
# In[ ]:




