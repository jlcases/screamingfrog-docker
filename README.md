# Screaming Frog SEO Spider Docker Image for Google Cloud Platform

This repository contains the necessary files to build a Docker image for the [Screaming Frog SEO Spider](https://www.screamingfrog.co.uk/seo-spider/), a powerful and fast SEO site audit tool. This Docker image is configured to be deployed on Google Cloud Platform, allowing multiple users to access Screaming Frog SEO Spider simultaneously.

As the Chief Product & Technology Officer at Rankia, responsible for Technical SEO, I encountered exceedingly high costs while using Oncrawl. To mitigate this, I decided to create this cost-effective solution for my team. When used in conjunction with BigQuery and Metabase, this setup can save you thousands of dollars per year.

## Prerequisites

- [Docker](https://www.docker.com/get-started) installed on your system.
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) installed and configured.
- A Google Cloud Platform account with necessary permissions to create and manage Kubernetes clusters and Container Registry.

## Building the Docker Image with Container Registry

### Step 1: Clone the Repository

Clone this repository to your local system:

\```sh
git clone -b google-cloud-platform https://github.com/jlcases/screamingfrog-docker.git
cd screamingfrog-docker
\```

### Step 2: Build the Docker Image

Build the Docker image using Google Cloud Container Registry:

\```sh
gcloud builds submit --tag gcr.io/YOUR_PROJECT_ID/screamingfrog .
\```

Replace `YOUR_PROJECT_ID` with your actual Google Cloud project ID.

## Deploying to Kubernetes Autopilot

### Step 1: Create a Kubernetes Cluster

Create a Kubernetes Autopilot cluster in your Google Cloud project:

\```sh
gcloud container clusters create-auto YOUR_CLUSTER_NAME --region YOUR_REGION
\```

Replace `YOUR_CLUSTER_NAME` with a name for your cluster and `YOUR_REGION` with your preferred Google Cloud region.

### Step 2: Deploy Screaming Frog SEO Spider

Deploy Screaming Frog SEO Spider to your Kubernetes cluster:

\```sh
kubectl apply -f deployment.yaml
\```

### Step 3: Accessing the GUI Remotely

To access the GUI remotely, follow the instructions in the `deployment.yaml` file to set up a service that allows remote access to the Screaming Frog SEO Spider GUI.

## Contributing

Feel free to contribute to this project by opening issues or submitting pull requests for improvements and bug fixes.

## License

This project is open-source and available under the MIT License.

## Contact

If you have any questions or suggestions, feel free to open an issue on this repository.

Thank you for using our Screaming Frog SEO Spider Docker image!
