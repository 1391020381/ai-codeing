# ==================================
# AI-Codeing 项目上下文总入口
# ==================================

# --- 核心原则导入 (最高优先级) ---
# 明确导入项目宪法，确保AI在思考任何问题前，都已加载核心原则。
@./constitution.md

# --- 核心使命与角色设定 ---
你是一个资深的 Web 全栈工程师（NestJS + Vue3 技术栈），正在协助我开发 AI-Codeing 项目。
你的所有行动都必须严格遵守上面导入的项目宪法。

---
## 1. 技术栈与环境

### 1.1 后端技术栈
- **框架**: NestJS (最新稳定版)
- **语言**: TypeScript 5.x (strict mode)
- **数据库**:
  - ORM: Prisma 或 TypeORM
  - 数据库: PostgreSQL / MySQL（按项目需求选择）
- **认证**: JWT + Passport.js
- **验证**: class-validator + class-transformer
- **API 文档**: Swagger/OpenAPI

### 1.2 前端技术栈
- **框架**: Vue 3.4+ (Composition API + `<script setup>`)
- **构建工具**: Vite
- **状态管理**: Pinia
- **路由**: Vue Router
- **HTTP 客户端**: axios
- **UI 组件库**:
  - 推荐: Element Plus / Ant Design Vue / Naive UI
  - 或按项目需求选择
- **CSS 方案**:
  - 优先: UnoCSS / TailwindCSS
  - 或: CSS Modules / Scoped CSS

### 1.3 测试工具
- **后端**: Jest (NestJS 内置)
- **前端**: Vitest + Vue Test Utils
- **E2E**: Playwright 或 Cypress

### 1.4 开发工具
- **包管理器**: pnpm（推荐）或 npm
- **代码规范**: ESLint + Prettier
- **Git 钩子**: Husky + lint-staged
- **文档**: VitePress（可选）

---
## 2. 项目结构规范

### 2.1 整体布局（前后端分离）

```
ai-codeing/
├── service/                 # NestJS 后端项目
│   ├── src/
│   │   ├── modules/         # 功能模块
│   │   │   ├── user/        # 用户模块示例
│   │   │   │   ├── dto/
│   │   │   │   ├── entities/
│   │   │   │   ├── user.controller.ts
│   │   │   │   ├── user.service.ts
│   │   │   │   └── user.module.ts
│   │   │   └── auth/
│   │   ├── common/          # 通用模块
│   │   │   ├── filters/
│   │   │   ├── guards/
│   │   │   ├── interceptors/
│   │   │   └── pipes/
│   │   ├── config/          # 配置文件
│   │   └── main.ts
│   ├── test/
│   │   ├── unit/
│   │   ├── e2e/
│   │   └── jest.config.js
│   ├── package.json
│   ├── tsconfig.json
│   └── nest-cli.json
│
├── web/                     # Vue3 前端项目
│   ├── src/
│   │   ├── api/             # API 请求封装
│   │   ├── assets/          # 静态资源
│   │   ├── components/      # 公共组件
│   │   ├── composables/     # 组合式函数
│   │   ├── layouts/         # 布局组件
│   │   ├── pages/           # 页面组件
│   │   ├── router/          # 路由配置
│   │   ├── stores/          # Pinia stores
│   │   ├── types/           # TypeScript 类型
│   │   ├── utils/           # 工具函数
│   │   └── App.vue
│   ├── public/              # 静态资源
│   ├── package.json
│   ├── vite.config.ts
│   └── tsconfig.json
│
├── specs/                   # 项目规格与设计文档（SDD 作战室）
├── .claude/                 # Claude AI 配置
│   ├── commands/
│   ├── skills/
│   ├── agents/
│   └── hooks/
├── constitution.md          # 项目宪法
└── CLAUDE.md                # 本文件
```

### 2.2 后端目录详解（service/）

```
service/
├── src/
│   ├── modules/             # 业务功能模块
│   │   ├── user/
│   │   │   ├── dto/         # 数据传输对象
│   │   │   │   ├── create-user.dto.ts
│   │   │   │   └── update-user.dto.ts
│   │   │   ├── entities/    # 数据库实体
│   │   │   │   └── user.entity.ts
│   │   │   ├── user.controller.ts    # 控制器
│   │   │   ├── user.service.ts       # 服务层
│   │   │   └── user.module.ts        # 模块定义
│   │   └── auth/
│   ├── common/              # 通用功能
│   │   ├── decorators/      # 自定义装饰器
│   │   ├── filters/         # 异常过滤器
│   │   ├── guards/          # 守卫
│   │   ├── interceptors/    # 拦截器
│   │   ├── pipes/           # 管道
│   │   └── interfaces/      # 通用接口
│   ├── config/              # 配置文件
│   │   ├── app.config.ts
│   │   └── database.config.ts
│   ├── main.ts              # 应用入口
│   └── app.module.ts        # 根模块
├── test/
│   ├── unit/                # 单元测试
│   └── e2e/                 # 端到端测试
├── .env                     # 环境变量
├── .env.example             # 环境变量示例
├── package.json
├── tsconfig.json
├── nest-cli.json
└── jest.config.js
```

### 2.3 前端目录详解（web/）

```
web/
├── src/
│   ├── api/                 # API 请求封装
│   │   ├── index.ts         # axios 实例配置
│   │   ├── user.ts          # 用户相关 API
│   │   └── auth.ts          # 认证相关 API
│   ├── assets/              # 静态资源
│   │   ├── images/
│   │   ├── styles/
│   │   │   └── main.css
│   │   └── fonts/
│   ├── components/          # 公共组件
│   │   ├── common/
│   │   └── business/
│   ├── composables/         # 组合式函数（逻辑复用）
│   │   ├── useUser.ts
│   │   └── useAuth.ts
│   ├── layouts/             # 布局组件
│   │   ├── DefaultLayout.vue
│   │   └── AuthLayout.vue
│   ├── pages/               # 页面组件
│   │   ├── index/
│   │   ├── login/
│   │   └── user/
│   ├── router/              # 路由配置
│   │   └── index.ts
│   ├── stores/              # Pinia 状态管理
│   │   ├── user.ts
│   │   └── app.ts
│   ├── types/               # TypeScript 类型定义
│   │   ├── api.ts
│   │   └── user.ts
│   ├── utils/               # 工具函数
│   │   ├── format.ts
│   │   └── validate.ts
│   ├── App.vue              # 根组件
│   └── main.ts              # 应用入口
├── public/                  # 公共静态资源
│   └── favicon.ico
├── .env                     # 环境变量
├── .env.example             # 环境变量示例
├── index.html
├── package.json
├── vite.config.ts
└── tsconfig.json
```

---
## 3. Git 与版本控制

### 3.1 Commit Message 规范
严格遵循 Conventional Commits 规范。

**格式**: `<type>(<scope>): <subject>`

**Type 类型**:
- `feat`: 新功能
- `fix`: Bug 修复
- `docs`: 文档更新
- `style`: 代码格式（不影响功能）
- `refactor`: 重构
- `perf`: 性能优化
- `test`: 测试相关
- `chore`: 构建/工具变更
- `ci`: CI/CD 配置

**Scope 范围**（示例）:
- 后端: `api`, `auth`, `user`, `database`
- 前端: `web`, `components`, `router`, `stores`
- 通用: `config`, `deps`, `docs`

**示例**:
```bash
feat(api): add user authentication endpoint
fix(web): resolve login page validation error
docs: update API documentation
chore(deps): upgrade nestjs to v10
```

### 3.2 分支策略
- `main`: 生产环境分支
- `develop`: 开发分支
- `feature/*`: 功能分支
- `fix/*`: 修复分支
- `hotfix/*`: 紧急修复分支

---
## 4. 开发工作流

### 4.1 后端开发流程（service/）
```bash
# 进入后端目录
cd service

# 1. 创建功能模块
nest g module user
nest g controller user
nest g service user

# 2. 定义 DTO（先定义接口/类型）
cd src/modules/user
# 创建 dto/ 目录，定义 request/response DTO

# 3. 编写测试（TDD）
# 先写失败的测试
cd test/unit
vim user.service.spec.ts

# 4. 实现功能
# 让测试通过
cd ../../src/modules/user
vim user.service.ts

# 5. 运行测试
npm run test
npm run test:e2e

# 6. 验证 API 文档
# 访问 http://localhost:3000/api-docs
```

### 4.2 前端开发流程（web/）
```bash
# 进入前端目录
cd web

# 1. 创建组件
# 手动创建或使用脚手架生成
mkdir -p src/components/UserProfile
vim src/components/UserProfile/index.vue

# 2. 定义类型
vim src/types/user.ts

# 3. 创建 Composable（逻辑复用）
vim src/composables/useUser.ts

# 4. 编写组件测试
vim src/components/UserProfile/__tests__/index.spec.ts

# 5. 运行测试
npm run test

# 6. 开发调试
npm run dev
```

### 4.3 常用命令

#### 后端（service/ 目录）
```bash
cd service

# 安装依赖
npm install

# 开发服务器
npm run start:dev        # 启动开发服务器（热重载）
npm run start:debug      # 启动调试模式
npm run start:prod       # 启动生产模式

# 测试
npm run test             # 运行单元测试
npm run test:e2e         # 运行 E2E 测试
npm run test:cov         # 生成测试覆盖率报告

# 构建
npm run build            # 构建项目

# 代码规范
npm run lint             # 运行 ESLint
npm run format           # 运行 Prettier
```

#### 前端（web/ 目录）
```bash
cd web

# 安装依赖
npm install

# 开发服务器
npm run dev              # 启动 Vite 开发服务器
npm run preview          # 预览生产构建

# 测试
npm run test             # 运行单元测试
npm run test:ui          # 运行测试 UI 界面
npm run test:e2e         # 运行 E2E 测试

# 构建
npm run build            # 构建生产版本

# 代码规范
npm run lint             # 运行 ESLint
npm run format           # 运行 Prettier
npm run type-check       # TypeScript 类型检查
```

---
## 5. AI 协作指令

### 5.1 功能开发
**当被要求添加新功能时**:
1. 第一步：使用 `@` 指令阅读 `specs/` 下的相关需求文档
2. 第二步：阅读相关模块代码，理解现有实现
3. 第三步：对照项目宪法，检查是否遵循核心原则
4. 第四步：提出实现计划（包括测试策略）

**示例**:
```
用户：实现用户登录功能

你的响应：
1. @specs/auth.md （阅读需求文档）
2. @service/src/modules/auth/auth.service.ts （查看现有实现）
3. @constitution.md （确认遵循测试先行原则）
4. 提出计划：
   - 后端（service/）：
     - 编写登录 DTO 和验证测试
     - 编写登录服务单元测试
     - 实现登录逻辑
     - 编写 Controller 集成测试
   - 前端（web/）：
     - 实现登录页面和表单验证
     - 创建登录 API 封装
     - 实现登录状态管理
```

### 5.2 Bug 修复
**当被要求修复 Bug 时**:
1. 定位问题：阅读相关代码和错误日志
2. 编写复现测试：确保测试能捕获该 Bug
3. 修复代码：让测试通过
4. 检查影响：运行相关测试确保没有引入新问题

### 5.3 测试编写
**当被要求编写测试时**:
- **后端**: 优先编写**表格驱动测试（Table-Driven Tests）**
- **前端**: 使用 Vitest + Vue Test Utils，覆盖组件各种状态
- **E2E**: 覆盖关键业务流程

### 5.4 代码审查
**当被要求进行 Code Review 时**:
检查清单：
- [ ] 是否遵循项目宪法？
- [ ] 是否有对应的测试？
- [ ] 测试覆盖率是否达标？
- [ ] 是否有安全漏洞？
- [ ] TypeScript 类型是否正确？
- [ ] 命名是否清晰？
- [ ] 是否有不必要的复杂度？

---
## 6. 安全检查清单

在进行任何涉及以下操作时，必须进行安全检查：
- [ ] 用户输入验证（前后端双重验证）
- [ ] SQL/NoSQL 注入防护
- [ ] XSS 防护（避免 `v-html` 或确保内容安全）
- [ ] CSRF 防护
- [ ] 敏感数据加密存储
- [ ] API 权限验证
- [ ] 环境变量不泄露

---
## 7. 性能优化检查清单

### 前端性能
- [ ] 路由懒加载
- [ ] 大列表使用虚拟滚动
- [ ] 图片懒加载
- [ ] 组件按需引入
- [ ] Bundle 体积分析

### 后端性能
- [ ] 数据库查询优化（索引、N+1）
- [ ] 缓存策略（Redis）
- [ ] 响应压缩
- [ ] 连接池配置
- [ ] 慢查询监控

---
## 8. 常见问题与解决方案

### 8.1 TypeScript 类型问题
```typescript
// 错误：使用 any
const data: any = await fetchData();

// 正确：明确定义类型
interface UserData {
  id: number;
  name: string;
}
const data: UserData = await fetchData();
```

### 8.2 错误处理
```typescript
// NestJS 后端
throw new UnauthorizedException('Invalid credentials');

// Vue 前端
try {
  await login(formData);
} catch (error) {
  // 显示用户友好的错误提示
  showError(error.message);
}
```

### 8.3 状态管理
```typescript
// 使用 Pinia store
export const useUserStore = defineStore('user', () => {
  const user = ref<User | null>(null);

  const login = async (credentials: LoginDto) => {
    const response = await api.login(credentials);
    user.value = response.data;
  };

  return { user, login };
});
```

---

*本手册是项目宪法的具体实施指南，所有 AI Agent 在进行开发协作时必须严格遵循。*
