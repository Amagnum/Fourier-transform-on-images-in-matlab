
% reading the image
A = imread('cameraman.tif');
B = imread('pout.tif');
B = imresize(B,size(A));

figure, imshow(A);
figure, imshow(B);

%Taking fast fourier transform, 2 is because we are considering 2d matrix
ft_A = fft2(A);
ft_B = fft2(B);

%figure, imshow(ft_A,[]);
%figure, imshow(ft_B,[]);

% Shifting the transformation to center
ft_A_shifted = fftshift(ft_A);
ft_B_shifted = fftshift(ft_B);

%figure, imshow(ft_B_shifted,[]);

% To display the transformation properly, we take log()
figure, imshow(log(1+ft_A_shifted),[]);
figure, imshow(log(1+ft_B_shifted),[]);

mag_A = abs(ft_A);
mag_B = abs(ft_B);

phase_A = angle(ft_A);
phase_B = angle(ft_B);

new_ft_AB = mag_A.*exp(1i*phase_B);
new_ft_BA = mag_B.*exp(1i*phase_A);

figure, imshow(log(1+fftshift(new_ft_AB)),[]);
figure, imshow(log(1+fftshift(new_ft_BA)),[]);

% Taking inverse fourrie transformation
img_from_ft = ifft2(new_ft_AB);
figure, imshow(uint8(img_from_ft));

img_from_ft = ifft2(new_ft_BA);
figure, imshow(uint8(img_from_ft));
