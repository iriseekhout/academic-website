---
title: "From Fixed-Age Screening to Flexible Developmental Assessment"
author: ""
date: "2026-08-27"
slug: []
categories: []
tags:
  - d-score
  - child development
  - youth health care
  - van wiechen continu
  - shiny
  - adaptive testing
subtitle: "How an Interactive Shiny Application Supports Personalized Developmental Assessment in Youth Health Care"
summary: 'A new interactive tool makes it possible to use the Dutch Developmental Instrument more flexibly in preventive Youth Health Care. By combining the D-score model, Dutch reference data and an accessible Shiny application, the tool helps professionals identify developmental milestones that match a child’s current developmental level. The application supports personalized assessment, strengthens conversations with parents and provides a practical foundation for future adaptive developmental testing.'
authors: ["Iris Eekhout"]
lastmod: "2026-08-27T10:59:57+02:00"
featured: no
image:
  caption: ""
  focal_point: ""
  preview_only: no
projects: ["d-score"]
---

We are pleased to announce the publication of a new research paper titled **“Interactive Tool for Flexible Developmental Assessment in Youth Health Care”** by Iris Eekhout and Yvonne Schönbeck. The paper describes the development of an interactive digital tool that supports a more flexible and personalized approach to monitoring child development in preventive Youth Health Care.

The tool translates developmental measurement research into a practical interface for professionals. It combines the **Dutch Developmental Instrument**, known in the Netherlands as the *Van Wiechenonderzoek*, with the **D-score model**, Dutch developmental reference curves and an interactive application built in R Shiny.

Instead of assessing the same predetermined milestones at fixed ages, the tool helps professionals select milestones that are appropriate for a child’s age and current developmental level. It thereby supports the transition towards **Van Wiechen Continu**, a more flexible approach to developmental assessment that focuses on the question:

> **What can this child already do, and what might be the next step in their development?**

### **Why a More Flexible Developmental Assessment Is Needed**

The Van Wiechenonderzoek is widely used in Dutch Youth Health Care to monitor the development of children from birth to four years of age. It contains 75 developmental milestones covering areas such as gross motor development, fine motor development, communication, adaptation, and personal and social behaviour.

Traditionally, specific milestones are scheduled for assessment at specific ages. This standardized approach has important advantages. It provides professionals with a clear protocol and supports systematic monitoring across children and contact moments.

At the same time, a fixed-age approach has limitations. Children develop at different rates, and their developmental pathways do not always align precisely with scheduled Youth Health Care visits. Contact moments are also becoming more flexible and may not take place at exactly the ages assumed by the original assessment schedule.

As a result, milestones scheduled for a particular visit may sometimes be too easy, too difficult or less informative for an individual child. A fixed selection may also make it more difficult to involve parents in a positive conversation about what their child can already do and which developmental step may come next.

Van Wiechen Continu was developed to address these limitations. The developmental milestones and their scoring remain unchanged, but professionals obtain more flexibility in deciding **which milestones are most relevant to assess at a particular moment**.

### **From Developmental Milestones to a Measurement Scale**

A central challenge was to determine when each Van Wiechen milestone is informative. To answer this question, the milestones were linked to the D-score measurement framework.

The D-score is a numerical measure of generic child development. It is conceptually similar to familiar physical growth measures such as height and weight. Whereas height provides a common unit for physical growth, the D-score provides a common developmental scale on which children and developmental milestones can be positioned.

The D-score model is based on item response theory, specifically the Rasch model. In this model, both the developmental level of a child and the difficulty of a milestone are expressed on the same underlying scale.

For each milestone, the model estimates a difficulty parameter. Easier milestones have a lower position on the developmental scale, while more difficult milestones have a higher position. A child’s D-score represents the child’s position on that same scale.

The probability that a child passes a milestone depends on the difference between:

1. the child’s developmental level, and
2. the difficulty of the milestone.

When the child’s developmental level is close to the difficulty of a milestone, the milestone provides considerable information about the child’s current development. Very easy milestones are likely to have been achieved already, whereas very difficult milestones are unlikely to be achieved at that moment.

This measurement framework makes it possible to move beyond a rigid connection between milestones and predetermined visit ages.

### **Converting D-score Calibrations into Age Percentiles**

Although the D-score provides the statistical foundation, Youth Health Care professionals do not need to calculate or interpret item response theory parameters during a consultation. The model therefore had to be translated into information that is immediately understandable and usable in practice.

Published D-score calibrations and Dutch developmental reference curves were used to calculate **percentile ages for all 75 Van Wiechen milestones**.

For each milestone, the percentile ages indicate the ages at which a given proportion of children in the reference population is expected to have achieved that milestone. Examples include:

- **P2:** the age at which approximately 2% of children can perform the milestone;
- **P10:** the age at which approximately 10% can perform it;
- **P50:** the age at which approximately half of the children can perform it;
- **P90:** the age at which approximately 90% can perform it;
- **P98:** the age at which approximately 98% can perform it.

These percentiles describe developmental variation rather than setting rigid norms. For example, the P50 age is not an age at which every child is expected to pass a milestone. It indicates the age at which half of the children in the reference population are expected to have achieved it.

The difference between the lower and upper percentile ages shows that children can reach the same milestone at substantially different ages while still following a typical developmental pathway. This helps professionals present developmental variation to parents in an understandable and non-judgemental way.

Technically, the percentile ages were derived by combining two model components:

1. the calibrated difficulty of each developmental milestone on the D-score scale; and
2. age-specific reference distributions describing how the D-score develops with age in the Dutch population.

For a selected milestone and probability of successful performance, the underlying item response model identifies the D-score associated with that probability. The Dutch reference model subsequently translates that D-score into the corresponding age percentile.

In this way, item difficulties expressed on an abstract developmental scale are converted into practical information about the ages at which children typically acquire each milestone.

### **Making the Model Accessible Through an R Shiny Application**

The statistical information was incorporated into an interactive application developed with **R Shiny**. Shiny is a framework that connects a user interface to analytical procedures written in R. It allows users to interact with data and model results through a web-based interface without needing to run R code themselves.

The application acts as a translation layer between the D-score model and professional practice. The statistical calculations and reference tables operate in the background, while the professional interacts with an accessible visual representation of the developmental milestones.

In simplified form, the application consists of three layers:

1. **A data and model layer**, containing the Van Wiechen milestones, their D-score calibrations, domains, traditional assessment ages and calculated percentile ages.
2. **A reactive calculation layer**, which filters and classifies milestones based on the child’s age and the selections made by the user.
3. **A user-interface layer**, which presents the relevant milestones and their age distributions in tables and visualizations.

Because Shiny is reactive, the displayed information is updated automatically whenever the user changes an input. For example, when the professional enters a different age, the application immediately recalculates which milestones are likely to be easy, suitable or challenging for a child of that age.

The professional does not have to manually search through reference tables or calculate probabilities. The application performs these steps automatically and presents the results in a form that can be used during a consultation.

### **How the Interactive Tool Works**

A prototye of the interactive tool can be accessed online at: <a href="https://tnochildhealthstatistics.shinyapps.io/VWCprototype/" target="_blank" rel="noopener noreferrer">https://tnochildhealthstatistics.shinyapps.io/VWCprototype/</a>


The professional starts by entering the child’s age. The application then compares this age with the percentile-age distribution of each developmental milestone.

Based on this comparison, milestones can be classified into practical categories, such as:

- milestones that most children of this age have already achieved;
- milestones that are particularly informative around the child’s current age; and
- more challenging milestones that may represent a next developmental step.

The user can also explore milestones across developmental domains. This provides a structured overview while preserving the professional’s freedom to select milestones on the basis of previous observations, information from parents and the broader clinical context.

Importantly, the application does not replace the professional’s judgement. It functions as a **decision-support tool**. The professional remains responsible for deciding which milestones to assess and for interpreting the findings in relation to the child’s complete developmental picture.

The tool therefore brings together three different sources of information:

1. **developmental measurement evidence**, represented by the D-score calibrations and Dutch reference curves;
2. **professional expertise**, including observations during the consultation and information from previous contact moments; and
3. **parental knowledge**, particularly information about the child’s behaviour and abilities in everyday situations.

This combination supports a more personalized developmental assessment than an approach based exclusively on age and a fixed list of milestones.

### **Supporting the Conversation with Parents**

One of the main objectives of Van Wiechen Continu is to strengthen the involvement of parents. Rather than focusing primarily on whether a child has failed a milestone expected at a particular age, the approach starts with what the child can already do.

This creates opportunities for a more positive and meaningful conversation. Professionals and parents can discuss:

- recently acquired abilities;
- skills the child is currently practising;
- variation between developmental domains;
- developmental steps that may emerge next; and
- activities through which parents can support development in everyday life.

The percentile information can also help explain why children do not all acquire a skill at the same age. It provides a visual and quantitative basis for discussing normal developmental variation without turning percentiles into strict cut-off values.

At the same time, a flexible approach does not mean that potential developmental concerns are ignored. When a child does not achieve milestones that are normally mastered by nearly all children at that age, this information remains clinically relevant. The tool is intended to broaden the developmental conversation while retaining the signalling function of Youth Health Care.

### **Iterative Development with Professionals and Parents**

Developing a technically correct model was only one part of the project. The application and the Van Wiechen Continu approach also had to be understandable, efficient and clinically relevant.

The prototype was therefore developed and refined through three pilot cycles following a **Plan-Do-Check-Adjust** approach. Feedback from Youth Health Care professionals and parents was used to improve both the presentation of the percentile information and the practical workflow.

The pilot evaluations showed that professionals valued the additional insight into the age distributions of milestones. The tool helped them look beyond the milestones traditionally scheduled for a specific contact moment and supported a more flexible assessment that was better aligned with the individual child.

The evaluations also emphasized the importance of a clear interface and a good fit with existing practice. Factors such as terminology, the visual presentation of percentiles, the number of steps required and the integration with the digital Youth Health Care record all affect whether a tool can be used effectively during a consultation.

The pilot process therefore connected psychometric development, software development and user-centred design. This combination is essential when statistical models are translated into digital decision support for routine care.

### **From a Shiny Prototype to Routine Youth Health Care**

The Shiny application demonstrates how D-score parameters and developmental reference data can be operationalized in practice. As a prototype, it also provides a controlled environment in which the functionality can be tested before being integrated into existing digital Youth Health Care systems.

For routine implementation, the underlying logic does not necessarily have to remain within a standalone Shiny application. The milestone information, age percentiles and selection rules can also be incorporated into the digital child health record.

Such integration could allow the system to use information that is already available, including:

- the child’s exact age;
- milestones assessed at previous visits;
- previous milestone scores;
- milestones that have not yet been assessed; and
- relevant developmental domains.

The system could then suggest a set of potentially informative milestones before or during the consultation. The professional would still determine which milestones are appropriate, but would receive evidence-based support without needing to consult separate schedules or reference tables.

Integration with digital records may reduce duplicate data entry, improve continuity across contact moments and make flexible developmental monitoring more feasible at scale.

### **A Step Towards Adaptive Developmental Testing**

The current application uses age-based reference information to support the selection of appropriate milestones. This can be considered an important step towards **adaptive developmental testing**.

In a fully computerized adaptive test, the selection of each new item depends on the responses to previous items. After every response, the system updates its estimate of the child’s developmental level and selects the next item that is expected to provide the most information.

A possible adaptive procedure could work as follows:

1. The assessment starts with one or more milestones appropriate for the child’s age.
2. After each response, the child’s developmental level is estimated using the D-score model.
3. The system evaluates which unadministered milestone would provide the most information at that estimated level.
4. The next milestone is selected dynamically.
5. The procedure stops when the developmental estimate is sufficiently precise or when another predefined stopping criterion is reached.

The present tool does not yet implement this complete adaptive algorithm. Instead, it makes the first part of the adaptive logic visible and usable by identifying milestones with different difficulty levels for a child of a given age.

This intermediate approach has several advantages. It allows professionals to become familiar with flexible milestone selection, keeps professional judgement central and provides opportunities to evaluate the clinical and practical consequences before moving towards greater automation.

### **Technical Requirements for Future Adaptive Testing**

Moving from age-based decision support to a fully adaptive assessment requires additional technical and methodological work.

First, the D-score item parameters must be sufficiently stable and valid for the target population. If milestone difficulties differ substantially between populations or settings, the adaptive algorithm may select items that are less appropriate than expected.

Second, the starting rule must be carefully designed. Chronological age offers a useful initial estimate, but previous assessment results may provide a more individualized starting point.

Third, the item-selection criterion must be specified. A conventional adaptive test often selects the item with the highest statistical information at the current ability estimate. In developmental assessment, additional restrictions may be needed to obtain adequate coverage across developmental domains and to ensure that the selected sequence remains clinically meaningful.

Fourth, clear stopping rules are required. Testing could stop when the uncertainty around the D-score estimate is sufficiently small, when a maximum number of milestones has been administered or when the information gained from additional milestones becomes limited.

Finally, the resulting score must be interpretable for professionals and parents. A statistically precise D-score is only valuable when it contributes to understanding the child’s development and supports appropriate guidance or follow-up.

For these reasons, the transition towards adaptive testing should be evaluated not only in simulation studies, but also in clinical practice. Relevant outcomes include measurement precision, test length, usability, professional acceptance, parental experience and the quality of developmental decision-making.

### **Bringing Measurement Science and Practice Together**

The interactive tool illustrates how psychometric models can create practical value when they are translated into accessible digital applications.

The D-score model provides a common developmental scale. Dutch reference curves connect that scale to age-related development. The percentile ages make the information interpretable. The Shiny application makes the information interactive and directly available to professionals.

Together, these components support a shift:

- from fixed assessment ages to flexible assessment moments;
- from a predetermined set of milestones to milestones selected for an individual child;
- from focusing mainly on possible delay to discussing the child’s current abilities and next developmental steps;
- from static schedules to interactive decision support; and
- from conventional developmental screening towards future adaptive assessment.

### **Conclusion**

The publication of **“Interactive Tool for Flexible Developmental Assessment in Youth Health Care”** demonstrates how developmental measurement research can be translated into a practical digital tool.

By combining the Van Wiechen milestones, D-score calibrations, Dutch reference curves and an interactive R Shiny interface, the tool helps professionals identify milestones that are appropriate for a child’s age and developmental level. It supports professional decision-making, provides greater flexibility in developmental assessment and facilitates a more meaningful conversation with parents.

The application is also an important technical and conceptual step towards adaptive developmental testing. Future systems may use a child’s previous responses to select the most informative next milestone and estimate development efficiently on the D-score scale.

For now, the tool shows the value of bringing together measurement science, software development, professional expertise and parental knowledge. This combination offers a promising foundation for more personalized, data-informed and future-proof developmental monitoring in Youth Health Care.

### **Scientific Publications**

More information about the development, scientific foundation and practical evaluation of Van Wiechen Continu and the interactive tool is available in the following open-access publications:

1. **Eekhout, I., & Schönbeck, Y. (2026). Interactive Tool for Flexible Developmental Assessment in Youth Health Care.** *Studies in Health Technology and Informatics, 336*, 62–66.  
   <a href="https://ebooks.iospress.nl/doi/10.3233/SHTI260109" target="_blank" rel="noopener noreferrer">https://doi.org/10.3233/SHTI260109</a>

2. **Eekhout, I., van Zoonen, R., van der Pal, S. M., Verkerk, P. H., & Schönbeck, Y. (2026). Van Wiechen Continu: het ontwikkelingsonderzoek in de JGZ 0–4 op elk moment, voor elk kind.** *Tijdschrift voor Jeugdgezondheidszorg*.  
   https://doi.org/10.61431/z7rpzr80https://doi.org/10.61431/z7rpzr80</a>
