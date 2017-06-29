Vim�UnDo� 0�~ߓU���Ѷ&B�^��M��%o�H�l,�x��   -                  '       '   '   '    Y"��    _�                     !       ����                                                                                                                                                                                                                                                                                                                            !          !          v       Y"mq     �       "   )      B  while (iterations++ < maxIterations && absSquared(z) < radius) {5�_�                    "        ����                                                                                                                                                                                                                                                                                                                            !          !          v       Y"mt    �   "   $   *          �   "   $   )    5�_�                    %   	    ����                                                                                                                                                                                                                                                                                                                            %          %   	       v   	    Y"m�    �   $   &   *        return (char) iterations;5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       Y"r�     �         *      M__device__ char calculatePixelValue(int width, int height, int maxIterations,5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Y"r�    �         *      I__device__  calculatePixelValue(int width, int height, int maxIterations,5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       Y"��    �         *      L__device__ int calculatePixelValue(int width, int height, int maxIterations,5�_�      	              *        ����                                                                                                                                                                                                                                                                                                                                                             Y"�x     �   *               �   *            5�_�      
          	   ,        ����                                                                                                                                                                                                                                                                                                                                                             Y"��     �   +   l   -       5�_�   	              
   ,        ����                                                                                                                                                                                                                                                                                                                            k           ,                   Y"��    �   +   l   l   @   V void save_image(const char *filename, int *dwells, int w, int h, int maxIterations) {      png_bytep row;         $   FILE *fp = fopen(filename, "wb");   R   png_structp png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, 0, 0, 0);    8   png_infop info_ptr = png_create_info_struct(png_ptr);      // exception handling      setjmp(png_jmpbuf(png_ptr));      png_init_io(png_ptr, fp);   '   // write header (8 bit colour depth)   (   png_set_IHDR(png_ptr, info_ptr, w, h,   :                8, PNG_COLOR_TYPE_RGB, PNG_INTERLACE_NONE,   A                PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);      // set title      png_text title_text;   6   title_text.compression = PNG_TEXT_COMPRESSION_NONE;      title_text.key = "Title";   &   title_text.text = "Mandelbrot set";   4   png_set_text(png_ptr, info_ptr, &title_text, 1);    %   png_write_info(png_ptr, info_ptr);          // write image data   6   row = (png_bytep) malloc(3 * w * sizeof(png_byte));       for (int y = 0; y < h; y++) {   "     for (int x = 0; x < w; x++) {          int r, g, b;   A       dwell_color(&r, &g, &b, dwells[y * w + x], maxIterations);   $       row[3 * x + 0] = (png_byte)r;   $       row[3 * x + 1] = (png_byte)g;   $       row[3 * x + 2] = (png_byte)b;   	     }      !     png_write_row(png_ptr, row);      }       png_write_end(png_ptr, NULL);          fclose(fp);   6   png_free_data(png_ptr, info_ptr, PNG_FREE_ALL, -1);   8   png_destroy_write_struct(&png_ptr, (png_infopp)NULL);      free(row);    }       1i/** gets the color, given the dwell (on host) */   I void dwell_color(int *r, int *g, int *b, int dwell, int maxIterations) {   1   int CUT_DWELL = maxIterations / DIVIDE_FACTOR;   "   // black for the Mandelbrot set      if(dwell >= maxIterations) {        *r = *g = *b = 0;      } else {        // cut at zero        if(dwell < 0)          dwell = 0;        if(dwell <= CUT_DWELL) {   +       // from black to blue the first half          *r = *g = 0;   ,       *b = 128 + dwell * 127 / (CUT_DWELL);        } else {   0       // from blue to white for the second half          *b = 255;   L       // *r = *g = (dwell - CUT_DWELL) * 255 / (maxIterations - CUT_DWELL);   Z       *r = *g = 256.0 * log2(1.75 + dwell - log2(log2(z))) / log2((double)maxIterations);        }      }    }  // dwell_color    5�_�   
                         ����                                                                                                                                                                                                                                                                                                                            k           ,                   Y"��     �         l       5�_�                            ����                                                                                                                                                                                                                                                                                                                            m           .                   Y"��    �         n       5�_�                    -        ����                                                                                                                                                                                                                                                                                                                            n           -           v       Y"�p    �   ,           B       Uvoid save_image(const char *filename, int *dwells, int w, int h, int maxIterations) {     png_bytep row;        #  FILE *fp = fopen(filename, "wb");   Q  png_structp png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, 0, 0, 0);    7  png_infop info_ptr = png_create_info_struct(png_ptr);     // exception handling     setjmp(png_jmpbuf(png_ptr));     png_init_io(png_ptr, fp);   &  // write header (8 bit colour depth)   '  png_set_IHDR(png_ptr, info_ptr, w, h,   9               8, PNG_COLOR_TYPE_RGB, PNG_INTERLACE_NONE,   @               PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);     // set title     png_text title_text;   5  title_text.compression = PNG_TEXT_COMPRESSION_NONE;     title_text.key = "Title";   %  title_text.text = "Mandelbrot set";   3  png_set_text(png_ptr, info_ptr, &title_text, 1);    $  png_write_info(png_ptr, info_ptr);         // write image data   5  row = (png_bytep) malloc(3 * w * sizeof(png_byte));     for (int y = 0; y < h; y++) {   !    for (int x = 0; x < w; x++) {         int r, g, b;   @      dwell_color(&r, &g, &b, dwells[y * w + x], maxIterations);   #      row[3 * x + 0] = (png_byte)r;   #      row[3 * x + 1] = (png_byte)g;   #      row[3 * x + 2] = (png_byte)b;       }           png_write_row(png_ptr, row);     }     png_write_end(png_ptr, NULL);         fclose(fp);   5  png_free_data(png_ptr, info_ptr, PNG_FREE_ALL, -1);   7  png_destroy_write_struct(&png_ptr, (png_infopp)NULL);     free(row);   }       0/** gets the color, given the dwell (on host) */   Hvoid dwell_color(int *r, int *g, int *b, int dwell, int maxIterations) {   0  int CUT_DWELL = maxIterations / DIVIDE_FACTOR;   !  // black for the Mandelbrot set     if(dwell >= maxIterations) {       *r = *g = *b = 0;   
  } else {       // cut at zero       if(dwell < 0)         dwell = 0;       if(dwell <= CUT_DWELL) {   *      // from black to blue the first half         *r = *g = 0;   +      *b = 128 + dwell * 127 / (CUT_DWELL);       } else {   /      // from blue to white for the second half         *b = 255;   K      // *r = *g = (dwell - CUT_DWELL) * 255 / (maxIterations - CUT_DWELL);   Y      *r = *g = 256.0 * log2(1.75 + dwell - log2(log2(z))) / log2((double)maxIterations);       }     }   }  // dwell_color        5�_�                    -        ����                                                                                                                                                                                                                                                                                                                                                             Y"��     �   ,               5�_�                   .        ����                                                                                                                                                                                                                                                                                                                                                             Y"��     �   -   8   /       5�_�                    /        ����                                                                                                                                                                                                                                                                                                                                                             Y"��     �   .   0   8      R >>inline void gpuAssert(cudaError_t code, const char *file, int line, bool abort)5�_�                    /        ����                                                                                                                                                                                                                                                                                                                            /           /                 Y"��     �   .   0   8      S >>inline void gpuAssert(cudaError_t code, const char *file, int line, bool abort)5�_�                    0        ����                                                                                                                                                                                                                                                                                                                            0           6                 Y"��   
 �   /   7   8         {         if (code != cudaSuccess)    
      {      W         fprintf(stderr,"GPUassert: %s %s %d\n", cudaGetErrorString(code), file, line);            if (abort) exit(code);   
      }         }5�_�                    4        ����                                                                                                                                                                                                                                                                                                                            0           6                 Y"�m    �   3   4                if (abort) exit(code);5�_�                    3       ����                                                                                                                                                                                                                                                                                                                            0           5                 Y"�t     �   2   4   7      T      fprintf(stderr,"GPUassert: %s %s %d\n", cudaGetErrorString(code), file, line);5�_�                    3        ����                                                                                                                                                                                                                                                                                                                            0           5                 Y"�v    �   2   4   7      U      fprintf(stderr,"]GPUassert: %s %s %d\n", cudaGetErrorString(code), file, line);5�_�                    3       ����                                                                                                                                                                                                                                                                                                                            0           5                 Y"��    �   2   4   7      V      fprintf(stderr,"[gpuAssert]: %s %s %d\n", cudaGetErrorString(code), file, line);5�_�                    3   #    ����                                                                                                                                                                                                                                                                                                                            0           5                 Y"��    �   2   4   7      V      fprintf(stdout,"[gpuAssert]: %s %s %d\n", cudaGetErrorString(code), file, line);5�_�                    3   "    ����                                                                                                                                                                                                                                                                                                                            0           5                 Y"��    �   2   4   7      X      fprintf(stdout,"[gpuAssert]: \t%s %s %d\n", cudaGetErrorString(code), file, line);5�_�                    3   '    ����                                                                                                                                                                                                                                                                                                                            3   '       3   (       v   (    Y"��    �   2   4   7      \      fprintf(stdout,"[gpuAssert]: *** \t%s %s %d\n", cudaGetErrorString(code), file, line);5�_�                    -        ����                                                                                                                                                                                                                                                                                                                            -           6           v        Y"�    �   ,                  A #define gpuErrchk(ans) { gpuAssert((ans), __FILE__, __LINE__); }   Oinline void gpuAssert(cudaError_t code, const char *file, int line, bool abort)   {      if (code != cudaSuccess)       {      Z      fprintf(stdout,"[gpuAssert]: *** %s %s %d\n", cudaGetErrorString(code), file, line);      }      }        5�_�                            ����                                                                                                                                                                                                                                                                                                                            -           -           v        Y"�a     �         -       5�_�                            ����                                                                                                                                                                                                                                                                                                                            /           /           v        Y"�c    �      ,   /       5�_�                            ����                                                                                                                                                                                                                                                                                                                            "                      v        Y"��    �         G          6 // This checks for a cudaError and exits the program    / // with EXIT_FAILURE if an error was detected.   3 #define cudaCheck(stmt)                          \   3 {                                                \   3   cudaError_t err = stmt;                        \   3   if (err != cudaSuccess) {                      \   3     printf("\nERROR ERROR ERROR\n");             \   3     printf("ERROR ERROR ERROR\n\n");             \   3     printf("\tFailed to run %s\n", #stmt);       \   3     gpuAssert((err), __FILE__, __LINE__);        \   3     printf("\nERROR ERROR ERROR\n");             \   3     printf("ERROR ERROR ERROR\n");               \   3     exit(EXIT_FAILURE);                          \   3   }                                              \    }     5�_�      !                       ����                                                                                                                                                                                                                                                                                                                                                          Y"��    �         7   	   P inline void gpuAssert(cudaError_t code, const char *file, int line, bool abort)    {       if (code != cudaSuccess)        {      [       fprintf(stdout,"[gpuAssert]: *** %s %s %d\n", cudaGetErrorString(code), file, line);       }       }        5�_�       "           !           ����                                                                                                                                                                                                                                                                                                                                                          Y"��     �                 5�_�   !   #           "           ����                                                                                                                                                                                                                                                                                                                                                          Y"��    �                 5�_�   "   $           #      B    ����                                                                                                                                                                                                                                                                                                                               B          M       v   M    Y"�j    �         5      Oinline void gpuAssert(cudaError_t code, const char *file, int line, bool abort)5�_�   #   %           $          ����                                                                                                                                                                                                                                                                                                                               B          M       v   M    Y"��     �         5      Z      fprintf(stdout,"[gpuAssert]: *** %s %s %d\n", cudaGetErrorString(code), file, line);5�_�   $   &           %          ����                                                                                                                                                                                                                                                                                                                                                v       Y"��    �         5      Y      printf(stdout,"[gpuAssert]: *** %s %s %d\n", cudaGetErrorString(code), file, line);5�_�   %   '           &           ����                                                                                                                                                                                                                                                                                                                                                  v       Y"��     �         5   
       Cinline void gpuAssert(cudaError_t code, const char *file, int line)   {      if (code != cudaSuccess)       {      R      printf("[gpuAssert]: *** %s %s %d\n", cudaGetErrorString(code), file, line);      }      }       // This computes ceil(x / y).5�_�   &               '           ����                                                                                                                                                                                                                                                                                                                                                  v       Y"��    �         ,      // This computes ceil(x / y).5�_�                    "        ����                                                                                                                                                                                                                                                                                                                            G           G           v        Y"��     �   !   #   G      v 5�_�                    .        ����                                                                                                                                                                                                                                                                                                                                                             Y"��     �   -   /   /   
   A #define gpuErrchk(ans) { gpuAssert((ans), __FILE__, __LINE__); }   R >>inline void gpuAssert(cudaError_t code, const char *file, int line, bool abort)        {   &             if (code != cudaSuccess)                         {      n                                fprintf(stderr,"GPUassert: %s %s %d\n", cudaGetErrorString(code), file, line);   ?                                         if (abort) exit(code);   3                                               }                      }    5�_�              	      ,        ����                                                                                                                                                                                                                                                                                                                                                             Y"�|     �   +   -   -   v   V void save_image(const char *filename, int *dwells, int w, int h, int maxIterations) {         png_bytep row;   	            *         FILE *fp = fopen(filename, "wb");   [            png_structp png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, 0, 0, 0);    D               png_infop info_ptr = png_create_info_struct(png_ptr);   '                  // exception handling   4                  //    setjmp(png_jmpbuf(png_ptr));   4                  //       png_init_io(png_ptr, fp);   B                  //          // write header (8 bit colour depth)   F                  //             png_set_IHDR(png_ptr, info_ptr, w, h,   G                  //                             8, PNG_COLOR_TYPE_RGB,   D                  //                             PNG_INTERLACE_NONE,   [                  //                                             PNG_COMPRESSION_TYPE_BASE,   W                  //                                             PNG_FILTER_TYPE_BASE);   P                  //                                                // set title   O                  //                                                   png_text   R                  //                                                   title_text;   `                  //                                                      title_text.compression   K                  //                                                      =   d                  //                                                      PNG_TEXT_COMPRESSION_NONE;   [                  //                                                         title_text.key   N                  //                                                         =   U                  //                                                         "Title";   _                  //                                                            title_text.text   Q                  //                                                            =   [                  //                                                            "Mandelbrot   U                  //                                                            set";   h                  //                                                               png_set_text(png_ptr,   \                  //                                                               info_ptr,   _                  //                                                               &title_text,   W                  //                                                               1);    m                  //                                                                  png_write_info(png_ptr,   `                  //                                                                  info_ptr);   W                  //                                                                      \                  //                                                                      //   _                  //                                                                      write   _                  //                                                                      image   ^                  //                                                                      data   `                  //                                                                         row   ^                  //                                                                         =   h                  //                                                                         (png_bytep)   e                  //                                                                         malloc(3   ^                  //                                                                         *   ^                  //                                                                         w   ^                  //                                                                         *   o                  //                                                                         sizeof(png_byte));   c                  //                                                                            for   d                  //                                                                            (int   a                  //                                                                            y   a                  //                                                                            =   b                  //                                                                            0;   a                  //                                                                            y   a                  //                                                                            <   b                  //                                                                            h;   d                  //                                                                            y++)   a                  //                                                                            {   h                  //                                                                                 for   i                  //                                                                                 (int   f                  //                                                                                 x   f                  //                                                                                 =   g                  //                                                                                 0;   f                  //                                                                                 x   f                  //                                                                                 <   g                  //                                                                                 w;   i                  //                                                                                 x++)   f                  //                                                                                 {   o                  //                                                                                        int   n                  //                                                                                        r,   n                  //                                                                                        g,   n                  //                                                                                        b;   �                  //                                                                                               dwell_color(&r,   v                  //                                                                                               &g,   v                  //                                                                                               &b,   {                  //                                                                                               dwells[y   t                  //                                                                                               *   t                  //                                                                                               w   t                  //                                                                                               +   v                  //                                                                                               x],   �                  //                                                                                               maxIterations);                     //                                                                                                      row[3   {                  //                                                                                                      *   {                  //                                                                                                      x   {                  //                                                                                                      +   |                  //                                                                                                      0]   {                  //                                                                                                      =   �                  //                                                                                                      (png_byte)r;   �                  //                                                                                                             row[3   �                  //                                                                                                             *   �                  //                                                                                                             x   �                  //                                                                                                             +   �                  //                                                                                                             1]   �                  //                                                                                                             =   �                  //                                                                                                             (png_byte)g;   �                  //                                                                                                                    row[3   �                  //                                                                                                                    *   �                  //                                                                                                                    x   �                  //                                                                                                                    +   �                  //                                                                                                                    2]   �                  //                                                                                                                    =   �                  //                                                                                                                    (png_byte)b;   �                  //                                                                                                                         }      �                  //                                                                                                                              png_write_row(png_ptr,   �                  //                                                                                                                              row);   �                  //                                                                                                                                 }   �                  //                                                                                                                                    png_write_end(png_ptr,   �                  //                                                                                                                                    NULL);   �                  //                                                                                                                                        �                  //                                                                                                                                        fclose(fp);   �                  //                                                                                                                                           png_free_data(png_ptr,   �                  //                                                                                                                                           info_ptr,   �                  //                                                                                                                                           PNG_FREE_ALL,   �                  //                                                                                                                                           -1);   �                  //                                                                                                                                              png_destroy_write_struct(&png_ptr,   �                  //                                                                                                                                              (png_infopp)NULL);   �                  //                                                                                                                                                 free(row);   �                  //                                                                                                                                                  }                     //5��