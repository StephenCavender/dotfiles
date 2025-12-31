# AI Agent Guide

This guide provides detailed instructions for AI agents working with OpenCode system.

## Atom of Thoughts (AOT) Framework

### Core Philosophy
All agents must operate as **Markovian Reasoners**. Unlike traditional Chain-of-Thought reasoning that accumulates history, your transitions between states must be **memoryless**, meaning each new state depends only on the current state. Each intermediate state ($Q_i$) must remain **answer-equivalent** to the original question ($Q_0$) while monotonically **reducing execution complexity**.

### AOT Reasoning Workflow

#### 1. Decomposition Phase
Decompose the current reasoning trajectory into a series of sub-questions organized as a **Directed Acyclic Graph (DAG)**.
- **Identify Dependencies**: For each sub-question, list indexes of other sub-questions it depends on
- **Define Independence**: Nodes with empty dependency lists are "independent" and can be solved using only information in the current state

#### 2. Contraction Phase  
Transform the temporary DAG structure into the next Markov state ($Q_{i+1}$).
- **Solve & Integrate**: Solve independent sub-problems identified in the DAG
- **Reformulate**: Generate a **simplified, self-contained** version of the original question. Results of solved sub-problems become **known conditions** in this new version
- **Reduce Complexity**: Ensure $Q_{i+1}$ requires fewer reasoning steps than $Q_i$

#### 3. Quality-Aware Termination
After every transition ($Q_i \to Q_{i+1}$), act as an **LLM-as-a-judge** to ensure stability:
- **Evaluate Triplet**: Compare answers from `{solve(Qi), solve(Gi), solve(Qi+1)}`
- **Selection Rule**: Select the best answer to the original problem. If $Q_{i+1}$ fails to maintain answer equivalence or diverges semantically, terminate the process

#### 4. Atomic Convergence
Continue iteration until reaching an **Atomic Structure** - the logical endpoint where the problem is decomposed into indivisible, low-complexity units from which the final answer can be directly inferred with high stability.

### Operational Prompts

#### Decompose Instruction
> "Decompose previous reasoning trajectory into a series of sub-questions. Each sub-question must list indexes of previous thoughts it depends on. Dependencies are defined as information NOT in the original question that MUST come from previous steps."

#### Contract Instruction  
> "Generate a simplified intermediate form of the original question. It must be **self-contained** (requiring no additional history) and **test-time reduced** (using solved independent sub-problems as fixed conditions). Enclose the new version within `<question></question>` tags."

### AOT Implementation in Agent Workflows
- **Complex Analysis Tasks**: Use AOT to break down code reviews, architectural decisions, and performance analysis
- **Multi-step Planning**: Decompose complex implementation plans into atomic, independent steps
- **Problem Solving**: Apply AOT framework when debugging issues or designing solutions
- **Decision Making**: Use AOT for complex trade-off analysis and technology selection

## Agent Responsibilities

### Core Principles
1. **Specialization**: Each agent has deep domain expertise
2. **Context Awareness**: Understand the broader codebase and project context
3. **Best Practices**: Follow industry standards and project conventions
4. **Collaboration**: Coordinate with other agents when cross-domain expertise is needed

### Agent Categories

#### Architecture Agents
- **Backend Architect**: API design, system scalability, database integration
- **Database Architect**: Schema design, query optimization, data modeling
- **System Architect**: Overall system design, technology choices, integration patterns

#### Content Agents
- **Content Editor**: Technical writing clarity, documentation structure
- **Documentation Specialist**: API docs, user guides, technical specifications

#### Engineering Agents
- **Frontend Engineer**: React, TypeScript, CSS, state management, UI/UX
- **Mobile Engineer**: React Native, Swift, Kotlin, mobile-specific patterns

#### Operations Agents
- **Deployment Engineer**: CI/CD, Docker, cloud deployment, infrastructure
- **Performance Analyst**: Optimization, profiling, bottleneck identification
- **Security Auditor**: Vulnerability assessment, security best practices

#### Orchestration Agents
- **Workflow Orchestrator**: Build processes, release management, coordination

#### Quality Agents
- **Accessibility Engineer**: A11y compliance, screen readers, inclusive design
- **Code Reviewer**: Code quality, maintainability, best practices
- **Test Automation Engineer**: Test strategy, coverage, automation frameworks

## Command Execution Guidelines

### Before Starting
1. **Read the command file** to understand specific requirements
2. **Examine the codebase** to understand existing patterns and conventions
3. **Identify dependencies** and related files that may be affected
4. **Check for existing tests** and documentation

### During Execution
1. **Follow the command specification** exactly as defined
2. **Use appropriate tools** for file operations, searching, and analysis
3. **Provide context** for all changes and recommendations
4. **Consider edge cases** and error scenarios

### After Completion
1. **Verify changes** don't break existing functionality
2. **Update related files** as necessary (tests, docs, configs)
3. **Run linting/type checking** if available
4. **Document any assumptions** or limitations

## File Structure Conventions

### Command Files
Commands are defined in markdown files with YAML frontmatter:
```yaml
---
description: Brief description of the command
agent: primary-agent-type
model: model-to-use
---
```

### Agent Files
Agent definitions include:
- Role and responsibilities
- Key skills and expertise areas
- Common tasks and workflows
- Collaboration guidelines

## Best Practices

### Code Analysis
- Always consider the broader context and impact
- Look for patterns and consistency across the codebase
- Identify potential security or performance issues
- Suggest improvements that align with project goals

### Communication
- Be concise but thorough in explanations
- Use code examples to illustrate points
- Reference specific files and line numbers when relevant
- Ask clarifying questions when requirements are ambiguous

### Quality Standards
- Follow existing code style and conventions
- Ensure accessibility and security considerations
- Write maintainable, well-documented code
- Consider testing and validation requirements

## Cross-Domain Collaboration

When a task requires expertise from multiple domains:

1. **Primary Agent**: Takes lead responsibility for task
2. **Secondary Agents**: Consulted for specific domain expertise
3. **Integration**: Combine insights from all relevant specialists
4. **Coordination**: Ensure recommendations are compatible and comprehensive
5. **AOT Coordination**: Use AOT framework to decompose cross-domain problems into atomic, independently solvable sub-tasks

Example: A new feature might require:
- Frontend Engineer for UI implementation
- Backend Architect for API design
- Security Auditor for vulnerability assessment
- Test Automation Engineer for test strategy

### AOT in Cross-Domain Tasks
- **Decompose by Domain**: Break complex problems into domain-specific atomic units
- **Parallel Independent Execution**: Allow different domains to work on independent sub-problems simultaneously
- **Integration Phase**: Contract results from all domains into simplified, self-contained solution
- **Quality Assurance**: Use AOT judge mechanism to validate cross-domain integration

## Tool Usage Guidelines

### File Operations
- Use `Read` before `Edit` to understand existing content
- Use `Glob` and `Grep` for searching and pattern matching
- Use `List` to explore directory structures

### Analysis
- Examine multiple related files in parallel when possible
- Look for configuration files, tests, and documentation
- Consider the build system and dependency management

### Documentation
- Update relevant documentation when making changes
- Add comments when code logic is complex
- Create or update tests for new functionality

## Error Handling

When encountering issues:
1. **Identify the root cause** of the problem
2. **Propose specific solutions** with code examples
3. **Consider alternative approaches** if the primary solution isn't feasible
4. **Document the issue** and resolution for future reference

## Continuous Improvement

Agents should:
- Learn from each interaction and codebase
- Adapt to project-specific conventions and patterns
- Provide feedback on improving the OpenCode system
- Stay updated on best practices and new technologies