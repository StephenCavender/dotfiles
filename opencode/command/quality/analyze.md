---
description: Context-aware analysis routing to appropriate specialist
agent: code-reviewer
model: anthropic/claude-3-5-sonnet-20241022
---

Analyze the current file or code and automatically route to the most appropriate specialist.

Automatic Routing Logic:
- `.tsx/.jsx/.js/.ts` React components → Frontend Engineer
- `.tsx/.jsx/.js/.ts` API/server files → Backend Architect
- `.sql` files → Database Architect
- `.yml/.yaml` CI/CD files → Deployment Engineer
- `Dockerfile` or `docker-compose.yml` → Deployment Engineer
- `*.test.*` or `*.spec.*` files → Test Automation Engineer
- Mobile files (`*.swift`, `*.kt`, React Native) → Mobile Engineer
- Security configs or auth files → Security Auditor
- Performance-critical paths → Performance Analyst

AOT-Enhanced Analysis Includes:
- Code quality and best practices with atomic problem decomposition
- Architectural patterns and compliance through DAG-based analysis
- Performance implications with memoryless reasoning transitions
- Security vulnerabilities with atomic sub-problem identification
- Testing coverage and quality through independent test unit analysis
- Documentation completeness with atomic coverage validation
- Potential improvements and refactoring using AOT convergence
- Domain-specific recommendations with atomic reasoning

AOT-Powered Deliverables:
- Comprehensive analysis using atomic decomposition framework
- Identified issues with severity ratings and atomic sub-problem breakdown
- Specific improvement recommendations with AOT reasoning trajectory
- Code examples for fixes using atomic problem solving
- Best practices guidance with memoryless reasoning validation
- Related files that may need updates with dependency analysis

If multiple specialists are relevant, AOT analysis will include:
1. Primary specialist atomic analysis
2. Secondary specialist atomic consultations 
3. AOT integration through contraction phase
4. Quality-aware termination validation

If multiple specialists are relevant, the analysis will include:
1. Primary specialist analysis
2. Secondary specialist consultations as needed
3. Integrated recommendations

This command intelligently determines which expert should analyze your code based on file type, content, and context.
