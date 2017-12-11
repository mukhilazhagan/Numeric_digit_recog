%Shounak Mukherjee [UFID:13769482]

% Write code in your favorite language to construct the Gaussian, first-derivative, and
% second-derivative kernels, all parameterized by the standard deviation s. Then write code
% to apply these kernels to a grayscale image, computing the smoothed image, the gradient
% components in x and y, the gradient magnitude, and the LoG.

%Clear all variables
clear all; close all; clc;

sigma = 3;
I = imread('swan.pgm');
[img_h, img_w] = size(I);
figure; imshow(I);
title('Original Image');

%Construction of Gaussian kernel
gauss = createGaussianKernel(sigma);
figure,plot(gauss);
%Computing smoothed image
I_smooth = convolveSeparable(I, gauss, gauss);
figure; imshow(I_smooth, []);
title(['Smoothing with a sigma = ' num2str(sigma) ' Gaussian filter']);

%Construction of first derivative kernel
gauss_1deriv = createGaussianDerivativeKernel(sigma);

%Construction second-derivative kernel
gauss_2deriv = gaussianSecondDeivativeKernel(sigma);


%Computing Gradient components in x and y
Gx = convolveSeparable2(I, gauss_1deriv, gauss);
Gy = convolveSeparable(I, gauss, gauss_1deriv);

figure; imshow(Gx, []); title('Gradient component in x');
figure; imshow(Gy, []); title('Gradient component in y');

%Computing Gradient Magnitude
Gmag = Gx + Gy;
figure; imshow(Gmag, []); title('Gradient Magnitude');

%Compute LoG
Gx2 = convolveSeparable2(I, gauss_2deriv, gauss);
G2y = convolveSeparable2(I, gauss, gauss_2deriv);

LoG = Gx2 + G2y;
figure; imshow(LoG, []); title('LoG');
