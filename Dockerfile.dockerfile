#Використовуємо офіційний образ Python
FROM python:3.8.10

# Встановимо змінну середовища
ENV HOME_ASSISTANT /app

# Встановимо робочу директорію усередині контейнера
WORKDIR $HOME_ASSISTANT

# Скопіюємо інші файли до робочої директорії контейнера
WORKDIR /app
COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY . /app

# Позначимо порт де працює програма всередині контейнера
EXPOSE 5000

# Запустимо нашу програму всередині контейнера
ENTRYPOINT ["python", "main.py"]