**COMPARATIVE EXECUTION TIME & SHORT ANALYSIS OF THE PERFORMANCE OF THE KERNELS**

COMPARATIVE EXECUTION TIME & PERFORMANCE ANALYSIS OF KERNELS

The comparison of execution times between the C and assembly versions reveals substantial performance differences across multiple trials, shedding light on the efficiency of each implementation. In debug mode, with a vector size of \(2^{20}\), the C implementation demonstrates an average execution time of 0.0040 seconds, while the assembly implementation achieves a notably lower average execution time of 0.0020 seconds. Similarly, for vector sizes of \(2^{24}\) and \(2^{30}\), the C implementation records average execution times of 0.0688 and 57.3800 seconds, respectively, while the assembly implementation achieves 0.0372 and 55.8634 seconds for the corresponding vector sizes. These findings underscore a consistent performance advantage of the assembly implementation over its C counterpart, persisting across different vector sizes in debug mode.

In release mode, the comparison of execution times for \(2^{20}\), \(2^{24}\), and \(2^{28}\) vector sizes reveals a nuanced performance characteristic. For the \(2^{20}\) vector size, the C implementation achieves an average execution time of 0.0019 seconds, while the assembly implementation slightly trails with an average execution time of 0.0021 seconds. Similarly, for \(2^{24}\), the C implementation records an average execution time of 0.0315 seconds, whereas the assembly implementation clocks in at 0.0322 seconds. Lastly, for \(2^{28}\), the C implementation takes 0.5631 seconds on average, while the assembly implementation demonstrates improved performance with an average execution time of 0.4323 seconds.

While the assembly implementation maintains a slight disadvantage compared to the C implementation for smaller vector sizes in release mode, it shows a significant improvement in performance as the vector size increases. This trend suggests that the assembly implementation may be more efficient in handling larger datasets, potentially due to optimized low-level operations.

The assembly implementation outperforms the C implementation by approximately 50% to 66.67% across the various vector sizes in debug mode, reflecting its superior efficiency and speed in executing the dot product calculation task. This notable performance gain reaffirms the effectiveness of handcrafted assembly code in optimizing computational tasks and highlights the importance of low-level optimizations for enhancing overall performance.

Moreover, both implementations yield identical dot product values, indicating the accuracy and reliability of both approaches in computing the intended outcome. The stability of the dot product value across trials further reinforces the credibility and consistency of the experimental results obtained.

While the assembly implementation initially exhibits a slight disadvantage compared to the C implementation for smaller vector sizes in release mode, an intriguing observation arises when analyzing the \(2^{28}\) vector size. It was noted that this specific trial was conducted with all other running applications closed. This observation may suggest that environmental factors, such as system load, could impact the performance comparison between the C and assembly implementations. Additionally, the significant improvement in performance observed as the vector size increases further highlights the potential efficiency of the assembly implementation, potentially attributed to optimized low-level operations.

It's essential to note that the decision to use assembly should be made with careful consideration of factors such as target platform, performance requirements, and available development resources. While assembly prioritizes performance over portability and maintainability, these factors must be weighed against the potential benefits in terms of execution speed and efficiency.

In essence, the comparative analysis underscores the efficiency of the assembly implementation in achieving faster execution speeds compared to the C implementation across multiple trials in both debug and release modes. However, the decision to utilize assembly should be made judiciously, considering the trade-offs and potential for further optimization, to ensure that the chosen approach aligns with project requirements and development constraints.


**DEBUG OUTPUTS**

2^20
![debug-20](https://github.com/silleeSo/LBYARCH-MP2/assets/125237029/e9dc3bf6-40ce-4883-b45e-089e87482051)


2^24
![debug-24](https://github.com/silleeSo/LBYARCH-MP2/assets/125237029/1b874958-d539-43ed-9836-2a154d154b56)


2^30
![debug-30](https://github.com/silleeSo/LBYARCH-MP2/assets/125237029/e44c56c6-8093-47a6-b39c-f0c38660aa0a)


**RELEASE OUTPUTS**

2^20
![release-20](https://github.com/silleeSo/LBYARCH-MP2/assets/125237029/d058f8d7-137b-4554-82e4-84a4e770a499)


2^24
![release-24](https://github.com/silleeSo/LBYARCH-MP2/assets/125237029/9e254c1a-6a48-4644-9c9c-d6982cd5c175)


2^28 (size was decreased due to memory allocation failure)
![release 28- closed apps](https://github.com/silleeSo/LBYARCH-MP2/assets/125237029/0ba936f8-9251-4429-b4d7-a2a0bf0e809f)

