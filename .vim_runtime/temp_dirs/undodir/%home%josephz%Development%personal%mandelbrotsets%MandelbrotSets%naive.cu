Vim�UnDo� +V������v��Z��-X�-�%c�1�ĝd   -                                   Y/��    _�                     )       ����                                                                                                                                                                                                                                                                                                                                                             Y,v�    �   (   *   /      \     h_output = calculatePixelValue(width, height, maxIterations, cMin, cMax, x, y, radius);5�_�                    )       ����                                                                                                                                                                                                                                                                                                                                                             Y,xr     �   (   *   /      k     h_output[x * width + y] = calculatePixelValue(width, height, maxIterations, cMin, cMax, x, y, radius);5�_�                    )       ����                                                                                                                                                                                                                                                                                                                                                             Y,xu    �   (   *   /      k     h_output[y * width + y] = calculatePixelValue(width, height, maxIterations, cMin, cMax, x, y, radius);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Y.u�    �                #include "cudaCommon.h"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Y/F*     �                M//  Each iteration the newZ is calculated from the square of the prevZ summed5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Y/F+     �                9//  with the current pixel value. We begin at the origin.5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Y/F+    �                //5�_�      	              )       ����                                                                                                                                                                                                                                                                                                                                                             Y/J�    �   (   *   +      ?  save_image(filename, h_output, width, height, maxIterations);5�_�      
           	   (        ����                                                                                                                                                                                                                                                                                                                                                             Y/�t     �   (   *   ,        �   (   *   +    5�_�   	              
   *        ����                                                                                                                                                                                                                                                                                                                                                             Y/��     �   )   +   ,      >  saveImage(filename, h_output, width, height, maxIterations);5�_�   
                  *   @    ����                                                                                                                                                                                                                                                                                                                                                             Y/��    �   )   ,   ,      @    saveImage(filename, h_output, width, height, maxIterations);5��