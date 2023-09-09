# Screaming Frog SEO Spider Docker Image

This repository contains the necessary files to build a Docker image for the [Screaming Frog SEO Spider](https://www.screamingfrog.co.uk/seo-spider/), a powerful and fast SEO site audit tool. The Docker image allows you to run Screaming Frog SEO Spider in a containerized environment.

## Prerequisites

- [Docker](https://www.docker.com/get-started) installed on your system.
- [curl](https://curl.se/) installed on your system (for automated version retrieval).

## Building the Docker Image

We have implemented an automated way to always build the Docker image with the latest version of Screaming Frog SEO Spider. Follow these steps to build the image:

### Step 1: Clone the Repository

Clone this repository to your local system:

```sh
git clone https://github.com/jlcases/screamingfrog-docker.git
cd screamingfrog-docker

### Step 2: Run the Build Script

We have provided a bash script (build.sh) that automatically retrieves the latest version of Screaming Frog SEO Spider from the official website and builds the Docker image with it. To run the script, first give it execution permissions and then execute it:

sh
Copy code
chmod +x build.sh
./build.sh
This will build a Docker image tagged screamingfrog.

Using the Docker Image
Once the image is built, you can run Screaming Frog SEO Spider using the following command:

sh
Copy code
docker run -it -e SCREAMING_FROG_LICENSE=your_license_key_here screamingfrog
Replace your_license_key_here with your actual Screaming Frog SEO Spider license key. This will pass the license key to the Screaming Frog SEO Spider application inside the container, allowing it to run as a licensed version.

### Contributing
Feel free to contribute to this project by opening issues or submitting pull requests for improvements and bug fixes.

### License
This project is open-source and available under the MIT License.

### Contact
If you have any questions or suggestions, feel free to open an issue on this repository.

Thank you for using our Screaming Frog SEO Spider Docker image!