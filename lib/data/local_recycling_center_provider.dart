
import 'package:zero/data/recycling_center.dart';

class LocalRecyclingCenterProvider {
    static List<RecyclingCenter> recyclingCenters = [
      RecyclingCenter(
        id: 1,
        name: 'Thu mua đồng nát',
        address: 'Ng. 10 Trần Kim Xuyến, Yên Hoà, Cầu Giấy, Hà Nội, Vietnam',
        materials: [
          'Plastic',
          'Paper'
        ]
      ),
      RecyclingCenter(
        id: 2,
        name: 'Tungcuba',
        address: '57pho Hue_Hai Ba Trung, Phạm Đình Hổ, Hà Nội, 10000, Vietnam',
        materials: [
          'Metal',
        ]
      ),
      RecyclingCenter(
        id: 3,
        name: 'Thành sắt vụn',
        address: '224 Đường Lê Duẩn, Trung Phụng, Đống Đa, Hà Nội, Vietnam',
        materials: [
          'Glass',
          'Paper'
        ]
      ),
      RecyclingCenter(
        id: 4,
        name: 'Thu Mua Sắt Vụn Hàng Thanh Lý',
        address: '10c Ngõ 125 - Nguyễn Ngọc Vũ, Trung Hoà, Cầu Giấy, Hà Nội 100000, Vietnam',
        materials: [
          'Plastic',
          'Glass'
        ]
      ),
      RecyclingCenter(
        id: 5,
        name: 'Than Không Khói Tiến Mai',
        address: 'Huu Bang, Thạch Thất, Hanoi, Vietnam',
        materials: [
          'Paper'
        ]
      ),
  ];
}