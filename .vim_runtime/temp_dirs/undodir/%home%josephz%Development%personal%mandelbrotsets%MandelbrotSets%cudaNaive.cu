Vim�UnDo� �旜�۷��L�v�|�@�����k@I��   O                 L       L   L   L    Y/��    _�                     6       ����                                                                                                                                                                                                                                                                                                                                                             Y,q3     �   5   7   �      |  mandelbrot_k<<<gridSize, blockSize>>>(d_output, width, height, maxIterations, radius, complex(-1.5, -1), complex(0.5, 1));5�_�                    6       ����                                                                                                                                                                                                                                                                                                                                                             Y,q3     �   5   7   �      {  andelbrot_k<<<gridSize, blockSize>>>(d_output, width, height, maxIterations, radius, complex(-1.5, -1), complex(0.5, 1));5�_�                    6       ����                                                                                                                                                                                                                                                                                                                                                             Y,q3     �   5   7   �      z  ndelbrot_k<<<gridSize, blockSize>>>(d_output, width, height, maxIterations, radius, complex(-1.5, -1), complex(0.5, 1));5�_�                    6       ����                                                                                                                                                                                                                                                                                                                                                             Y,q3     �   5   7   �      y  delbrot_k<<<gridSize, blockSize>>>(d_output, width, height, maxIterations, radius, complex(-1.5, -1), complex(0.5, 1));5�_�                    6       ����                                                                                                                                                                                                                                                                                                                                                             Y,q3     �   5   7   �      x  elbrot_k<<<gridSize, blockSize>>>(d_output, width, height, maxIterations, radius, complex(-1.5, -1), complex(0.5, 1));5�_�                    6       ����                                                                                                                                                                                                                                                                                                                                                             Y,q3     �   5   7   �      w  lbrot_k<<<gridSize, blockSize>>>(d_output, width, height, maxIterations, radius, complex(-1.5, -1), complex(0.5, 1));5�_�                    6       ����                                                                                                                                                                                                                                                                                                                                                             Y,q4     �   5   7   �      v  brot_k<<<gridSize, blockSize>>>(d_output, width, height, maxIterations, radius, complex(-1.5, -1), complex(0.5, 1));5�_�      	              6       ����                                                                                                                                                                                                                                                                                                                                                             Y,q4     �   5   7   �      u  rot_k<<<gridSize, blockSize>>>(d_output, width, height, maxIterations, radius, complex(-1.5, -1), complex(0.5, 1));5�_�      
           	   6       ����                                                                                                                                                                                                                                                                                                                                                             Y,q4     �   5   7   �      t  ot_k<<<gridSize, blockSize>>>(d_output, width, height, maxIterations, radius, complex(-1.5, -1), complex(0.5, 1));5�_�   	              
   6       ����                                                                                                                                                                                                                                                                                                                                                             Y,q4     �   5   7   �      s  t_k<<<gridSize, blockSize>>>(d_output, width, height, maxIterations, radius, complex(-1.5, -1), complex(0.5, 1));5�_�   
                 6       ����                                                                                                                                                                                                                                                                                                                                                             Y,q6     �   5   7   �      r  _k<<<gridSize, blockSize>>>(d_output, width, height, maxIterations, radius, complex(-1.5, -1), complex(0.5, 1));5�_�                    6       ����                                                                                                                                                                                                                                                                                                                                                             Y,q6     �   5   7   �      q  k<<<gridSize, blockSize>>>(d_output, width, height, maxIterations, radius, complex(-1.5, -1), complex(0.5, 1));5�_�                   6       ����                                                                                                                                                                                                                                                                                                                            4          4              !    Y,q@    �   5   8   �      p  <<<gridSize, blockSize>>>(d_output, width, height, maxIterations, radius, complex(-1.5, -1), complex(0.5, 1));    �   6   7   �    5�_�                    6   p    ����                                                                                                                                                                                                                                                                                                                            4          4              !    Y,qM     �   5   7   �      �  cudaNaiveMandelbrotSetsKernel<<<gridSize, blockSize>>>(d_output, width, height, maxIterations, radius, complex(-1.5, -1), complex(0.5, 1));5�_�                    6   �    ����                                                                                                                                                                                                                                                                                                                            4          4              !    Y,qP    �   5   7   �      �  cudaNaiveMandelbrotSetsKernel<<<gridSize, blockSize>>>(d_output, width, height, maxIterations, radius, complexNum(-1.5, -1), complex(0.5, 1));5�_�                    x   ?    ����                                                                                                                                                                                                                                                                                                                            x   ?       y   %       v���    Y,q�    �   w   z   �      @  int width, int height, int maxIterations, const float radius,    %  complexNum cmin, complexNum cmax) {5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          v       Y,q�     �      �   �      4    complexNum cMin, complexNum cMax, x, y, radius);5�_�                    �   
    ����                                                                                                                                                                                                                                                                                                                            �          �   
       v   
    Y,q�     �      �   �      )    cMin, complexNum cMax, x, y, radius);5�_�                    y       ����                                                                                                                                                                                                                                                                                                                            �          �   
       v   
    Y,q�     �   x   z   �      '    complexNum cmin, complexNum cmax) {5�_�                    y   "    ����                                                                                                                                                                                                                                                                                                                            �          �   
       v   
    Y,q�    �   x   z   �      '    complexNum cMin, complexNum cmax) {5�_�                    &       ����                                                                                                                                                                                                                                                                                                                            �          �   
       v   
    Y,r�     �   %   &          =	cudaCheck(cudaMalloc(&d_operations, sizeof(long long int)));5�_�                    (       ����                                                                                                                                                                                                                                                                                                                                         
       v   
    Y,r�     �   '   (          	// Set operations to 0.5�_�                    (       ����                                                                                                                                                                                                                                                                                                                            ~          ~   
       v   
    Y,r�     �   '   (          b	cudaCheck(cudaMemcpy(d_operations, h_operations, sizeof(long long int), cudaMemcpyHostToDevice));5�_�                    (       ����                                                                                                                                                                                                                                                                                                                            }          }   
       v   
    Y,r�     �   '   (          		 5�_�                    9       ����                                                                                                                                                                                                                                                                                                                            |          |   
       v   
    Y,r�     �   8   9          b	cudaCheck(cudaMemcpy(h_operations, d_operations, sizeof(long long int), cudaMemcpyDeviceToHost));5�_�                    <        ����                                                                                                                                                                                                                                                                                                                            {          {   
       v   
    Y,r�     �   ;   <          	cudaFree(d_operations);5�_�                    @        ����                                                                                                                                                                                                                                                                                                                            z          z   
       v   
    Y,r�     �   ?   @          	g_operations = *h_operations;5�_�                    B        ����                                                                                                                                                                                                                                                                                                                            y          y   
       v   
    Y,r�     �   A   B          	free(h_operations);5�_�                    !        ����                                                                                                                                                                                                                                                                                                                            x          x   
       v   
    Y,r�     �       !          Q	long long int *h_operations = (long long int*) calloc(1, sizeof(long long int));5�_�                     $        ����                                                                                                                                                                                                                                                                                                                            w          w   
       v   
    Y,r�    �   #   $          	long long int *d_operations;5�_�      !               "       ����                                                                                                                                                                                                                                                                                                                            "          "   ,       v   -    Y,r�    �   !   #   x      .	// Device output setup: image and operations.5�_�       #           !          ����                                                                                                                                                                                                                                                                                                                                         /       v   0    Y,r�   
 �         x      1	// Host input setup: image and operations count.5�_�   !   $   "       #   6       ����                                                                                                                                                                                                                                                                                                                                         /       v   0    Y,s     �   6   ;   y        �   6   8   x    5�_�   #   %           $   9        ����                                                                                                                                                                                                                                                                                                                                         /       v   0    Y,s+     �   8   <   |       5�_�   $   &           %   :        ����                                                                                                                                                                                                                                                                                                                                         /       v   0    Y,s2     �   9   ;   ~       5�_�   %   '           &   :       ����                                                                                                                                                                                                                                                                                                                                         /       v   0    Y,s=     �   9   ;   ~            printf("%d ")5�_�   &   (           '   :   +    ����                                                                                                                                                                                                                                                                                                                                         /       v   0    Y,sK     �   9   ;   ~      +      printf("%d ", h_output[i * width + j)5�_�   '   )           (   ;       ����                                                                                                                                                                                                                                                                                                                                         /       v   0    Y,sN    �   :   =   ~          }5�_�   (   *           )          ����                                                                                                                                                                                                                                                                                                                               9                        Y,s�    �               e    const float zoom, const float yPos, const float xPos, const float radius, const char *filename) {5�_�   )   +           *          ����                                                                                                                                                                                                                                                                                                                               9                        Y,s�     �               P__host__ void cudaNaiveMandelbrotSets(int height, int width, int maxIterations,    +const float radius, const char *filename) {�               /    const float radius, const char *filename) {5�_�   *   ,           +      d    ����                                                                                                                                                                                                                                                                                                                               �          T              Y,s�    �         ~      {__host__ void cudaNaiveMandelbrotSets(int height, int width, int maxIterations, const float radius, const char *filename) {5�_�   +   -           ,   8       ����                                                                                                                                                                                                                                                                                                                            8          =          v       Y,t	     �   7   9         $  for (int i = 0; i < height; ++i) {   %    for (int j = 0; j < width; ++j) {   -      printf("%d ", h_output[i * width + j]);       }       printf("\n");     }5�_�   ,   .           -   8       ����                                                                                                                                                                                                                                                                                                                            8          8          v       Y,t	     �   7   8            5�_�   -   /           .   8        ����                                                                                                                                                                                                                                                                                                                            8          8          v       Y,t	    �   7   8           5�_�   .   0           /   <       ����                                                                                                                                                                                                                                                                                                                            8          8          v       Y,z`     �   ;   <          (	//fwrite(h_output, OUTPUT_SIZE, 1, fp);5�_�   /   1           0   .   ;    ����                                                                                                                                                                                                                                                                                                                            /   V       .   ;       v���    Y,ze     �   -   /   w      ;	// cudaNaiveMandelbrotSetsKernel<<<gridSize, blockSize>>>(   W	// 	 height, width, maxIterations, zoom, yPos, xPos, radius, d_output, d_operations); 5�_�   0   2           1   .       ����                                                                                                                                                                                                                                                                                                                            .   �       .   ;       v���    Y,ze     �   -   .          ;	// cudaNaiveMandelbrotSetsKernel<<<gridSize, blockSize>>>(5�_�   1   3           2   ?        ����                                                                                                                                                                                                                                                                                                                            ?           h           v        Y,zr     �   >   @   u   +   [// __global__ void cudaNaiveMandelbrotSetsKernel(int height, int width, int maxIterations,    R//      const float zoom, const float yPos, const float xPos, const float radius,    5//      int *d_output, long long int *d_operations) {   0//   double newRe, newIm, oldRe, oldIm, pr, pi;         +//   // Naively iterate through each pixel.   3//   int y = threadIdx.y + blockDim.y * blockIdx.y;   3//   int x = threadIdx.x + blockDim.x * blockIdx.x;        O//   // BUGBUG josephz: A column of pixels on the right hand side seems to have   M//   // been lost, either as a black bar, or distorted white and black noise.   +//   if (x >= width || y >= height) return;         G//   // Calculate Z from the pixel location, zoom, and position values.   H//   pr = 1.5 * (x - width / 2) / (0.5 * zoom * width) + xPos; // 8 Ops.   H//   pi = (y - height / 2) / (0.5 * zoom * height) + yPos;     // 7 Ops.   2//   newRe = newIm = oldRe = oldIm = 0; // 4 Ops.    //   int i;   4//   for(i = 0; i < maxIterations; i++) {  // 3 Ops.   //     oldRe = newRe;   //     oldIm = newIm;   3//     newRe = oldRe * oldRe - oldIm * oldIm + pr;    1//     newIm = 2 * oldRe * oldIm + pi; // 11 Ops.   8//     // Stop once our point exceeds the target radius.   D//     if((newRe * newRe + newIm * newIm) > radius) break; // 4 Ops.   	//   }          //   // 43 Ops.         E//   // If iteration limit is reached, fill black. Colored otherwise.   &//   int output_index = width * y + x;   //   if(i == maxIterations) {   "//     d_output[output_index] = 0;   	//   }      //   else {   6//     double z = sqrt(newRe * newRe + newIm * newIm);   ]//     int brightness = 256.0 * log2(1.75 + i - log2(log2(z))) / log2((double)maxIterations);   +//     d_output[output_index] = brightness;   //   }   //   *d_operations += 56;   // }        5�_�   2   4           3   ?        ����                                                                                                                                                                                                                                                                                                                            ?           ?           v        Y,zs    �   >   ?           5�_�   3   5           4   J        ����                                                                                                                                                                                                                                                                                                                            ?           ?           v        Y,zu    �   J            5�_�   4   6           5          ����                                                                                                                                                                                                                                                                                                                            ?           ?           v        Y,�     �         K          const char *filename) {5�_�   5   7           6   .   i    ����                                                                                                                                                                                                                                                                                                                            ?           ?           v        Y,�     �   -   0   K      �  cudaNaiveMandelbrotSetsKernel<<<gridSize, blockSize>>>(d_output, width, height, maxIterations, radius, complexNum(-1.5, -1), complexNum(0.5, 1));5�_�   6   8           7   /       ����                                                                                                                                                                                                                                                                                                                            /          /   .          /    Y,�     �   .   0   L      1      complexNum(-1.5, -1), complexNum(0.5, 1));5�_�   7   9           8   /       ����                                                                                                                                                                                                                                                                                                                            /          /   .          /    Y,�    �   -   0   L      i  cudaNaiveMandelbrotSetsKernel<<<gridSize, blockSize>>>(d_output, width, height, maxIterations, radius,    );�   .   0   L           );5�_�   8   :           9           ����                                                                                                                                                                                                                                                                                                                            .   n       .   �          /    Y.u�    �                #include "cudaCommon.h"5�_�   9   ;           :   :        ����                                                                                                                                                                                                                                                                                                                                                             Y/K    �   9   ;          ?  save_image(filename, h_output, width, height, maxIterations);5�_�   :   <           ;   /        ����                                                                                                                                                                                                                                                                                                                                                             Y/S�     �   .   1   K       5�_�   ;   =           <   /        ����                                                                                                                                                                                                                                                                                                                                                             Y/S�     �   .   1   L       5�_�   <   >           =   /        ����                                                                                                                                                                                                                                                                                                                                                             Y/S�     �   .   0   M      #cudaCheck(cudaThreadSynchronize());5�_�   =   ?           >   0        ����                                                                                                                                                                                                                                                                                                                                                             Y/S�     �   .   0   M      %  cudaCheck(cudaThreadSynchronize());    �   /   1   M       5�_�   >   @           ?   .       ����                                                                                                                                                                                                                                                                                                                                                             Y/S�    �   -   1   L            cMin, cMax);5�_�   ?   A           @   5        ����                                                                                                                                                                                                                                                                                                                                                             Y/��     �   5   8   O        �   5   7   N    5�_�   @   B           A   8       ����                                                                                                                                                                                                                                                                                                                            8          ?          v       Y/��     �   7   @   P      	// Copy output and operations.   X	cudaCheck(cudaMemcpy(h_output, d_output, OUTPUT_SIZE, cudaMemcpyDeviceToHost));               	// Free output and operations.   	cudaFree(d_output);         // Write to output.   >  saveImage(filename, h_output, width, height, maxIterations);5�_�   A   C           B   @        ����                                                                                                                                                                                                                                                                                                                            8          ?          v       Y/��    �   ?   B   P       5�_�   B   D           C   ;        ����                                                                                                                                                                                                                                                                                                                            ;           =           v        Y/��     �   :   <   Q      "    // Free output and operations.       cudaFree(d_output);           // Write to output.5�_�   C   E           D   >        ����                                                                                                                                                                                                                                                                                                                            ;           ;           v        Y/��     �   =   B   N       �   >   ?   N    5�_�   D   F           E   >        ����                                                                                                                                                                                                                                                                                                                            >           @           v        Y/��     �   =   A   Q      "    // Free output and operations.       cudaFree(d_output);    5�_�   E   G           F   @        ����                                                                                                                                                                                                                                                                                                                            >           @           v        Y/��     �   ?   @           5�_�   F   H           G   @        ����                                                                                                                                                                                                                                                                                                                            >           @           v        Y/��     �   ?   @           5�_�   G   I           H   >       ����                                                                                                                                                                                                                                                                                                                            >          >          v       Y/��    �   =   ?   O         // Free output and operations.5�_�   H   J           I   8       ����                                                                                                                                                                                                                                                                                                                            8          8           v        Y/��     �   7   9   O      "    // Copy output and operations.5�_�   I   K           J   7        ����                                                                                                                                                                                                                                                                                                                            8          8           v        Y/��    �   6   7           5�_�   J   L           K   =       ����                                                                                                                                                                                                                                                                                                                            7          7           v        Y/��     �   <   >   O        // Free output.    �   =   ?   O        // �   =   ?   N    5�_�   K               L   <       ����                                                                                                                                                                                                                                                                                                                            7          7           v        Y/��    �   ;   >   N        } 5�_�   !           #   "           ����                                                                                                                                                                                                                                                                                                                                         /       v   0    Y,r�   	 �      !        5�_�                    6       ����                                                                                                                                                                                                                                                                                                                            4          4              !    Y,q?     �   6   7   �    �   5   8   �      �  <cudaNaiveMandelbrotSetsKernel<<gridSize, blockSize>>>(d_output, width, height, maxIterations, radius, complex(-1.5, -1), complex(0.5, 1));    5��