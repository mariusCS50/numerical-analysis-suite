# Numerical Analysis Suite

A comprehensive numerical analysis toolkit implementing methods for anomaly detection, kernel regression, and stochastic text generation. This project addresses key tasks from the academic assignment and includes automated testing scripts.

## Features

- **Anomaly Detection**
  - Estimation of Gaussian parameters
  - Calculation of probability densities
  - Outlier detection and evaluation metrics

- **Kernel Regression**
  - Construction of kernel matrices
  - Gaussian kernel implementation
  - Linear solvers (Cholesky and conjugate gradient)
  - Regression value evaluation

- **Stochastic Text Generation**
  - Text corpus processing and word indexing
  - K-gram generation
  - Stochastic model building for text sampling

## Running the Project

Use the provided checker script to validate all modules. Execute one of the following commands in the terminal from the repository root:

```bash
python3 checker.py            # Runs tests for all modules
python3 checker.py 1          # Runs tests for Anomaly Detection
python3 checker.py 2          # Runs tests for Kernel Regression
python3 checker.py 3          # Runs tests for Stochastic Text Generation
```

## Implementation Details

The project is structured into several modules:

- **Anomaly Detection** (folder: `anomaly_detection/`)
  - Core functions: `estimate_gaussian.m`, `gaussian_distribution.m`, `identify_outliers.m`, and `metrics.m`
  - Supporting routines: `multivariate_gaussian.m`, `optimal_threshold.m`

- **Kernel Regression** (folder: `kernel_regression/`)
  - Main routines: `build_kernel.m`, `gaussian_kernel.m`
  - Linear solvers: `cholesky.m`, `conjugate_gradient.m`
  - Evaluation: `eval_value.m`
  - Additional helpers as needed

- **Stochastic Text Generation** (folder: `stochastic_text_gen/`)
  - Text processing for word and k-gram indexing
  - Stochastic matrix construction
  - Demonstration script: `tema1_script.m`

- **Automated Checker** (folder: `checker/`)
  - Configuration: `config.json`
  - Task-specific tests for each module are grouped into subfolders (`task-1`, `task-2`, `task-3`)
  - Main script: `checker.py`

- **Assignment Specification**
  - Detailed assignment requirements are provided in [`assignment.pdf`](assignment.pdf)

## Memory Management and Performance

- MATLAB routines are optimized for numerical accuracy and efficient computation.
- Dynamic memory usage is carefully controlled within each module.
- Automated tests ensure that the implemented functions meet performance benchmarks and numerical correctness.

## Example Usage

To run the complete suite of tests, simply execute:

```bash
python3 checker.py
```

For module-specific testing, run the appropriate command such as:

```bash
python3 checker.py 2
```

Review the terminal output for test results and error details.

## Technical Notes

- The project assumes a MATLAB/Octave environment for executing numerical routines.
- Python 3 is used for running automated tests and managing the testing workflow.
- For detailed assignment guidelines, refer to [`assignment.pdf`](assignment.pdf)

## License

Licensed under the MIT License. See the [`LICENSE`](LICENSE) file for details.