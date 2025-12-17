---
description: Validate UI implementation with rigorous visual testing
agent: ui-visual-validator
model: anthropic/claude-3-5-sonnet-20241022
---

Perform comprehensive visual validation of UI changes with automated testing and measurable quality gates.

Visual Validation Scope:
- Screenshot analysis and pixel-perfect comparison
- Cross-browser visual consistency (Chrome, Firefox, Safari, Edge)
- Responsive design validation across breakpoints
- Dark mode and theme consistency
- Animation and interaction state verification
- Loading, error, and edge state validation
- Accessibility visual compliance (WCAG 2.1/2.2)

Automated Testing Requirements:
- Run visual regression tests (Chromatic, Percy, or BackstopJS)
- Execute accessibility scans (axe, Pa11y, Lighthouse)
- Measure color contrast ratios (minimum 4.5:1 for AA)
- Validate focus indicators and keyboard navigation
- Check responsive breakpoint behavior
- Test with screen reader overlays
- Verify design token compliance

Quality Gates (Must Pass):
- Color contrast ratios ≥ 4.5:1 for normal text (AA)
- Color contrast ratios ≥ 3:1 for large text and UI components
- Zero critical accessibility violations
- Pixel diff < 0.5% for unchanged areas
- Performance: CLS < 0.1, animations at 60fps
- All interactive elements keyboard accessible

Validation Process:
1. Define measurable success criteria
2. Run automated visual regression tests
3. Execute accessibility testing suite
4. Perform manual cross-browser inspection
5. Validate responsive behavior
6. Check edge cases and error states
7. Measure and document metrics

Provide:
- Visual validation report with pass/fail status
- Accessibility audit results with specific violations
- Contrast ratio measurements for all text/UI elements
- Cross-browser compatibility matrix
- Responsive breakpoint validation results
- Specific remediation recommendations
- Quality metrics dashboard

Be rigorous and evidence-based. Only approve with clear visual proof and passing automated tests.
