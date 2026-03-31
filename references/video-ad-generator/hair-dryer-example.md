# 完整示例：吹风机 15 秒电商广告（v5.1 视觉锚点流程）

> 目标人群：北美 25-35 岁白领女性 | 平台：TikTok | 比例：9:16

## 阶段一输入信息

- 产品：高速吹风机
- 外观：樱花粉，金属哑光质感，手枪式造型，25cm x 35cm
- 关键细节：两个按钮（风力档位 + 模式切换：热/冷/冷热循环）
- 卖点：极速干发不伤发、颜值高百搭、工业电机耐用、三年质保只换不修
- 用户想法：针对北美白领女性的广告
- 时长：15s
- 平台：TikTok → 自动推导比例 9:16

## 阶段一输出：创意方案 + 概念图

### 方案 A：品牌广告片 — "迟到女孩的逆袭"

**概念图生成**：
```bash
kamay image generate-image \
  --prompt "A modern minimalist bathroom in warm golden morning light, a sakura pink hair dryer on white marble counter, steam on mirror, rushed morning atmosphere, lifestyle photography, 9:16 vertical composition" \
  --name "hairdryer-concept-A" \
  --aspect-ratio "9:16"
```

- **爆款逻辑**：反差 + 人群
- **钩子点**：湿发+焦虑看手表 → 极速干发后自信出门
- **情绪弧线**：焦虑 → 转折 → 自信 → 精致
- **卖点植入**：极速干发（核心画面）、颜值（产品特写）、静音（对比暗示）
- **场景/风格**：现代简约公寓，晨光，暖色调，轻奢生活感
- **音频设计**：紧张钢琴 → 轻快电子 pop，按钮声 + 吹风声 + 高跟鞋，少量画外音

（方案 B/C 省略）

**用户选择：方案 A**

---

## 阶段二

### Step 5: 风格锁定

**Style Prefix:**
```
Warm golden hour lighting, soft bokeh background,
minimal lifestyle aesthetic, sakura pink and white
color palette, natural indoor setting, cinematic grain,
9:16 vertical frame
```

### Step 6: 生成视觉锚点图集

**分析创意方案**：方案 A 是品牌广告片（场景故事），包含人物 + 产品 + 固定场景（浴室）。
→ 需要全部三种锚点：产品锚点 + 角色锚点 + 场景锚点。

#### 产品锚点

```bash
kamay image generate-image \
  --prompt "Warm golden hour lighting, soft bokeh background, minimal lifestyle aesthetic, sakura pink and white color palette, natural indoor setting, cinematic grain. A sakura pink matte metallic hair dryer (pistol-grip, 25x35cm, two buttons) on white marble countertop, beside a small flower bouquet, warm morning light from window, product photography" \
  --name "hairdryer-anchor-product" \
  --reference-images "mention://resource/产品原图" \
  --aspect-ratio "9:16"
# 用产品原图做 reference 确保外观一致
# 也可以直接用本地路径：--reference-images "./product.jpg"
```

#### 角色锚点

**角色描述**（后续所有人物镜头必须逐字复用）：
```
Young East Asian woman, late 20s, shoulder-length dark brown hair,
slim build, wearing white oversized cotton t-shirt,
natural minimal makeup, warm skin tone
```

```bash
kamay image generate-image \
  --prompt "Warm golden hour lighting, soft bokeh background, minimal lifestyle aesthetic, sakura pink and white color palette, natural indoor setting, cinematic grain. Young East Asian woman, late 20s, shoulder-length dark brown hair, slim build, wearing white oversized cotton t-shirt, natural minimal makeup, warm skin tone. Standing in modern bathroom, morning light on face, relaxed expression, portrait style" \
  --name "hairdryer-anchor-character" \
  --aspect-ratio "9:16"
```

#### 场景锚点

```bash
kamay image generate-image \
  --prompt "Warm golden hour lighting, soft bokeh background, minimal lifestyle aesthetic, sakura pink and white color palette, natural indoor setting, cinematic grain. Modern minimalist bathroom interior, white marble vanity, window with horizontal blinds casting warm light stripes, round mirror, small flower vase, clean and bright, no person, interior photography" \
  --name "hairdryer-anchor-scene" \
  --aspect-ratio "9:16"
```

**锚点图集记录：**
```
视觉锚点图集：
  - 产品锚点：mention://image/aaa — 樱花粉吹风机在大理石台面，晨光
  - 角色锚点：mention://image/bbb — 穿白T短发亚裔女性，浴室晨光
  - 场景锚点：mention://image/ccc — 现代简约浴室，百叶窗晨光
```

### Step 7: 分镜脚本（3 个 shot，比原来 4 个更精简）

> 15 秒视频推荐 3-4 个 shot。此处合并了"自信出门"和"产品英雄镜头"为一个收尾，减少一致性风险。

---

#### Shot 1: 0-5s — 钩子：迟到焦虑 + 产品登场

| 字段 | 值 |
|------|-----|
| 景别/运镜 | 中景→特写，快横摇→停在产品 |
| 画面 | 年轻女性湿发贴肩焦急看手表 → 镜头摇到洗手台 → 停在吹风机上 |
| 产品状态 | 后半段入画，居中特写 |
| 音频 | 紧张钢琴 + 时钟滴答 + "Running late again?" |
| **引用锚点** | **角色锚点 + 产品锚点 + 场景锚点** |
| **recommended_model** | **Kling**（人物+产品交互，需灵活 5s 时长） |

**先生成 shot 参考图**（画面与锚点差异大，需要专门生成）：

```bash
kamay image generate-image \
  --prompt "Warm golden hour lighting, soft bokeh background, minimal lifestyle aesthetic, sakura pink and white color palette, natural indoor setting, cinematic grain, 9:16 vertical frame. Young East Asian woman, late 20s, shoulder-length dark brown hair, slim build, wearing white oversized cotton t-shirt, natural minimal makeup, warm skin tone. Standing in modern bathroom looking anxiously at watch, wet hair clinging to shoulders, steam on mirror. Sakura pink matte hair dryer visible on marble counter." \
  --name "hairdryer-shot1-ref" \
  --reference-images "mention://image/bbb" "mention://image/aaa" \
  --aspect-ratio "9:16"
# reference 角色锚点 + 产品锚点
```

**视频生成：**

```bash
kamay video submit \
  --model kling \
  --prompt "Warm golden hour lighting, soft bokeh, minimal lifestyle, sakura pink and white palette, natural indoor, cinematic grain, 9:16 vertical. Young East Asian woman, late 20s, shoulder-length dark brown hair, white oversized cotton t-shirt. Medium shot in modern bathroom, wet hair on shoulders, glances at watch anxiously. Quick pan right, camera settles on sakura pink matte hair dryer on marble vanity. Morning light through blinds." \
  --image "mention://image/shot1-ref" \
  --duration 5 \
  --ratio "9:16" \
  --sound on
```
→ prompt: 780 chars ✅

---

#### Shot 2: 5-10s — 极速干发（核心卖点）

| 字段 | 值 |
|------|-----|
| 景别/运镜 | 特写→中景，慢推+环绕 |
| 画面 | 拿起吹风机开机，慢镜头气流吹动发丝从湿变蓬松，微笑表情 |
| 产品状态 | 单手持握，材质和按钮清晰可见 |
| 音频 | 咔哒按钮声 + 柔和气流 + 转轻快电子 pop + "Not anymore." |
| **引用锚点** | **角色锚点 + 产品锚点** |
| **recommended_model** | **Veo**（subject_reference 保产品还原度最高） |

**先生成 shot 参考图**（人物动作与锚点不同）：

```bash
kamay image generate-image \
  --prompt "Warm golden hour lighting, soft bokeh background, minimal lifestyle aesthetic, sakura pink and white color palette, natural indoor setting, cinematic grain. Young East Asian woman, late 20s, shoulder-length dark brown hair, slim build, wearing white oversized cotton t-shirt. Holding sakura pink matte metallic hair dryer in right hand, blow-drying hair with smile, hair flowing in airstream, one-handed effortless grip, product buttons visible." \
  --name "hairdryer-shot2-ref" \
  --reference-images "mention://image/bbb" "mention://image/aaa" \
  --aspect-ratio "9:16"
# reference 角色锚点 + 产品锚点
```

**视频生成：**

```bash
kamay video submit \
  --model veo \
  --prompt "Warm golden hour lighting, soft bokeh, minimal lifestyle, sakura pink and white palette, cinematic grain. Close-up to medium shot, slow push-in then gentle orbit. Young East Asian woman, late 20s, shoulder-length dark brown hair, white cotton t-shirt. Picks up sakura pink matte hair dryer, presses button. Slow-motion airflow through hair strands, hair transitions from wet to fluffy. Smiles while drying, effortless one-handed grip. Two-button design visible." \
  --subject-ref "mention://resource/产品原图" \
  --style-ref "mention://image/shot2-ref" \
  --duration 8 \
  --ratio "16:9"
# subject-ref = 产品原图保一致性
# style-ref = shot 参考图控场景
# Veo + reference 强制 16:9，后期可裁切为 9:16
```
→ prompt: 520 chars ✅

---

#### Shot 3: 10-15s — 收尾：自信出门 + 产品回调

| 字段 | 值 |
|------|-----|
| 景别/运镜 | 中景→全景后拉，最后定格产品特写 |
| 画面 | 完美发型，穿外套拿包走向门口，阳光照亮发丝；镜头拉回到台面上的吹风机 |
| 产品状态 | 最后 2 秒居中特写（记忆锚点） |
| 音频 | 高跟鞋脚步 + 轻快音乐 → 单声 chime + 音乐淡出 |
| **引用锚点** | **角色锚点 + 场景锚点**（产品只在最后回调，不需要高还原特写） |
| **recommended_model** | **Kling**（灵活时长，人物运动稳定） |

**直接用角色锚点做 image**（画面与锚点较接近——同一人物同一空间，只是动作不同，可以不额外生图）：

```bash
kamay video submit \
  --model kling \
  --prompt "Warm golden hour lighting, soft bokeh, minimal lifestyle, sakura pink and white palette, natural indoor, cinematic grain, 9:16 vertical. Young East Asian woman, late 20s, shoulder-length dark brown hair, white cotton t-shirt. Hair now perfectly styled, smooth glossy bounce. Puts on coat, grabs bag, walks confidently to door. Sunlight catches hair. Camera pulls back. Last 2 seconds: sakura pink hair dryer on marble vanity, soft chime, morning light, clean composition." \
  --image "mention://image/bbb" \
  --duration 5 \
  --ratio "9:16" \
  --sound on
# 角色锚点直接做首帧
```
→ prompt: 540 chars ✅

---

### Step 9: 最终输出

```
视频广告已生成完成 ✅

| Shot | 时间 | 描述 | 模型 | 引用锚点 | 状态 |
|------|------|------|------|---------|------|
| 1 | 0-5s | 迟到焦虑+产品登场 | Kling | 角色+产品+场景 | ✅ |
| 2 | 5-10s | 极速干发展示 | Veo | 角色+产品 | ✅ |
| 3 | 10-15s | 自信出门+产品回调 | Kling | 角色+场景 | ✅ |

视觉锚点：
  - 产品锚点：mention://image/aaa
  - 角色锚点：mention://image/bbb
  - 场景锚点：mention://image/ccc

完整创意文档：[吹风机-video-ad](mention://resource/xxx)
```

---

## 对比：v5 vs v5.1

| 维度 | v5（旧） | v5.1（新） |
|------|---------|-----------|
| 一致性策略 | per-shot 独立生图 | 前置锚点图集，所有 shot 引用 |
| 人物一致性 | 无保障 | 角色锚点 + prompt 复用外貌描述 |
| 产品一致性 | 仅靠 prompt 文字 | 产品锚点 + Veo subject_reference |
| 场景一致性 | 无保障 | 场景锚点统一空间 |
| 分镜数量 | 4 shot / 15s | 3 shot / 15s（减少割裂） |
| 纯氛围镜头 | 也要判断 complexity | 不引用锚点，直接 text-to-video |
| 模型选择 | 写了策略但不执行 | 策略更明确，产品镜头强推 Veo |
