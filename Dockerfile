FROM python:3.10-slim

ENV PYTHONUNBUFFERED True

# ENV APP_HOME ./app
# WORKDIR $APP_HOME
COPY . ./

ENV PORT 8080

# Expose port
EXPOSE ${PORT}

RUN pip install --no-cache-dir -r requirements.txt

# As an example here we're running the web service with one worker on uvicorn.
CMD exec uvicorn main:app --host 0.0.0.0 --port ${PORT} --workers 1