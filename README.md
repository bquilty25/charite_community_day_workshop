# AI-Augmented R Coding Workshop

**A Hands-on Guide to Using GitHub Copilot with R**

*Workshop by Billy Quilty & Stefan Flasche*

## Overview

This 80-minute hands-on workshop showcases the integration of GitHub Copilot into RStudio and VS Code for R programming, demonstrating good practices for using AI coding assistants effectively. Participants will work through a typical epidemiological problem using three different approaches: traditional coding, Copilot-assisted coding, and AI agent programming with **analysis plan-driven development**.

## Workshop Structure

### Part 1: Traditional Coding (20 minutes)
- Manual R programming approach
- Data loading, transformation, and visualisation
- Complete malaria analysis from scratch

### Part 2: Copilot-Assisted Coding (25 minutes)
- AI-enhanced coding with GitHub Copilot
- Code suggestions and autocomplete
- Recreating analysis with intelligent assistance

### Part 3: VS Code AI Agent (25 minutes)
- **Advanced AI capabilities in VS Code**
- **Analysis plan-driven development**: Creating detailed `analysis_plan.md` files
- Natural language programming with context
- Complete code generation from analysis plans
- Best practices for AI agent collaboration

### Part 4: Report Generation (10 minutes)
- Creating publication-ready R Markdown reports
- Integrating analysis with findings
- Professional output formatting

## Prerequisites

### Required Software
1. **R** (version 4.0 or later) - [Download from CRAN](https://cran.r-project.org/)
2. **RStudio** (version 2023.09.0 or later) - [Download from Posit](https://posit.co/download/rstudio-desktop/)
3. **Visual Studio Code** - [Download from Microsoft](https://code.visualstudio.com/)

### GitHub Copilot Access
- Sign up for [GitHub Student Developer Pack](https://education.github.com/pack) (free for students)
- Complete student verification (may take a few days)
- Install Copilot in both RStudio and VS Code

## Quick Start

1. **Verify your setup**
   ```r
   # Run inside workshop_materials/
   source("07_test_setup.R")
   ```
   - Confirms required packages, data files, and Quarto are available
   - Checks that generated plots and HTML reports exist where expected

2. **Choose your coding mode**
   - `02_manual_analysis.R`: manual tidyverse workflow
   - `03_copilot_demo.R`: accept Copilot suggestions as you type
   - `04_vs_code_demo.md` + `06_analysis_spec.md`: drive Copilot Chat with a detailed spec

3. **Create your report**
   - Open `05_final_report_template.qmd`
   - Replace the placeholders with your findings
   - Render to HTML (and PDF if needed)

## Repository Structure

```
charite_community_day_workshop/
├── README.md                      # This file
├── data/                          # Datasets
│   ├── malaria_data.csv
│   └── malaria_facility_count_data.rds
├── docs/                          # Planning documents
│   ├── brief.md
│   └── materials_plan.md
├── images/                        # Generated plots and figures
│   ├── malaria_age_distribution.png
│   ├── malaria_cases_by_district.png
│   ├── malaria_reporting_delay.png
│   └── Rplots.pdf
└── workshop_materials/            # Workshop content
    ├── 01_workshop_slides.qmd     # ⭐ Presentation slides with live demos
    ├── 01_workshop_slides.html
    ├── 02_manual_analysis.R       # Traditional R approach
    ├── 03_copilot_demo.R          # Copilot-assisted demo
    ├── 04_vs_code_demo.md         # VS Code AI agent guide
    ├── 05_final_report_template.qmd  # Report template
    ├── 05_final_report_template.html
    ├── 05_final_report_template.pdf
    ├── 06_analysis_spec.md        # ⭐ Example specification for AI agents
    ├── 07_test_setup.R            # Verify setup
    ├── 08_explore_malaria_data.R  # Data exploration
    ├── SLIDES_SPEC_CONTENT.md     # Content ideas for slides (reference)
    └── SLIDES_PRESENTER_NOTES.md  # ⭐ Detailed presenter guide with timing
```

## Workshop Materials

| File | Purpose |
|------|---------|
| `workshop_materials/01_workshop_slides.qmd` | ⭐ Reveal.js slides covering setup, activities, and prompts |
| `workshop_materials/02_manual_analysis.R` | Traditional R coding walkthrough |
| `workshop_materials/03_copilot_demo.R` | Copilot-assisted coding exercise (with TODO prompts) |
| `workshop_materials/04_vs_code_demo.md` | VS Code Copilot Chat guide |
| `workshop_materials/05_final_report_template.qmd` | Quarto report template for final output |
| `workshop_materials/06_analysis_spec.md` | ⭐ Specification file for analysis-plan driven development |
| `workshop_materials/07_test_setup.R` | Environment and dependency checks |
| `workshop_materials/08_explore_malaria_data.R` | Data exploration helper script |

## Workshop Goals

By the end of this session, participants will be able to:

- Compare manual, Copilot-assisted, and AI-agent R workflows on the same problem
- Draft actionable analysis specifications that AI tools can execute reproducibly
- Generate and refine a Quarto report that communicates malaria surveillance insights

## Key Learning Outcomes
- **Reproducible Research**: Create shareable, auditable analyses with Quarto
- **Visual Communication**: Produce publication-ready visualisations and reports
- **Statistical Interpretation**: Summarise temporal, geographic, and age-specific patterns clearly

### AI Agent Best Practices (covered in slides)
**Analysis Plan Files**: Using detailed `analysis_plan.md` documents to guide AI agents
- **Coding Standards**: Defining style rules (tidyverse, naming conventions)
- **Quality Control**: Setting explicit requirements for outputs
- **Reproducibility**: Making AI-generated code reproducible and maintainable

## Dataset Description

The workshop uses a real malaria surveillance dataset from the [Epi R Handbook](https://www.epirhandbook.com/):

- **Source**: Facility-level malaria reporting data
- **Time Period**: 2020 surveillance data
- **Geographic Coverage**: Multiple districts and health facilities
- **Variables**: Case counts by age group (0-4, 5-14, 15+ years), reporting dates, facility information
- **Use Cases**: Temporal trend analysis, geographic comparison, reporting delay analysis, age distribution patterns
- **File location**: `../data/malaria_facility_count_data.rds` (relative to `workshop_materials/`)

## Troubleshooting

### Common Issues
1. **Copilot not working**: Check GitHub account sign-in and internet connection
2. **VS Code R extension**: Ensure R extension is installed and R path is configured
3. **Package errors**: Install required packages using `install.packages()`
4. **Data loading issues**: Verify file paths and working directory

### Getting Help
- Ask questions during the workshop
- Review the troubleshooting slide in `01_workshop_slides.qmd`
- Contact workshop instructors for follow-up questions

## Learning Path

- **Beginner**: Start with the manual script, then repeat using Copilot suggestions
- **Intermediate**: Combine the Copilot demo with the analysis specification and chat prompts
- **Advanced**: Extend `06_analysis_spec.md` or author new specs for your own datasets

## Example Copilot Prompts

```
"Generate weekly malaria case trends by district using tidyverse"
"Summarise age-group proportions and highlight the top three weeks"
"Create a histogram of reporting delays with median and seven-day threshold annotations"
```

## Resources

### Documentation
- [GitHub Copilot Documentation](https://docs.github.com/en/copilot)
- [RStudio Copilot Integration](https://posit.co/blog/github-copilot-in-rstudio/)
- [VS Code R Extension](https://marketplace.visualstudio.com/items?itemName=REditorSupport.r)
- [Epi R Handbook](https://www.epirhandbook.com/)

### Community
- [RStudio Community](https://community.rstudio.com/)
- [Stack Overflow R Tag](https://stackoverflow.com/questions/tagged/r)
- [GitHub Copilot Community](https://github.com/features/copilot)

## Workshop Instructors

- **Billy Quilty** - billy.quilty@charite.de
- **Stefan Flasche**

## License

These workshop materials are provided for educational reuse—adapt and share with attribution.

## Feedback

We welcome your feedback on the workshop experience. Please consider:

1. What was most helpful about the AI coding tools?
2. What challenges did you encounter?
3. How might you use these tools in your own work?
4. What additional topics would you like to see covered?

---

*Happy coding with AI!*
