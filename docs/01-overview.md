import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# Overview

## Purpose 

The `imaging` service captures an image frame from a USB webcam using `gstreamer`. It then does some processing and finds the edges of the NXP cup track. This data can be used by another service to then drive and steer on.

## Installation

To install this service, the latest release of [`roverctl`](https://ase.vu.nl/docs/framework/Software/rover/roverctl/installation) should be installed for your system and your Rover should be powered on.

<Tabs groupId="installation-method">
<TabItem value="roverctl" label="Using roverctl" default>

1. Install the service from your terminal
```bash
# Replace ROVER_NUMBER with your the number label on your Rover (e.g. 7)
roverctl service install -r <ROVER_NUMBER> https://github.com/VU-ASE/imaging/releases/latest/download/imaging.zip 
```

</TabItem>
<TabItem value="roverctl-web" label="Using roverctl-web">

1. Open `roverctl-web` for your Rover
```bash
# Replace ROVER_NUMBER with your the number label on your Rover (e.g. 7)
roverctl -r <ROVER_NUMBER>
```
2. Click on "install a service" button on the bottom left, and click "install from URL"
3. Enter the URL of the latest release:
```
https://github.com/VU-ASE/imaging/releases/latest/download/imaging.zip 
```

</TabItem>
</Tabs>

Follow [this tutorial](https://ase.vu.nl/docs/tutorials/write-a-service/upload) to understand how to use an ASE service. You can find more useful `roverctl` commands [here](/docs/framework/Software/rover/roverctl/usage)

## Requirements

- A USB camera should be connected to your Rover. By default, this service will attempt to read from a 30fps 640x480 camera on /dev/video2
    - If you want to use another camera, you should modify this service's [*service.yaml*](https://github.com/VU-ASE/imaging/blob/1b16f3b453c8a564112f7ce9a0342be271e299a0/service.yaml#L32) and upload your service again.

## Inputs

As defined in the [*service.yaml*](https://github.com/VU-ASE/imaging/blob/main/service.yaml), this service does not depend on any other service.

## Outputs

As defined in the [*service.yaml*](https://github.com/VU-ASE/imaging/blob/main/service.yaml), this service exposes the following write streams:

- `path`:
    - To this stream, [`CameraSensorOutput`](https://github.com/VU-ASE/rovercom/blob/main/definitions/outputs/camera.proto) messages will be written. Each message will be wrapped in a [`SensorOutput` wrapper message](https://github.com/VU-ASE/rovercom/blob/main/definitions/outputs/wrapper.proto)
