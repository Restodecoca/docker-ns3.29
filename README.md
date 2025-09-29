

# docker-ns3

This repository contains a Docker image configured with **NS-3.29** (Network Simulator 3), forked for use in Computer Networks classes.

The image allows running simulations in an isolated environment, without the need to install dependencies directly on the host operating system.

---

## Build the Image

Clone the repository:

```bash
git clone https://github.com/Restodecoca/docker-ns3.29
```

Then:

```bash
cd docker-ns3.29
```

and run:

```bash
docker build -t ryankurte/docker-ns3 .
```

This will create the image locally with all the requirements to compile and run NS-3.29.

---

## Running the Container

### Simple execution (no persistence):

```bash
docker run -it ryankurte/docker-ns3
```

---

## Example Simulation

Inside the container:

```bash
cd /usr/ns-allinone-3.29/ns-3.29
./waf build
./waf --run "scratch/second --nCsma=5 --csmaRate=50Mbps"
```

---

## Features Included

* NS-3.29 with examples and tests
* G++/Clang, Python3, CMake, nano, vim, TShark (CLI version of Wireshark)
* Support for command-line simulation parameters
* Source code available under `/usr/ns-allinone-3.29/ns-3.29`

---

## Educational Use

This fork has been adapted for teaching purposes, focusing on hands-on laboratory activities, including:

* Topologies with CSMA, Point-to-Point, and Wi-Fi
* Running custom scripts from `scratch/`
* Modifying network parameters via `CommandLine`

---

## Using with VS Code

This image can also be used with **Visual Studio Code** via the **Dev Containers extension**.
To use it:

1. Open VS Code.
2. Go to the *Remote Explorer* panel.
3. Locate and attach to your running container.

You can then work with NS-3 directly inside the Docker environment, with access to the terminal, compilers, and your source code.

---

## Requirements

* Docker installed (Linux, macOS, or Windows)
* ~5 GB of free disk space
* Optional: Visual Studio Code with Dev Containers extension
