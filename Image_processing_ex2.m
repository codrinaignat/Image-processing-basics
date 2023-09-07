Ioriginal = imread('cameraman.tif');
figure(1)
imshow(Ioriginal)
title('Imagine originala')
PSF = fspecial('motion',21,11);
Idouble = im2double(Ioriginal);
blurred = imfilter(Idouble,PSF,'conv','circular');
figure(2)
imshow(blurred)
title('Imagine incetosata (cu motion blur)')
wnr1 = deconvwnr(blurred,PSF);
figure(3)
imshow(wnr1)
title('magine cu blur restaurata')
noise_mean = 0;
noise_var = 0.0001;
blurred_noisy = imnoise(blurred,'gaussian',noise_mean,noise_var);
figure(4)
imshow(blurred_noisy)
title('Imagine cu blur si zgomot')
wnr2 = deconvwnr(blurred_noisy,PSF);
figure(5)
imshow(wnr2)
title('Imagine cu blur si zgomot restaurata (NSR = 0)')
signal_var = var(Idouble(:));
NSR = noise_var / signal_var;
wnr3 = deconvwnr(blurred_noisy,PSF,NSR);
figure(6)
imshow(wnr3)
title('Imagine cu blur si zgomot restaurata (NSR estimat)')
blurred_quantized = imfilter(Ioriginal,PSF,'conv','circular');
figure(7)
imshow(blurred_quantized)
title('Imagine cuantizata si cu blur')
wnr4 = deconvwnr(blurred_quantized,PSF);
figure(8)
imshow(wnr4)
title('Imagine cuantizata si cu blur, restaurata (NSR = 0)');
uniform_quantization_var = (1/256)^2 / 12;
signal_var = var(Idouble(:));
NSR = uniform_quantization_var / signal_var;
wnr5 = deconvwnr(blurred_quantized,PSF,NSR);
figure(9)
imshow(wnr5)
title(' Imagine cuantizata si cu blur, restaurata (NSR estimat)');

