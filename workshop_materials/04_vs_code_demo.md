# VS Code AI Agent Demonstration

## Overview
This section demonstrates the advanced AI agent capabilities in VS Code, showing how to use **specification-driven development** to generate complete R analysis workflows for malaria data.

## Setup Instructions
1. Open VS Code
2. Install the R extension
3. Ensure GitHub Copilot is active
4. Open the AI chat panel (Ctrl/Cmd + Shift + P → "GitHub Copilot: Open GitHub Copilot Chat")

## Specification-Driven Development

### Using the Analysis Specification

The workshop includes a complete analysis specification in `06_analysis_plan.md` that defines:
- **Programming requirements**: R, tidyverse, style rules
- **Data specifications**: Input files, variables, processing
- **Analysis requirements**: Temporal trends, age distribution, reporting delays
- **Output requirements**: Three plots with exact specifications
- **Quality standards**: Code quality, validation, documentation

### Demonstration Prompt

**In VS Code Copilot Chat, use this prompt:**
```
I have a detailed specification in 06_analysis_plan.md. Please read it carefully 
and generate a complete Quarto report (.qmd) that follows ALL requirements. 

The report should:
1. Load malaria data from `here("data", "malaria_facility_count_data.rds")`
2. Include an executive summary with key findings
3. Perform temporal trend analysis by district
4. Analyze age distribution across districts
5. Assess reporting delays
6. Embed all plots and tables directly in the report
7. Use tidyverse conventions throughout
8. Include clear narrative and interpretations
9. Be ready to render to HTML

Name it: malaria_surveillance_report.qmd
```

### What the AI Should Generate

A complete Quarto report with:
- ✅ YAML header with proper metadata
- ✅ Executive summary with key findings
- ✅ All required packages loaded in code chunks
- ✅ Tidyverse-style data manipulation
- ✅ Three analysis sections with embedded plots
- ✅ Summary statistics in formatted tables
- ✅ Professional narrative and interpretations
- ✅ Well-commented code chunks
- ✅ Ready to render to HTML

### Alternative: Natural Language Prompts

For quicker iterations, you can also use direct prompts:

### Task 1: Data Loading and Exploration
```
"Load the malaria dataset using here(\"data\", \"malaria_facility_count_data.rds\") 
and create a comprehensive data exploration summary"
```

### Task 2: Create Visualizations
```
"Create publication-quality plots showing:
1. Weekly malaria cases by district with trend lines
2. Stacked bar chart of age distribution by district
3. Histogram of reporting delays
Use tidyverse and save to here(\"images\", ... )"
```

### Task 3: Statistical Analysis
```
"Calculate summary statistics for malaria data:
- Total cases by district
- Peak weeks by district
- Age group percentages
- Median reporting delay by district"
```

## Advanced Features to Demonstrate

### 1. Code Explanation
- Ask AI to explain complex code sections
- Request documentation for functions
- Get insights into statistical methods

### 2. Code Optimization
- Ask AI to improve performance
- Request cleaner code alternatives
- Get suggestions for best practices

### 3. Error Debugging
- Paste error messages for AI interpretation
- Request debugging assistance
- Get alternative approaches

### 4. Custom Functions
- Ask AI to create reusable functions
- Request parameter validation
- Get documentation and examples

## Conversation Examples

### Example 1: Data Cleaning
**User:** "The dataset has missing values and some outliers. Help me clean it properly."

**AI Response:** [Complete data cleaning pipeline with explanation]

### Example 2: Visualization Enhancement
**User:** "Make the plots more publication-ready with better colors, fonts, and annotations."

**AI Response:** [Enhanced visualization code with professional styling]

### Example 3: Statistical Modeling
**User:** "I want to model how reporting delays relate to total cases over time for each district."

**AI Response:** [Complete modeling code with diagnostics]

## Key Advantages of Specification-Driven Approach

| Aspect | With Spec | Without Spec |
|--------|-----------|--------------|
| **Consistency** | All code follows same standards | Varies each time |
| **Reproducibility** | Easy to regenerate exactly | Hard to reproduce |
| **Documentation** | Spec documents requirements | Must document separately |
| **Team Use** | Everyone gets same quality | Inconsistent results |
| **Time** | Faster for complex projects | Faster for simple tasks |

## Best Practices

1. **Be Specific**: Provide clear, detailed requirements
2. **Include Context**: File paths, variable names, expected outputs
3. **Define Standards**: Coding style, packages, conventions
4. **Set Quality Bars**: What makes output "good"
5. **Review Output**: AI is powerful but not perfect
3. **Iterate:** Build on previous responses
4. **Ask Questions:** Request explanations and alternatives
5. **Validate:** Always review and test generated code

## Troubleshooting Common Issues

### Issue 1: AI doesn't understand the context
**Solution:** Provide more background information and data structure details

### Issue 2: Generated code has errors
**Solution:** Ask AI to debug and provide alternative approaches

### Issue 3: Code doesn't match expectations
**Solution:** Refine your prompt with more specific requirements

## Workshop Activities

### Activity 1: Natural Language Coding
- Try the demonstration tasks above
- Experiment with different prompt styles
- Compare results with manual coding

### Activity 2: Collaborative Coding
- Work with AI to solve a new problem
- Use AI to explain existing code
- Get suggestions for improvements

### Activity 3: Report Generation
- Use AI to create a complete analysis report
- Request multiple formatting options
- Generate publication-ready outputs

## Resources and Next Steps

- GitHub Copilot documentation
- VS Code R extension guide
- R Markdown best practices
- Statistical analysis workflows
- Data visualization principles

## Conclusion

The VS Code AI agent represents the future of coding - a collaborative approach where human creativity and AI capabilities work together to solve complex problems efficiently and effectively.
