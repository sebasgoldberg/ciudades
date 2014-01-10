# coding=utf-8
import cities_light

COUNTRY_FILTER = ('AR', 'BR')

def filter_city_import(sender, items, **kwargs):
  if items[8] not in ('AR', 'BR'):
    raise cities_light.InvalidItems()

cities_light.signals.city_items_pre_import.connect(filter_city_import)

def filter_region_import(sender, items, **kwargs):
  if items[0].split('.')[0] not in ('AR', 'BR'):
    raise cities_light.InvalidItems()

cities_light.signals.region_items_pre_import.connect(filter_region_import)

