# Generated by Django 4.1.5 on 2023-02-15 10:04

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('MyCart', '0002_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='mycart',
            name='my_cart_items',
        ),
    ]
