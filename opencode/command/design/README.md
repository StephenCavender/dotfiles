# Design Commands

Commands for UI/UX design, design systems, and visual validation.

## Commands

### `/design-system`
Create, audit, or enhance design systems with comprehensive accessibility and testing. Uses **UI/UX Designer** agent.

**Use when:**
- Building new design systems
- Auditing existing design systems
- Creating component libraries
- Establishing design tokens
- Implementing accessibility standards
- Setting up design-to-development workflows

**Outputs:**
- Design token specifications
- Component library designs
- Accessibility compliance checklist
- Design validation framework
- Developer handoff documentation

### `/visual-test`
Validate UI implementation with rigorous visual testing and quality gates. Uses **UI Visual Validator** agent.

**Use when:**
- Validating UI changes
- Running visual regression tests
- Auditing accessibility compliance
- Checking cross-browser compatibility
- Verifying responsive design
- Testing design system compliance

**Outputs:**
- Visual validation report
- Accessibility audit results
- Contrast ratio measurements
- Cross-browser compatibility matrix
- Quality metrics dashboard
- Specific remediation recommendations

## Examples

```bash
# Create a new design system
/design-system Create a design system for our B2B SaaS product

# Audit accessibility
/design-system Audit our current design system for WCAG 2.1 AA compliance

# Validate UI changes
/visual-test Validate the new navigation component implementation

# Run comprehensive visual tests
/visual-test Test homepage across all breakpoints and browsers
```

## Best Practices

- Always define success criteria before design work
- Test designs with real users
- Validate accessibility with automated tools
- Use visual regression testing in CI/CD
- Document design decisions and rationale
- Maintain design token consistency
- Establish measurable quality gates
