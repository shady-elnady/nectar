from rest_framework import routers

from User.ViewsSet import (
    UserViewSet, GroupViewSet,
    FollowingViewSet, MyProfileViewSet,
)
from Card.ViewsSet import CardViewSet, CouponViewSet, LineInCardViewSet
from Category.ViewsSet import CategoryViewSet, BrandViewSet 
from Department.ViewsSet import DepartmentViewSet
from Language.ViewsSet import LanguageViewSet
from Application.ViewsSet import ApplicationViewSet, PlatformViewSet
from Payment.ViewsSet import CurrencyViewSet
from Product.ViewsSet import ProductViewSet, ProductImageViewSet
from Unit.ViewsSet import PrefixViewSet, UnitViewSet
from Location.ViewsSet import (
    StreetViewSet, RegionViewSet, CityViewSet,
    GovernorateViewSet, AddressViewSet,
    GeoViewSet, CountryViewSet,
)
from Order.ViewsSet import RefundViewSet, OrderViewSet


## User App
router = routers.DefaultRouter()
router.register('users', UserViewSet)
router.register('groups', GroupViewSet)
router.register('followings', FollowingViewSet)
router.register('my_profiles', MyProfileViewSet)

## Card App
router.register('cards', CardViewSet)
router.register('coupons', CouponViewSet)
router.register('linesInCard', LineInCardViewSet)

## Category App
router.register('brands', BrandViewSet)
router.register('categories', CategoryViewSet)

## Department App
router.register('departments', DepartmentViewSet)

## Language App
router.register('languages', LanguageViewSet)

## Application App
router.register('platforms', PlatformViewSet)
router.register('applications', ApplicationViewSet)

## Payment App
router.register('Currencies', CurrencyViewSet)

## Product App
router.register('products', ProductViewSet)
router.register('productImages', ProductImageViewSet)

## Unit App
router.register('prefixes', PrefixViewSet)
router.register('units', UnitViewSet)

## Order App
router.register('orders', OrderViewSet)
router.register('refunds', RefundViewSet)

## Loction App
router.register('streets', StreetViewSet)
router.register('cities', CityViewSet)
router.register('regions', RegionViewSet)
router.register('governorates', GovernorateViewSet)
router.register('address', AddressViewSet)
router.register('geo', GeoViewSet)
router.register('countries', CountryViewSet)
