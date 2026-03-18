# Report to HTML

## Introduction

Report to HTML is a capability that converts data analysis reports into professional HTML pages. It can generate responsive, self-contained single-page HTML files suitable for various report types including category analysis, dark horse analysis, VOC analysis, and more.

## Use Cases

- **Report Sharing**: Need to share analysis reports with team members or clients as web pages
- **Professional Presentation**: Need to present data in a visualized, beautiful format
- **Report Archiving**: Generate standalone HTML files for long-term storage
- **Meeting Presentation**: Present analysis results in meetings or demos

## Core Capabilities

### Data Fidelity & Formatting
- Strictly follow original data, no fabricated metrics or insights
- Number formatting standards: thousand separators, percentages with 1-2 decimal places, currency symbols
- Table numbers right-aligned, text left-aligned

### Professional Visual Design
- **Readability First**: Clear heading hierarchy, appropriate spacing, comfortable line-height
- **Restrained Color Palette**: Simple, cohesive color scheme, colors serve content comprehension
- **Visual Hierarchy**: Key metrics highlighted, supporting information appropriately subdued
- **Responsive Layout**: Adapts to different screen sizes (desktop, tablet, mobile)
- **Subtle Interactions**: Hover effects and transition animations

### Data Visualization
Choose the most effective visualization type based on data type:

| Data Type | Recommended Charts |
|-----------|-------------------|
| Comparison/Ranking/Market Share | Horizontal bar charts, pie/donut charts |
| Time Series/Trends | Line charts, area charts, grouped bar charts |
| Key Metrics | Large number cards + trend indicators (↑↓) |
| Distributions | Stacked bar charts, treemaps, heatmaps |

### Supported Report Types
- Category analysis reports
- Dark horse analysis reports
- VOC (Voice of Customer) analysis reports
- Custom reports

## How to Use

### Basic Usage

When you have data analysis reports to convert to HTML, simply tell Kamay:

```
Convert this report to an HTML page
```

```
Generate a professional HTML report for this category analysis
```

### Workflow

1. **Provide Report Content**: Give analysis report content (data, tables, insights, etc.) to Kamay
2. **Specify Report Type**: Indicate whether it's category analysis, dark horse analysis, VOC analysis, or other types
3. **Generate HTML**: System will automatically design layout and generate HTML file
4. **Get Link**: Receive shareable report link after generation

### Output Files

- **File Naming**: `{Report Type}_{Date}.html`, e.g., `Category_Analysis_2025-01-19.html`
- **File Encoding**: UTF-8
- **Self-Contained**: All styles inline, no external dependencies
- **Responsive**: Adapts to various screen sizes

### Design Guidelines

Reports follow these design principles:

**Color Semantics**:
- Green ↑ indicates growth
- Red ↓ indicates decline

**Layout Principles**:
- Summary first, key metrics highlighted
- Supporting content progresses by hierarchy
- Charts and tables appropriately combined

## Quality Checks

Generated reports automatically undergo these checks:

**Data Checks**:
- Correct number formatting (thousand separators, currency symbols)
- Percentages with reasonable decimal places
- Correct table alignment
- No data errors

**Design Checks**:
- Clear visual hierarchy
- Cohesive color scheme
- Readable at different screen sizes
- Responsive layout working properly

**Content Checks**:
- All content from original data
- No fabricated metrics
- Semantic HTML5 structure

## Example

### Input
```
Please convert the following category analysis report to HTML:

# Skincare Category Analysis Report

## Market Overview
- Market size: $12,345,678
- Annual growth rate: 15.2%
- Top brand market share: 23%

## Category Trends
- Anti-aging products growing fastest, 34% YoY
- Natural ingredient products demand rising
...
```

### Output
The system generates a professional HTML report page including:
- Responsive layout
- Data visualization charts
- Formatted numbers and tables
- Shareable link

## Related Resources

- [Market Analyst](market-analyst.md): Generate market analysis reports for conversion
- [Creative Brief](creative-brief.md): Define creative strategy based on analysis reports
