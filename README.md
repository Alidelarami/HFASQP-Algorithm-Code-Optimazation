# HFASQP-Algorithm-Code-Optimazation

Solving the economic dispatch problem for combined heat and electricity using the hybrid firefly algorithm with sequential quadratic programming. 
https://doi.org/10.1016/j.array.2026.100779
             
ABSTRACT

Optimization problems are a fundamental component of engineering and scientific research, particularly in
energy systems, where growing industrial demands necessitate the development of robust and efficient optimization
algorithms. The Combined Heat and Power Economic Dispatch (CHPED) problem seeks to minimize the
operating costs of power and heat generation units while satisfying complex operational constraints, including
valve-point effects, transmission losses, generation capacity limits, and heat-power coupling in cogeneration
units. This study proposes a hybrid optimization framework that integrates the Firefly Algorithm (FA) with
Sequential Quadratic Programming (SQP), termed HFASQP. The hybrid HFASQP approach leverages the global
search ability of FA and the local refinement strength of SQP to address the non-convex, highly constrained
nature of CHPED problems. The proposed method is validated on a set of benchmarks CHPED systems, including
traditional test cases with 5, 7, and 48 units, as well as two newly introduced large-scale systems with 96 and 192
units to evaluate scalability. The proposed method achieved a cost reduction of up to 1.7% and 1.9% compared to
FA, SQP and outperformed several state-of-the-art algorithms in terms of solution quality and computational
efficiency. In addition, the performance of HFASQP is comparatively evaluated against other recently developed
metaheuristic algorithms, including the Kangaroo Optimization Algorithm (KOA) and the Heap-Based Optimizer
(HBO), to provide a more comprehensive assessment. To further evaluate robustness and generalizability, the
HFASQP algorithm is tested on 23 standard benchmark functions from the optimization literature. The results
confirm its consistent accuracy and competitiveness across all test cases, demonstrating its effectiveness beyond
CHPED applications and highlighting its potential for broader engineering problems.
