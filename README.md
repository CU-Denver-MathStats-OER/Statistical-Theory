# Preface

---


*Statistical Methods: Exploring the Uncertain* is a set of interactive course materials designed to explore statistical methods. These materials are Open Education Resources (OER) designed to serve as both the textbook and in-class labs for MATH 3382: Statistical Theory at University of Colorado Denver. MATH 3382 is an undergraduate course in statistics at the 300 (junior) level that is required for all math majors at University of Colorado Denver. These materials are not intended for an introduction to statistics course for a more general audience of students from various backgrounds that are typically at the 100 or 200 levels. Students of Mathematics, Statistics, Data Science, Economics, Biostatistics, Computer Science and other STEM fields that want to advance beyond a typical introduction to statistics course are the intended audience.


The materials are designed for full semester (3 credit) course. Topics covered include exploratory data analysis, statistical inference, probability, sampling distributions, maximum likelihood estimators, method of moments estimators, properties of estimators, confidence intervals (both bootstrap and parametric methods), and hypothesis tests (both permutation tests and parametric methods)

The prerequisite for the course at CU Denver is multivariable calculus; however, students with a background in single variable calculus are able to work through the materials as well. The only instance where multivariable calculus might arise is with joint probability distributions and maximum likelihood estimators for distributions with two or more parameters, both of these applications can be skipped.

Students are not required to have any previous course work in statistics, probability, or coding in R (or any other language). The "essentials" of probability are covered in Chapter 2 with a focus on how we apply theory from probability to do statistics. These materials do not include a comprehensive treatment of probability. 


## A Virtual Lab for Exploring Statistics

---

These materials are intended as set of activities to experiment and explore statistical theory and methods. Each interactive Jupyter notebooks is a "virtual laboratory" where we perform our experiments and summarize the results. The objectives of experimental mathematics/statistics are generally to make the subject <font color="dodgerblue">**more tangible, lively and fun.**</font>

The intent of introducing R is not to avoid a deep and rigorous understanding of statistics or to use R simply as a calculator. There are other sources that skim the surface of statistical concepts and instead focus on the coding side of things. These materials use R as an additional tool for further exploring statistics to gain a deeper insight into statistical models. Some of the objectives of implementing R code cells into the materials are to:

- Easily import and analyze real data from interesting studies and experiments.
- Create insightful data visualizations.
- Explore features of the data to generate statistical questions worth investigating.
- Discover patterns and relationships between variables.
- Introduce and implement resampling methods.
- Develop and test conjectures.
- Confirm analytically derived results.
- Gain further insight and intuition.
- <font color="dodgerblue">**Bridge the divide between theory and practice.**</font>


## How to Access, Edit and Save Notebooks

---

This [html version](https://aspiegler.github.io/Statistical-Theory/) of the materials is not dynamic. You cannot edit the text or run code with the html version.

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://githubtocolab.com/CU-Denver-MathStats-OER/Statistical-Theory/blob/main/Chap1/01-Intro-to-Inference.ipynb) <nbsp>

- At the top of each notebook is a "button" such as the one above.
- Click the button to open an interactive Jupyter notebook version initialized to run R code in [Google Colaboratory](https://colab.research.google.com/) (or Colab).
- You can begin working with the notebook right away in Colab! There is no software to install (or purchase!).
- You can also access the materials directly on GitHub at <https://github.com/CU-Denver-MathStats-OER/Statistical-Theory.git>.


Each Jupyter notebook contains both narrative text (in Markdown cells) and R code cells that you can create, modify, and run. Although you do not need a Google account to interact with the notebooks, the Colab notebooks are "shared", meaning you cannot save any changes to the initial shared document that opens. **If you would like to save your changes, you first need to save a copy to your Google Drive.** Then you can edit and save changes to your own version.



## What Programming Background is Required?

---


No prior experience or knowledge of R, Markdown, LaTeX, or Colaboratory is assumed or required to begin working with these materials. After working with these materials, you will have some knowledge and experience with R, Markdown, LaTeX, and Colaboratory!

- [Welcome to Colaboratory](https://colab.research.google.com/notebooks/intro.ipynb) is a helpful notebook (with videos) to help introduce you to Colab.
- Here's a helpful [Markdown guide](https://colab.research.google.com/notebooks/markdown_guide.ipynb).


### What is R?

---

[R](https://www.r-project.org/about.html) is a programming language used largely for statistical computing, data wrangling and visualization. We will be using R as a tool for exploring statistical theory.  The first stable version of R was released in 2000, and after all of this time, there is a large community of R users that have already created tons of useful packages and shared interesting data sets that are frequently updated. We will create, modify, and run R code in Jupyter notebooks. **No prior programming experience is required to begin working in R in these materials.**

The goal of these materials are to investigate statistical theory, not learn how to be an expert R programmer. The hope is that we can use R as a tool for experimenting, gaining a deeper insight, and implementing resampling methods. In the process, hopefully you gain a familiarity with R and coding so it is no longer a barrier to future work! Have I mentioned **no prior programming experience is required to begin working in R in these materials**?



### What is LaTex?

---

[LaTeX](https://www.cmor-faculty.rice.edu/~heinken/latex/symbols.pdf) is a system for rendering nice looking mathematical symbols, expressions, and equations. All of the mathematical notation in these materials are created using LaTeX. You can view and edit all of the LaTeX code in the Markdown cells. You do not need to become an expert in LaTeX, but having a familiarity with LaTeX is quite helpful and LaTeX can be used to typeset math in a number of different applications.

- Here is a useful [dictionary of LaTeX math symbols](https://www.cmor-faculty.rice.edu/~heinken/latex/symbols.pdf) to get a glimpse of LaTeX.


## How to Contact Me

---

If you have any questions, comments, or suggestions about these materials, please feel free to reach out to me (Adam) at [adam.spiegler@ucdenver.edu](mailto:adam.spiegler@ucdenver.edu).

- Considering using these materials in your course? Please let me know if I can help.
- If you do use some of these materials in your course, your feedback is welcome and appreciated.
- If you materials that you would like to share or contribute to this project, great!


## Acknowledgements

--- 

<img src="https://cdhe.colorado.gov/sites/highered/files/logo.svg" alt="Colorado Department of Higher Education" width="30%"/>

![Colorado Department of Higher Education](https://cdhe.colorado.gov/sites/highered/files/logo.svg){width=30% height=30%}
fig-align="left" width=30% fig-alt="Colorado Department of Higher Education"}

This project was supported by the [Colorado Department of Higher Education (CDHE)](https://cdhe.colorado.gov/) OER Grant Program. A big thank you to Megan Patnott for reviewing the materials and providing many great corrections and suggestions to improve the materials!



## Creative Commons License Information

---

![Creative Commons License](https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png) <nbsp>

*Statistical Methods: Exploring the Uncertain* by [Adam Spiegler (University of Colorado Denver)](https://github.com/CU-Denver-MathStats-OER/Statistical-Theory) is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/). This work is funded by an [Institutional OER Grant from the Colorado Department of Higher Education (CDHE)](https://cdhe.colorado.gov/educators/administration/institutional-groups/open-educational-resources-in-colorado).

For similar interactive OER materials in other courses funded by this project in the Department of Mathematical and Statistical Sciences at the University of Colorado Denver, visit <https://github.com/CU-Denver-MathStats-OER>.

## Quarto Books

---

These materials are creating using Quarto books. To learn more about Quarto books visit <https://quarto.org/docs/books>.