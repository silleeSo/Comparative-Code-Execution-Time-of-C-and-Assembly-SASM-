**COMPARATIVE EXECUTION TIME & SHORT ANALYSIS OF THE PERFORMANCE OF THE KERNELS**

The comparison of execution times between the C and assembly versions reveals significant performance variations across numerous trials, providing insight into the efficiency of each implementation. In debug mode, with a vector size of 2 raised to 20, the C code has an average execution time of 0.0040 seconds, whereas the assembly implementation has a significantly lower average execution time of 0.0020 seconds. Similarly, for vector sizes of 2 raised to 24 and 2 raised to 30, the C implementation has average execution times of 0.0688 and 57.3800 seconds, respectively, but the assembly implementation has 0.0372 and 55.8634 seconds. These data highlight a continuous performance advantage of the assembly implementation over its C counterpart, which persists across varied vector sizes in debug mode.

In release mode, comparing execution durations for 2 raised to 20, 2 raised to 24, and 2 raised to 28 vector sizes reveals a minor performance difference. For the 2 raised to 20 vector size, the C implementation has an average execution time of 0.0019 seconds, while the assembly implementation has a slightly slower average execution time of 0.0021 seconds. Similarly, for 2 raised to 24, the C implementation has an average execution time of 0.0315 seconds, while the assembly implementation takes 0.0322 seconds. Finally, for 2 raised to 28, the C implementation takes 0.5631 seconds on average, whilst the assembly code does better with an average execution time of 0.4323 seconds.

While the assembly implementation initially has a little disadvantage over the C method for lower vector sizes in release mode, an interesting observation emerges when examining the 2 raised to 28 vector size. It was noticed that this particular trial was carried out with all other running programs closed. This observation may imply that ambient factors, such as system load, influence the performance comparison of C and assembly implementations. Furthermore, the large performance improvement observed as vector size increases underlines the assembly implementation's potential efficiency, which could be ascribed to enhanced low-level processes.

In debug mode, the assembly implementation outperforms the C method majority of the vector sizes in both modes, indicating that it is more efficient and faster at performing the dot product calculation. This significant speed increase confirms the efficiency of handcrafted assembly code in streamlining computational processes and emphasizes the necessity of low-level optimizations in improving overall performance.

Moreover, both implementations provide identical dot product values, demonstrating the precision and reliability of both methods in computing the anticipated outcome. The stability of the dot product value across trials contributes to the reliability and consistency of the experimental outcomes.

Ultimately, the comparison analysis demonstrates the efficiency of the assembly solution in obtaining quicker execution times than the C implementation over several trials in both debug and release modes. However, the decision to use assembly should be taken carefully, taking into account the trade-offs and possibility for future optimization, to ensure that the selected approach is in line with project needs and development limitations.

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

