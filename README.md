# Screaming Frog SEO Spider Docker Image

This repository contains the necessary files to build a Docker image for the [Screaming Frog SEO Spider](https://www.screamingfrog.co.uk/seo-spider/), a powerful and fast SEO site audit tool. The Docker image allows you to run Screaming Frog SEO Spider in a containerized environment, with the ability to access the GUI remotely.

As the Chief Product & Technology Officer at Rankia, responsible for Technical SEO, I encountered exceedingly high costs while using Oncrawl. To mitigate this, I decided to create this cost-effective solution for my team. When used in conjunction with BigQuery and Metabase, this setup can save you thousands of dollars per year.



## Prerequisites

- [Docker](https://www.docker.com/get-started) installed on your system.
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) (if deploying on Google Cloud).

## Building the Docker Image

### Step 1: Clone the Repository

Clone this repository to your local system:

\```sh
git clone https://github.com/jlcases/screamingfrog-docker.git
cd screamingfrog-docker
\```

### Step 2: Build the Docker Image

Build the Docker image using the provided script. This script automatically retrieves the latest version of Screaming Frog SEO Spider from the official website and builds the Docker image with it:

\```sh
chmod +x build.sh
./build.sh
\```

This will build a Docker image tagged `screamingfrog`.

## Using the Docker Image

Once the image is built, you can run Screaming Frog SEO Spider using the following command:

\```sh
docker run -it -e SCREAMING_FROG_LICENSE=your_license_key_here -p 5900:5900 screamingfrog
\```

Replace `your_license_key_here` with your actual Screaming Frog SEO Spider license key. This will pass the license key to the Screaming Frog SEO Spider application inside the container, allowing it to run as a licensed version.

## Accessing the GUI Remotely

To access the GUI remotely, connect to the VNC server running inside the container using a VNC client. The server is running on port 5900, and the password is set in the `Dockerfile` (default is `1234`, change it to a secure password before building the image).

## Contributing

Feel free to contribute to this project by opening issues or submitting pull requests for improvements and bug fixes.

## License

This project is open-source and available under the MIT License.

## Contact

If you have any questions or suggestions, feel free to open an issue on this repository.

Thank you for using our Screaming Frog SEO Spider Docker image!
