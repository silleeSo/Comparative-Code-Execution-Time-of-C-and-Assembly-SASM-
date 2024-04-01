**COMPARATIVE EXECUTION TIME & SHORT ANALYSIS OF THE PERFORMANCE OF THE KERNELS**

The comparison of execution times between the C and assembly versions indicates considerable performance disparities. The assembly implementation runs in around 2 milliseconds (0.002 seconds), whereas the C program takes about 6 milliseconds (0.006 seconds), as seen in the attached image. This implies a significant speed advantage for the assembly implementation, which completes the computation in one-third the time as the C code.

The assembly implementation outperforms the C implementation by approximately 66.67%. This benefit is computed by subtracting the assembly execution time from the C execution time, dividing by the latter, and multiplying by 100%. This increase in performance highlights the assembly implementation's efficiency as compared to its C counterpart.

Furthermore, both implementations give identical dot product values, demonstrating the methods' validity. The dot product value remains stable at 384306618446392192.0000, regardless of whether it is calculated in C or assembly code. This consistency assures that both implementations are reliable and accurate in computing the intended outcome.

While the assembly implementation provides significant performance benefits, other optimization opportunities may emerge. Loop unrolling, instruction scheduling, and SIMD instructions have the potential to improve performance even further. However, it is critical to balance these possible benefits with the greater complexity and lower maintainability of the assembly code.

The assembly implementation prioritizes performance over portability and maintainability. Assembly code is fundamentally platform-specific and may be more difficult to maintain than higher-level languages like as C. As a result, the option to use assembly should take into account the target platform, performance requirements, and available development resources.

In essence, the assembly implementation outperforms the C implementation by obtaining faster execution speeds. However, the option to use assembly should be carefully assessed against the benefits of maintainability, portability, and the opportunity for more optimization.


**C WITH ASSEMBLY OUTPUTS**

![Kernel Assembly and C Outputs](https://github.com/silleeSo/LBYARCH-MP2/assets/71592267/5cb257be-46e0-4195-91e8-b0b46aa149d7)