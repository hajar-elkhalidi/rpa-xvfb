FROM alpine:3.16

LABEL maint="hajar" desc="RPA Framework in Docker, with xvfb"

RUN apk -q update  \
    && apk -q add --no-cache py3-pip py3-qt5 py3-qtwebengine xvfb; 

# RPA Framework https://rpaframework.org/
RUN pip install -q rpaframework