# row-accent

`row-accent` 是一个 OpenHarmony/HarmonyOS ArkUI like-ios 强调行容器组件，适合包裹自定义内容，并给内容左侧添加 SwiftUI 风格强调条。默认呈现黑色优先的纯色毛玻璃行卡片，可自定义强调色、填充色、宽高、圆角、边框、阴影和垂直内边距。

## 实际运行效果

下面展示左侧强调条和自定义内容区域的毛玻璃行容器：

![row accent preview](https://cdn.jsdelivr.net/gh/KaworuNagisa-hhl/row-accent@main/docs/row-accent-preview.gif)

## 安装

```bash
ohpm install row-accent
```

本地源码依赖：

```json5
{
  "dependencies": {
    "row-accent": "file:../row-accent",
    "theme": "file:../theme"
  }
}
```

## 正常使用样式

```ts
import { SwiftUIRowAccent } from 'row-accent'
import { SwiftUITone } from 'theme'

@Builder
function MedicationRowContent() {
  Column({ space: 4 }) {
    Text('晚间用药')
      .fontSize(15)
      .fontWeight(FontWeight.Bold)

    Text('21:00 前确认一次。')
      .fontSize(13)
      .fontColor('#D6D6D6')
  }
  .width('100%')
  .alignItems(HorizontalAlign.Start)
}

@Component
struct MedicationAccentRow {
  build() {
    SwiftUIRowAccent({
      tone: SwiftUITone.GlassBlack,
      color: '#141414',
      contentBuilder: MedicationRowContent
    })
  }
}
```

## 自定义品牌样式

```ts
SwiftUIRowAccent({
  componentWidth: '100%',
  componentHeight: 76,
  color: '#141414',
  fill: '#C2141414',
  accentWidth: 4,
  verticalPadding: 12,
  customBorderColor: '#66235595',
  customBorderWidth: 1,
  cornerRadius: 8,
  shadowColor: '#10235595',
  contentBuilder: MedicationRowContent
})
```

## API

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| `color` | `ResourceColor` | 黑色主色 | 强调条颜色 |
| `fill` | `ResourceColor` | `'#C2141414'` | 黑色玻璃填充参与色 |
| `verticalPadding` | `number` | `8` | 垂直内边距 |
| `tone` | `SwiftUITone` | `GlassBlack` | 默认 like-ios 黑色毛玻璃色调 |
| `componentWidth` | `Length` | `'100%'` | 行宽度 |
| `componentHeight` | `Length` | `'auto'` | 行高度 |
| `accentWidth` | `number` | `3` | 强调条宽度 |
| `customBorderColor` | `ResourceColor` | 自动边框 | 自定义边框色 |
| `customBorderWidth` | `number` | `1.1` | 边框宽度 |
| `cornerRadius` | `number` | `12` | 圆角 |
| `shadowColor` | `ResourceColor` | 自动阴影 | 阴影颜色 |
| `contentBuilder` | `() => void` | 空内容 | 自定义行内容 |
