# coding=utf-8
import os

class ambiente:
  productivo=True
  app_in_dev=None

  class db:
    name='ciudades' #Cambiar a lo que corresponda
    user='ciudades' #Cambiar a lo que corresponda
    password='ciudades' #Cambiar a lo que corresponda

  project_directory = '%s/' % os.path.abspath('%s/..' % os.path.split(os.path.abspath(__file__))[0])

