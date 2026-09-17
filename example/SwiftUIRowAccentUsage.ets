import { SwiftUIRowAccent } from 'row-accent'

@Component
export struct SwiftUIRowAccentUsage {
  build() {
    SwiftUIRowAccent({
      color: '#0B7063',
      contentBuilder: () => {
        Text('Medication reminder')
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .fontColor('#F8F8F8')
        Text('8:30 AM')
          .fontSize(13)
          .fontColor('#D6D6D6')
      }
    })
  }
}
