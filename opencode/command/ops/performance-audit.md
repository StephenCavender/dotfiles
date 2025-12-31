---
description: Comprehensive performance assessment and optimization
agent: performance-analyst
model: anthropic/claude-3-5-sonnet-20241022
---

Conduct a thorough performance analysis and identify optimization opportunities.

Performance Assessment:
- Response time analysis (p50, p95, p99)
- Throughput and concurrency evaluation
- Resource utilization (CPU, memory, network, I/O)
- Database query performance
- API endpoint latency
- Frontend performance (Core Web Vitals: LCP, FID, CLS)
- Bundle size and load time analysis
- Memory leak detection
- N+1 query identification
- Build output verification (static vs dynamic routes)
- Asset size analysis (public/ directory >4KB check)
- Serverless compute time analysis
- Sequential database call detection

Analysis Areas:
- Identify performance bottlenecks
- Analyze caching opportunities (unstable_cache, revalidateTag)
- Evaluate database indexing strategy
- Review connection pooling configuration
- Assess async processing opportunities and background job offloading
- Examine code-level optimization needs
- Review infrastructure scaling patterns
- Asset delivery cost analysis
- Static rendering optimization opportunities
- Concurrent query optimization (Promise.all())

Deliverables:
- Performance baseline metrics
- Identified bottlenecks with severity assessment
- Optimization recommendations prioritized by impact
- Caching strategy (application, distributed, database, CDN)
- Database optimization suggestions
- Load testing plan
- Performance budget recommendations
- Monitoring and alerting configuration
- Build output analysis (static vs dynamic route breakdown)
- Asset size optimization report
- Infrastructure cost optimization recommendations
- Spend limits and cost control configuration

Consult with Database Architect for query optimization and Deployment Engineer for infrastructure scaling.
