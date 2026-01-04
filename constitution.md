# AI-Codeing 项目开发宪法
# Version: 1.0

本文件定义了本项目不可动摇的核心开发原则。所有AI Agent在进行技术规划和代码实现时，必须无条件遵循。

---

## 第一条：简单性原则 (Simplicity First)
**核心：** 遵循"少即是多"哲学。绝不进行不必要的抽象，绝不引入非必需的依赖。
- **1.1 (YAGNI):** 只实现`specs/`中明确要求的功能，不预置未来可能需要的特性。
- **1.2 (框架默认优先):**
  - NestJS：优先使用内置模块（@nestjs/common），如 ValidationErrorException、Logger
  - Vue3：优先使用 Composition API 和 `<script setup>` 语法
- **1.3 (反过度工程):**
  - 组件保持单一职责，超过300行考虑拆分
  - 避免过度抽象，简单清晰的代码优于复杂的继承体系
- **1.4 (依赖审查):** 引入新依赖前必须评估：是否必需？维护状态如何？体积大小？

---

## 第二条：测试先行铁律 (Test-First Imperative) - 不可协商
**核心：** 所有新功能或Bug修复，都必须从编写一个（或多个）失败的测试开始。
- **2.1 (TDD循环):** 严格遵循"Red-Green-Refactor"循环
- **2.2 (测试类型):**
  - **NestJS 后端：**
    - 单元测试：Jest，覆盖 Service、Guard、Pipe
    - 集成测试：使用 `@nestjs/testing`，覆盖 Controller 端到端流程
    - E2E测试：关键业务流程必须覆盖
  - **Vue3 前端：**
    - 组件测试：Vitest + Vue Test Utils
    - E2E测试：Playwright 或 Cypress
- **2.3 (测试覆盖率):** 核心业务逻辑覆盖率不低于 80%
- **2.4 (拒绝Mock滥用):** 优先编写集成测试，真实环境优于Mock环境

---

## 第三条：明确性原则 (Clarity and Explicitness)
**核心：** 代码的首要目的是让人类易于理解。
- **3.1 (错误处理 - 不可协商):**
  - **NestJS：** 所有异常必须通过 NestJS 内置异常处理器抛出
  - **Vue：** 组件内错误通过 errorHandler 捕获，用户友好的错误提示
  - **API：** 统一的错误响应格式 `{ code, message, timestamp }`
- **3.2 (类型安全):**
  - **TypeScript 严格模式：** `strict: true`，禁止使用 `any`
  - **DTO 验证：** 使用 `class-validator` 和 `class-transformer`
  - **接口优先：** 先定义 TypeScript 接口/类型，再实现
- **3.3 (无全局状态):**
  - **Vue：** 使用 Pinia 进行状态管理，禁止全局变量
  - **NestJS：** 依赖注入显式声明，避免全局模块滥用
- **3.4 (命名规范):**
  - 文件名：kebab-case（`user-profile.ts`）
  - 组件名：PascalCase（`UserProfile.vue`）
  - 变量/函数：camelCase（`getUserData`）

---

## 第四条：前后端分离规范 (Frontend-Backend Separation)
**核心：** 清晰的职责边界，高效的协作模式。
- **4.1 (API 设计):**
  - RESTful 风格，遵循资源导向
  - 统一版本控制：`/api/v1/`
  - OpenAPI/Swagger 文档必须同步更新
- **4.2 (数据传输):**
  - 请求：JSON 格式，明确 Content-Type
  - 响应：统一格式 `{ success, data, error, meta }`
  - 分页：`{ items, total, page, pageSize }`
- **4.3 (认证授权):**
  - JWT Token 认证
  - Refresh Token 机制
  - 前端：axios 拦截器统一处理 Token
- **4.4 (CORS 配置):** 开发环境允许本地调试，生产环境严格限制域名

---

## 第五条：性能与安全 (Performance & Security)
**核心：** 不可妥协的安全底线，持续优化的性能意识。
- **5.1 (安全清单):**
  - 输入验证：前后端双重验证
  - SQL 注入防护：使用 TypeORM/Prisma 参数化查询
  - XSS 防护：Vue 自动转义，避免 `v-html`
  - CSRF：Token 验证
  - 敏感数据：环境变量存储，`.env` 文件加入 `.gitignore`
- **5.2 (性能优化):**
  - **前端：**
    - 路由懒加载（`defineAsyncComponent`）
    - 虚拟滚动处理大列表
    - 图片懒加载与压缩
  - **后端：**
    - 数据库查询优化（索引、N+1问题）
    - 缓存策略（Redis）
    - 响应压缩（Gzip）
- **5.3 (日志记录):**
  - NestJS：结构化日志（Winston/Pino）
  - Vue：错误日志上报
  - 敏感信息脱敏

---

## 第六条：代码质量与规范 (Code Quality & Standards)
**核心：** 团队协作的基石，可维护性的保障。
- **6.1 (Lint 格式化):**
  - ESLint + Prettier 统一配置
  - Husky + lint-staged 提交前检查
  - 自动化格式化，不讨论格式问题
- **6.2 (Commit 规范):**
  - Conventional Commits：`feat:`, `fix:`, `chore:`, `docs:` 等
  - Commit Message 清晰表达"做了什么"和"为什么"
- **6.3 (代码审查):**
  - PR 必须 Code Review
  - 一个 PR 不超过 400 行
  - 自动化 CI/CD 检查通过才能合并

---

## 第七条：文档与知识沉淀 (Documentation)
**核心：** 代码是唯一的真相来源，但文档是理解的捷径。
- **7.1 (API 文档):** Swagger 自动生成，保持最新
- **7.2 (组件文档):** 复杂组件必须编写使用示例和 Storybook
- **7.3 (架构文档):** `specs/` 目录下记录关键设计决策
- **7.4 (注释规范):**
  - 不注释"做什么"，注释"为什么"
  - 复杂逻辑必须有注释说明

---

## 治理 (Governance)
本宪法具有最高优先级，其效力高于任何 `CLAUDE.md` 或单次会话中的指令。

**修改流程：**
1. 需要修改宪法时，必须在 `specs/` 提出议题
2. 团队讨论通过后更新版本号
3. 所有历史提交按旧宪法执行，新提交按新宪法执行

**违背后果：**
- 轻微违背：Code Review 拒绝，要求重写
- 严重违背（如跳过测试、忽略安全）：回滚提交，重新开发

---

*本宪法由团队共同制定并维护，旨在构建高质量、可维护、安全可靠的产品。*
