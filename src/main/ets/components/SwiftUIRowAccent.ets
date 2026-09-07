import {
  getSwiftUIGlassMaterial,
  getSwiftUIPalette,
  SWIFT_UI_RADIUS_CONTROL,
  SWIFT_UI_SPACING_EXTRA_SMALL,
  SWIFT_UI_SPACING_SMALL,
  swiftUIColorWithOpacity,
  SwiftUITone
} from 'theme'

@Builder
function EmptyBuilder() {
  Blank()
}

@Component
export struct SwiftUIRowAccent {
  @Prop color: ResourceColor = getSwiftUIPalette().primary
  @Prop fill: ResourceColor = '#C2141414'
  @Prop verticalPadding: number = SWIFT_UI_SPACING_SMALL
  @Prop tone: SwiftUITone = SwiftUITone.GlassBlack
  @Prop componentWidth: Length = '100%'
  @Prop componentHeight: Length = 'auto'
  @Prop accentWidth: number = 3
  @Prop customBorderColor: ResourceColor = '#00000000'
  @Prop customBorderWidth: number = 1.1
  @Prop cornerRadius: number = SWIFT_UI_RADIUS_CONTROL
  @Prop shadowColor: ResourceColor = '#00000000'
  @State contentHeight: number = 0
  @BuilderParam contentBuilder: () => void = EmptyBuilder

  private resolvedBorderColor(): ResourceColor {
    return this.customBorderColor === '#00000000' ? swiftUIColorWithOpacity(this.color, 0.30) : this.customBorderColor
  }

  private resolvedShadowColor(): ResourceColor {
    return this.shadowColor === '#00000000' ? swiftUIColorWithOpacity(this.color, 0.08) : this.shadowColor
  }

  build() {
    Row({ space: SWIFT_UI_SPACING_SMALL }) {
      Blank()
        .width(this.accentWidth)
        .height(this.contentHeight)
        .backgroundColor(this.color)
        .borderRadius(2)
        .margin({ top: SWIFT_UI_SPACING_EXTRA_SMALL, bottom: SWIFT_UI_SPACING_EXTRA_SMALL })

      Column() {
        this.contentBuilder()
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .onAreaChange((oldArea, newArea) => {
        this.contentHeight = Number(newArea.height)
      })
    }
    .width(this.componentWidth)
    .height(this.componentHeight)
    .padding({ left: SWIFT_UI_SPACING_SMALL, right: SWIFT_UI_SPACING_SMALL, top: this.verticalPadding, bottom: this.verticalPadding })
    .linearGradient({
      direction: GradientDirection.RightBottom,
      colors: [
        [getSwiftUIGlassMaterial(this.tone).fillStrong, 0.0],
        [swiftUIColorWithOpacity(this.fill, 0.72), 0.58],
        [swiftUIColorWithOpacity(this.color, 0.10), 1.0]
      ]
    })
    .backgroundBlurStyle(BlurStyle.Regular)
    .borderRadius(this.cornerRadius)
    .border({ width: this.customBorderWidth, color: this.resolvedBorderColor() })
    .shadow({ radius: 12, color: this.resolvedShadowColor(), offsetX: 0, offsetY: 5 })
    .alignItems(VerticalAlign.Top)
  }
}
