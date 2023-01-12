# RPA Framework in Docker, with xvfb

## Description

This image is based on Alpine 3.16, also contains xvfb, chromedriver and [RPA Framework](https://pypi.org/project/rpaframework/)

The resources, test cases and reports should be mounted as volumes.


## Running the container

Pull the image :

        docker pull hajare/rpa-xvfb:alpine


After pulling the image, run the container using the following script:

  
        docker run \
        -v <path to the resources folder>:/resources \
        -v <path to the tests folder>:/tests \
        -v <path to results folder>:/results \
        --rm hajare/rpa-xvfb:alpine \
        bash -c "robot tests/" \ 
        --outputdir /results /tests/


## GitHub Actions and GitLab CI/CD

This image can be used in GitHub actions and GitLab CI/CD as follows:

* _**GitLab**_ : **.gitlab-ci.yml**

        image: hajare/rpa-xvfb:alpine

        test:
        stage: test
        script:
            - robot tests/

* _**GitHub**_ : **main.yml**

        jobs:
          test:
            runs-on: ubuntu-latest
            container: hajare/rpa-xvfb:alpine

        steps:
        - uses: actions/checkout@v2
        - name: Run RobotFramework tests
            run: |
                robot tests/
