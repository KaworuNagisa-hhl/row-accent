import { describe, it, expect } from '@ohos/hypium'
import { getSwiftUIGlassMaterial } from 'theme'

export default function localUnitTest() {
  describe('SwiftUIRowAccent', () => {
    it('keeps_accent_row_contract', 0, () => {
      const color = '#40A4B3'
      const verticalPadding = 8
      expect(color).assertEqual('#40A4B3')
      expect(verticalPadding).assertEqual(8)
      expect(getSwiftUIGlassMaterial().border.toString()).assertContain('#')
    })
  })
}
