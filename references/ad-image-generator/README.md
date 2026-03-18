# 广告创意策略设计总览

本目录包含 7 种广告创意策略的 Prompt 架构设计心法，帮助你根据不同的营销目标选择合适的策略并编写高质量的生成 Prompt。

## 快速选择指南

| 营销目标 | 推荐策略 | 核心理念 |
|----------|----------|----------|
| 展示产品功能优势 | [Features-Benefits](./features-benefits.md) | 功能即英雄，技术即故事 |
| 建立情感连接 | [Lifestyle](./lifestyle.md) | 产品是生活的配角，场景是主角 |
| 新品发布/重大更新 | [Announcement](./announcement.md) | 制造事件感，产品成为"新闻" |
| 建立用户信任 | [Testimonial](./testimonial.md) | 真实的声音，可信的证明 |
| 解决用户痛点 | [Problem-Solution](./problem-solution.md) | 先让用户感受痛苦，再展示解脱 |
| 与竞品对比 | [Us-vs-Them](./us-vs-them.md) | 通过对比凸显自身优势 |
| 展示使用前后变化 | [Transformation](./transformation.md) | 展示戏剧性的蜕变 |

## 各策略详细文档

### 1. [Features-Benefits](./features-benefits.md)
**核心理念**：功能即英雄，技术即故事

**适用场景**：
- 产品有明确的功能优势
- 用户在比较产品参数
- 需要建立"产品很强"的认知

**关键章节**：UNEXPECTED ELEMENT → COMPOSITION → HEADLINE → PRODUCT PRESENTATION → VISUAL DISTINCTIVENESS

---

### 2. [Lifestyle](./lifestyle.md)
**核心理念**：产品是生活的配角，场景是真正的主角

**适用场景**：
- 品牌建设阶段
- 需要情感连接
- 目标用户追求生活品质

**关键章节**：COMPOSITION & EMOTIONAL STORY → MOOD → LIFESTYLE NARRATIVE → PRODUCT PRESENTATION

---

### 3. [Announcement](./announcement.md)
**核心理念**：制造事件感，让产品成为"新闻"

**适用场景**：
- 新品上市
- 功能重大升级
- 限时活动

**关键章节**：UNEXPECTED ELEMENT → COMPOSITION → HEADLINE → PRODUCT PRESENTATION → CALL TO ACTION

---

### 4. [Testimonial](./testimonial.md)
**核心理念**：真实的声音，可信的证明

**适用场景**：
- 需要建立信任
- 有真实用户好评
- 用户处于决策阶段

**关键章节**：CUSTOMER TESTIMONIAL → PRODUCT PRESENTATION → VISUAL DISTINCTIVENESS → AUTHENTICITY

---

### 5. [Problem-Solution](./problem-solution.md)
**核心理念**：先让用户感受痛苦，再展示解脱

**适用场景**：
- 用户有明确痛点
- 产品能解决具体问题
- 需要唤醒用户需求

**关键章节**：PROBLEM ZONE → VISUAL PIVOT → SOLUTION ZONE → EMOTIONAL ARC

---

### 6. [Us-vs-Them](./us-vs-them.md)
**核心理念**：通过对比竞品，凸显自身优势

**适用场景**：
- 产品有明确差异化
- 用户在比较不同方案
- 需要快速建立选择理由

**关键章节**：LEFT SIDE (THEM) → CENTER DIVIDER → RIGHT SIDE (US) → KEY CALLOUTS

---

### 7. [Transformation](./transformation.md)
**核心理念**：展示"使用前后"的戏剧性变化

**适用场景**：
- 产品能带来明显升级
- 用户想要"变得更好"
- 需要激发渴望情感

**关键章节**：BEFORE STATE → TRANSFORMATION MOMENT → AFTER STATE → VISUAL JOURNEY

---

## 通用设计原则

### 1. UNEXPECTED ELEMENT（意外元素）
所有策略都强调"意外元素"——打破品类常规的视觉创意，让用户"停止滚动"。

### 2. 产品必须"活着"
无论哪种策略，产品都不应该是静态的展示，而是"正在工作"、"正在解决问题"、"正在融入生活"。

### 3. 标题融入构图
标题不是"贴"在画面上，而是"长"在构图里，成为视觉设计的一部分。

### 4. 品牌色点缀
使用品牌色 #a36710 作为强调色，而非主色调，创造视觉焦点。

### 5. 移动端优先
所有设计都要考虑移动端展示，确保大字体、清晰层级、垂直构图。

---

## 文件结构

```
references/
├── README.md                 # 本文件 - 总览
├── features-benefits.md      # 功能优势型
├── lifestyle.md              # 生活方式型
├── announcement.md           # 公告发布型
├── testimonial.md            # 用户证言型
├── problem-solution.md       # 问题解决型
├── us-vs-them.md             # 对比竞品型
└── transformation.md         # 蜕变升级型
```

---

## 使用建议

1. **先确定营销目标**，再选择策略
2. **阅读对应文档**，理解核心理念和章节结构
3. **使用模板**，填充具体内容
4. **检查清单**，确保关键要素完整
5. **迭代优化**，根据生成效果调整 Prompt
