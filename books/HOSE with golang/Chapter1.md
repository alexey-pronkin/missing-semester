# Chapter 1

Software engineering is defined as the application of a systematic, disciplined, quantifiable approach to the development, operation, and maintenance of software.

## Roles in Software Development

### Software Engineer (SWE)

Depending on their experience level and technical expertise, SWEs are classified into three categories:

- Junior engineer: A junior engineer is someone who has recently started their software development career and lacks the necessary experience to build and deploy production-grade software. Companies are usually keen on hiring junior engineers as it allows them to keep their hiring costs low. Furthermore, companies often pair promising junior engineers with senior engineers in an attempt to grow them into mid-level engineers and retain them for longer.
- Mid-level engineer: A typical mid-level engineer is someone who has at least three years of software development experience. Mid-level engineers are expected to have a solid grasp of the various aspects of the software development life cycle and are the ones who can exert a significant impact on the amount of code that's produced for a particular project. To this end, they not only contribute code, but also review and offer feedback to the code that's contributed by other team members.
- Senior engineer: This class of engineer is well-versed in a wide array of disparate technologies; their breadth of knowledge makes them ideal for assembling and managing software engineering teams, as well as serving as mentors and coaches for less senior engineers. From their years of experience, senior engineers acquire a deep understanding of a particular business domain. This trait allows them to serve as a liaison between their teams and the other, technical or non-technical, business stakeholders.

Another way to classify software engineers is by examining the main focus of their work:

- Frontend engineers work exclusively on software that customers interact with. Examples of frontend work include the UI for a desktop application, a single-page web application for a software as a service (SaaS) offering, and a mobile application running on a phone or other smart device.
- Backend engineers specialize in building the parts of a system that implement the actual business logic and deal with data modeling, validation, storage, and retrieval.
- Full stack engineers are developers who have a good understanding of both
frontend and backend technologies and no particular preference of doing
frontend or backend work. This class of developers is more versatile as they can easily move between teams, depending on the project requirements.

### Site Reliability Engineer (SRE)

A site reliability engineer is a software engineer with a strong
technical background who also focuses on the operations side of deploying and running production-grade services.
According to the original role definition, SREs spend approximately 50% of their time developing software and the other 50% dealing with ops-related aspects such as the following:

- Working on support tickets or responding to alerts
- Being on-call
- Running manual tasks (for example, upgrading systems or running disaster
recovery scenarios)

### Release Engineer (RE)

- long-term supprot (LTS)
- reproducible builds

A release engineer (RE) is effectively a software engineer who collaborates with all the engineering teams to define and document all the required steps and processes for building and releasing code to production. A prerequisite for a release engineer is having deep knowledge of all the tools and processes that are required for compiling, versioning,
testing, and packaging software. Typical tasks for REs include the following:

- Authoring makefiles
- Implementing workflows for containerizing software artifacts (for example, as Docker or .rkt images)
- Ensuring all teams use exactly the same build tool (compilers, linkers, and so on)
- versions and flags
- Ensuring that builds are both repeatable and hermetic: changes to external
dependencies (for example, third-party libraries) between builds of the same
software

### Software Development Engineer in test (SDET)

The main tool that SDETs use to meet their goals is testing automation. Development teams can iterate much faster when a Continuous Integration (CI) pipeline is in place to automatically test their changes across different devices and CPU architectures. Besides setting up the infrastructure for the CI pipeline and integrating it with the source code
repository system that the team uses, SDETs are often tasked with authoring and maintaining a separate set of tests. These tests fall into the following two categories:

- Acceptance tests: A set of scripted end-to-end tests to ensure that the complete system adheres to all the customer's business requirements before a new version is given the green light for a release.
- Performance regression tests: Another set of quality control tests that monitor a series of performance metrics across builds and alert you when a metric exceeds a particular threshold. These types of tests prove to be a great asset in the case where a service-level agreement (SLA) has been signed that makes seemingly innocuous changes to the code (for example, switching to a different data structure implementation) that may trigger a breach of the SLA, even though all the unit tests pass.

### System architect

The architect is the one person who sees the big picture: what
components comprise the system, how each component must be implemented, and how all the components fit and interact with each other. Apart from coming up with a high-level, component-based design for the system, the
architect is also responsible for making decisions regarding the technologies that will be used during development and setting the standards that all the development teams must adhere to.

## Software development models

The Software Development Life Cycle (SDLC) is a systematic process for building high-quality software that matches the expectations of the end user or customer while ensuring that the project's cost stays within a reasonable bound.

[Timeline](./files/ch1/ch1_timeline.png)

### Waterfall

[Waterfall](./files/ch1/ch1_waterfall.png)

### Iterative enhancement

[Iterative](./files/ch1/ch1_iterative.png)

### Spiral

[Spiral](./files/ch1/ch1_spiral.png)

The spiral development model is a risk-driven process model generator that takes a cyclic approach to progressively expand the project scope while at the same time decreasing the degree of risk.

## Agile

Agile development advocates building software in an incremental fashion by iterating in multiple, albeit relatively, short cycles. Making use of self-organizing and cross-functional teams, it evolves project requirements and solutions by fostering intra-team collaboration.

### Lean

- Eliminate waste. Anything that does not
directly add value to the final deliverable is considered as a blocker and must be removed.
Typical cases of things that are characterized as waste by this model are as follows:

1) Introduction of non-essential, that is, nice-to-have features when development is underway.
2) Overly complicated decision-making processes that force development teams to remain idle while waiting for a feature to be signed off – in other words:
bureaucracy!
3) Unnecessary communication between the various project stakeholders and the development teams. This disrupts the focus of the development team and
hinders their development velocity.

- Create knowledge. Customer knowledge / team knowledge.
- Defer commitment. The lean model actively encourages stakeholders to defer all the important and potentially irreversible decisions until a later stage in the project's development.
- Build in quality. The lean model prompts engineering teams to aggressively focus on following agile practices such as test- or behavior-driven development (TDD/BDD) in an attempt to produce lean, well-tested code with fewer defects.
- Deliver fast.
- Respect and empower people.
- See and optimize the whole. In order to maximize the value that flows
through the various stages of development, organizations must treat the development process as a sequence of inter-linked activities and optimize them as a whole.

### Scrum

As a process framework, Scrum is meant to be applied by cross-functional teams working on large projects that can be split into smaller chunks of work, where each chunk normally takes between two to four weeks – also known as a sprint in Scrum terminology – to complete.

#### Scrum roles

- The Product Owner (PO). PO is the key stakeholder in a project, that is, the person who maximizes the product's value resulting from the work of the development team. The primary responsibility of the PO is to manage the project backlog.
- The Development Team Member. The development team comprises a set of individuals who implement the tasks that have been selected from the backlog. According to the basic tenets of Scrum, the team should be
as follows:

1) It should be cross-functional, bringing people together from different disciplines and varying skill sets.
2) It should not pay attention to the job titles of its members and focus on the work that's performed instead.
3) It should be aligned toward a single goal: completing the set of tasks that the team committed to at the beginning of each sprint.

- The Scrum Master (SM). The SM supports both the PO and the development team members by ensuring that everyone has a clear understanding
of not only the team goals but also the various Scrum processes. The SM is also responsible for organizing and running the appropriate Scrum events (ceremonies) as and when required.

#### Essential Scrum events

- The first Scrum event that we will be examining is the planning session. During planning, the team examines the items from the backlog and commits to a set of tasks that the team will be working on during the next sprint.

- As you probably expect, the team needs to periodically sync up so that all the team members are on the same page with respect to the tasks that other team members are currently working on. This is facilitated by the daily stand-up, a time-boxed session that usually takes no longer than 30 minutes. Each team member speaks in turn and briefly answers the following questions:

1) What was I working on yesterday?
2) What will I be working on today?
3) Are there any blockers for completing a particular task?

- At the end of a sprint, the team usually holds a retrospective session where team members openly discuss the things that went right, as well as the things that went wrong, during the sprint. For each problem that's encountered, the team attempts to identify its root cause and
propose a series of actions to remedy it. The selected actions are applied during the next sprint cycle and their effect is re-evaluated in the next retrospective.

### Kanban

The Kanban board allows team members to visualize the set of items that teams are working on, along with their current state. The board is comprised of a series of vertically oriented work lanes or columns. Each lane has its own label and a list of items or tasks attached to it. As items or tasks are being worked on, they transition between the various
columns of the board until they eventually arrive at a column that signals their completion.
Completed items are then typically removed from the board and archived for future reference.
The standard lane configuration for software development consists of at least the following set of lanes:

1) Backlog: A set of tasks to be worked on by the team in the near future
2) Doing: The tasks in progress
3) In review: Work that has been put up for review by other team members
4) Done: Items that have been completed

Additionally: in test; deployed; blocked

### DevOps

The basic premise behind the DevOps model is that each engineering team owns the services they build.

#### CAMS

- Culture. Each company must internally evolve its own culture and set of values that suit its unique set of needs instead of simply copying them over from other organizations because they just seem to be working in a particular context. The latter could lead to what is known as the Cargo
Cult effect, which eventually creates a toxic work environment that can cause issues with employee retainment.
- Automation. 

1) Deploying a CI/CD system to ensure that all the changes are thoroughly tested before they get pushed to production
2) Treating infrastructure as code and managing it as such, that is, storing it in a version control system (VCS), having engineers review and audit infrastructure changes, and finally deploying them via tools such as Chef (https:/​/​www.​chef.io/​), puppet (https:/​/​puppet.​com/​), Ansible (https:/​/​www.​ansible.​com/​), and Terraform (https:/​/​www.​terraform.​io/​)

- Measurement. Metrics monitoring system. Not only capture the metrics but also act on them.
- Sharing. 1) To promote visibility throughout the organization 2) To encourage and facilitate knowledge sharing across teams.

#### The three ways model

The three primary principles, or ways:

- Systems thinking and workflow optimization
- Amplifying feedback loops
- Culture of continuous experimentation and learning
