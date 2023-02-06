# Generated by Django 4.1.5 on 2023-02-04 14:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Product', '0003_alter_productimage_product'),
        ('User', '0006_alter_profile_user'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user',
            name='favorites_products',
        ),
        migrations.AddField(
            model_name='profile',
            name='favorites_products',
            field=models.ManyToManyField(to='Product.product', verbose_name='Favorite Products'),
        ),
    ]