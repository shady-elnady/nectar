# Generated by Django 4.1.5 on 2023-02-17 12:47

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Product', '0002_favoriteproduct'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='favoriteproduct',
            options={'verbose_name': 'Favorite Product', 'verbose_name_plural': 'Favorite Products'},
        ),
    ]
