from rest_framework import routers

from User.ViewsSet import UserViewSet, GroupViewSet
from Card.ViewsSet import CardViewSet, CouponViewSet, LineInCardViewSet
from Category.ViewsSet import CategoryViewSet, BrandViewSet 
from Department.ViewsSet import DepartmentViewSet
from Language.ViewsSet import LanguageViewSet
from Payment.ViewsSet import CurrencyViewSet


## User App
router = routers.DefaultRouter()
router.register('users', UserViewSet)
router.register('groups', GroupViewSet)

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
router.register('departments', LanguageViewSet)

## Currency App
router.register('Currencies', CurrencyViewSet)
