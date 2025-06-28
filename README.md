# Big Data-Driven Water Quality and Potability Analysis in Karnataka Using HPCC Systems

## Project Summary
This project analyzes five decades of surface water quality data (1972–2021) from Karnataka, India, leveraging big data tools to assess potability and track contamination trends over time. Using open datasets provided by the Indian government, the study examines concentrations of key organic and inorganic compounds—such as Aluminum, Fluorine, and Iron—alongside environmental indicators like temperature, dissolved oxygen, BOD, total hardness, TDS, and pH.

The solution is built on **HPCC Systems**, utilizing its Machine Learning and Visualizer bundles to accomplish three primary objectives:

- **Visualization:** Bar graphs display the evolution of various contaminants, comparing data from 1980 to 2021
- **Potability Assessment:** Decision tree models determine whether water samples meet WHO standards for safe drinking
- **BOD Modeling:** Linear regression calculates BOD levels

This tool enables government agencies and policymakers to identify emerging contamination patterns and supports informed interventions to safeguard public health.

---

##  Tools Used
- HPCC Systems platform
- HPCC Machine Learning bundles (Learning Trees, Regression Forest, Linear Regression)
- HPCC Visualizer bundle
- VSCode
  
---

## Project Structure

```
Visualization/  
├── data.csv           # Cleaned and processed water quality data for visualization  
├── File_Water.ecl     # Defines the File_Water module: dataset schema & file location  
├── BWR_View.ecl       # Filters dataset to retain only non-zero, positive values  
├── Prep.ecl           # Processes the clean dataset and splits data by year  
├── 1980.ecl           # Generates bar plots for data in the year 1980  
├── 2021.ecl           # Generates bar plots for data in the year 2021  
├── launch.json        # Defines connection settings for the HPCC cluster  

Linear Regression/  
├── data.csv           # Cleaned and processed water quality data for regression  
├── File_Water.ecl     # Defines dataset schema and file locations  
├── Prep01.ecl         # Splits the dataset into training and testing sets  
├── Convert02.ecl      # Defines dependent & independent variables in train/test sets  
├── BWR_train.ecl      # Trains linear regression model; computes squared error & goodness of fit  
├── launch.json        # Defines connection settings for the HPCC cluster  

Classification/  
├── data.csv           # Cleaned and processed water quality data for classification  
├── Prepare.ecl        # Splits dataset into training and testing sets  
├── File_Water.ecl     # Defines dataset schema & file location  
├── Convert.ecl        # Defines dependent & independent variables in train/test sets  
├── Classification.ecl # Implements potability classification using Learning Trees  
├── Regression.ecl     # Implements potability classification using Regression Forest  
├── launch.json        # Defines connection settings for the HPCC cluster  

```

---

##  Notes
- All `.csv` files contain **cleaned and pre-processed data**, ready for immediate use
- The ECL code was written in **2022**; some syntax or functions may have changed since then
- For the latest instructions on connecting to HPCC clusters, please refer to the **Machine Learning Training bundles** available on the official [HPCC Systems website](https://hpccsystems.com)

---

## Usage

### Running ECL Code
- Each folder contains a `launch.json` file that specifies the connection configuration to the HPCC clusters
- Use the HPCC ECL IDE or `ecl run` command line tools to execute the `.ecl` scripts
- For example, to generate visualizations, run the scripts in the `Visualization` folder sequentially
- For potability classification or BOD regression, run the respective `.ecl` scripts in the `Classification` or `Linear Regression` folders

---

## Acknowledgments
- Indian Government Open Data Platform for making the Karnataka surface water quality data available
- HPCC Systems for providing the Machine Learning and Visualizer bundles
- WHO for water potability standards referenced in the analysis

---

## Citation

If you use or reference this code in your work, please cite the following publication:

> S. Dasu, S. G, and J. Shetty,  
> "Analysis of the Surface Water Quality in the State of Karnataka using Distributed Platform,"  
> 2023 9th International Conference on Advanced Computing and Communication Systems (ICACCS), Coimbatore, India, 2023, pp. 284-287.  
> doi: [10.1109/ICACCS57279.2023.10112732](https://doi.org/10.1109/ICACCS57279.2023.10112732)

### BibTeX entry

```bibtex
@inproceedings{Dasu2023ICACCS,
  author    = {S. Dasu and S. G and J. Shetty},
  title     = {Analysis of the Surface Water Quality in the State of Karnataka using Distributed Platform},
  booktitle = {2023 9th International Conference on Advanced Computing and Communication Systems (ICACCS)},
  year      = {2023},
  pages     = {284--287},
  doi       = {10.1109/ICACCS57279.2023.10112732},
  address   = {Coimbatore, India},
}

