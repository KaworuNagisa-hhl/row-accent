import {
  getSwiftUIGlassMaterial,
  getSwiftUIPalette,
  SWIFT_UI_RADIUS_CONTROL,
  SWIFT_UI_SPACING_EXTRA_SMALL,
  SWIFT_UI_SPACING_SMALL,
  swiftUIColorWithOpacity,
  SwiftUIComponentConfig,
  SwiftUITone
} from 'theme'

@Builder
function EmptyBuilder() {
  Blank()
}

@Component
export struct SwiftUIRowAccent {
  @Prop config: SwiftUIComponentConfig = new SwiftUIComponentConfig()
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

  private resolvedTone(): SwiftUITone {
    return this.config.tone === undefined ? this.tone : this.config.tone
  }

  private resolvedColor(): ResourceColor {
    return this.config.color === undefined ? this.color : this.config.color
  }

  private resolvedFill(): ResourceColor {
    return this.config.fillColor === undefined ? this.fill : this.config.fillColor
  }

  private resolvedWidth(): Length {
    return this.config.width === undefined ? this.componentWidth : this.config.width
  }

  private resolvedHeight(): Length {
    return this.config.height === undefined ? this.componentHeight : this.config.height
  }

  private resolvedCornerRadius(): number {
    return this.config.cornerRadius === undefined ? this.cornerRadius : this.config.cornerRadius
  }

  private resolvedBorderWidth(): number {
    return this.config.borderWidth === undefined ? this.customBorderWidth : this.config.borderWidth
  }

  private resolvedVerticalPadding(): number {
    return this.config.contentPadding === undefined ? this.verticalPadding : this.config.contentPadding
  }

  private resolvedBorderColor(): ResourceColor {
    if (this.config.borderColor) {
      return this.config.borderColor
    }
    return this.customBorderColor === '#00000000' ? swiftUIColorWithOpacity(this.resolvedColor(), 0.30) : this.customBorderColor
  }

  private resolvedShadowColor(): ResourceColor {
    if (this.config.shadowColor) {
      return this.config.shadowColor
    }
    return this.shadowColor === '#00000000' ? swiftUIColorWithOpacity(this.resolvedColor(), 0.08) : this.shadowColor
  }

  build() {
    Row({ space: SWIFT_UI_SPACING_SMALL }) {
      Blank()
        .width(this.accentWidth)
        .height(this.contentHeight)
        .backgroundColor(this.resolvedColor())
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
    .width(this.resolvedWidth())
    .height(this.resolvedHeight())
    .padding({ left: SWIFT_UI_SPACING_SMALL, right: SWIFT_UI_SPACING_SMALL, top: this.resolvedVerticalPadding(), bottom: this.resolvedVerticalPadding() })
    .linearGradient({
      direction: GradientDirection.RightBottom,
      colors: [
        [getSwiftUIGlassMaterial(this.resolvedTone()).fillStrong, 0.0],
        [swiftUIColorWithOpacity(this.resolvedFill(), 0.72), 0.58],
        [swiftUIColorWithOpacity(this.resolvedColor(), 0.10), 1.0]
      ]
    })
    .backgroundBlurStyle(BlurStyle.Regular)
    .borderRadius(this.resolvedCornerRadius())
    .border({ width: this.resolvedBorderWidth(), color: this.resolvedBorderColor() })
    .shadow({ radius: 12, color: this.resolvedShadowColor(), offsetX: 0, offsetY: 5 })
    .alignItems(VerticalAlign.Top)
  }
}
