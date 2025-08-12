# Processing

This service performs the following steps:

1. Capture an image from the device specified in its [*service.yaml* file](https://github.com/VU-ASE/imaging/blob/main/service.yaml)

![original_image](https://github.com/user-attachments/assets/3e289b3e-bbf6-4e8f-a0ae-c09787e71934)

2. Convert the RGB image to grayscale

![after_grayscale](https://github.com/user-attachments/assets/a9e00fec-eb06-43d1-ad5d-3b202db54001)


2. Convert the grayscale image to black and white via [*thresholding*](https://en.wikipedia.org/wiki/Thresholding_(image_processing)). The key parameter here is the threshold value which is fixed and can be tuned

![after_thresholding](https://github.com/user-attachments/assets/69987076-3d72-47d3-bed6-b540323e7865)

:::tip[thresholding]

Notice how there is clearly a white track, but with some additional artifacts from the floor's reflection. There are many techniques in dealing with such artifacts as well as ways in making the algorithm that follows more robust, however we won't dive into that here.

:::

3. Then, the algorithm for finding the edges is rather simple. It takes as input the binary image from Step 2 and makes a vertical scan up from the bottom center of the image, returning the y-coordinate of the first black pixel that it finds. If it doesn't find a black pixel after crossing the bottom half of the image, it simply returns the middle of the screen. This is then the place where a horizontal scan is taken with a similar approach to find the left and right edges of the track. In the example below, the red dot marks the result of the vertical scan, after which the two green dots mark the track edges after applying the horizontal scan. 

![with_points](https://github.com/user-attachments/assets/5b3c7df6-874a-4ec9-9d15-cb725457faf6) 

4. The image frame is converted to (low-resolution) JPEG bytes, and the track edges are encoded in the [`HorizontalScan` format](https://github.com/VU-ASE/rovercom/blob/c1d6569558e26d323fecc17d01117dbd089609cc/definitions/outputs/camera.proto#L42), which are written to the [`path` stream](https://github.com/VU-ASE/imaging/blob/1b16f3b453c8a564112f7ce9a0342be271e299a0/service.yaml#L15)
