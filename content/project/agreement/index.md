---
title: Rater agreement & reliability
summary: In studies where more than one rater gives a judgement on a certain characteristic, the agreement between the judgements is of interest. Historically, mostly a kappa statistic is used to assess the agreement. However, the kappa statistic is a reliability measure instead of an agreement measure. It is more informative to use the percentage of absolute agreement instead. The reliability of ratings can also be obtained via different methods. The choice between the ICC oneway, ICC consistency and ICC agreement depends on the study design and goals. 
tags:
- ICC
- Agreement
- Reliability
date: ""

# Optional external URL for project (replaces project detail page).
external_link: ""

image:
  caption: Photo by fauxels from Pexels
  focal_point: Smart

links:
url_code: ""
url_pdf: ""
url_slides: ""
url_video: ""

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: "agreement_poli"
---

In studies where more than one rater gives a judgement on a certain characteristic, the agreement between the judgements is of interest. Historically, mostly a kappa statistic is used to assess the agreement. However, the kappa statistic is a reliability measure instead of an agreement measure. It is more informative to use the percentage of absolute agreement instead. Besides the overall agreement, the specific agreement can also be obtained.

The Agree package, available via GitHub, has functions implemented to obtain the agreement and specific agreement between multiple raters. This can be done for dichotomous variables, but also for (ordinal) polytomous items. In the sections "Dichotomous agreement" and "Polytomous agreement" the description of the functions in the Agree package are demonstrated. 
