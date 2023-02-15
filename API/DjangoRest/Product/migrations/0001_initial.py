# Generated by Django 4.1.5 on 2023-02-15 09:18

import Nectar.methods
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('Category', '0001_initial'),
        ('Unit', '0001_initial'),
        ('Payment', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Product',
            fields=[
                ('name', models.CharField(max_length=100, primary_key=True, serialize=False, verbose_name='Name')),
                ('image', models.ImageField(blank=True, default='images/{instance.__class__.__name__}/default.jpg', null=True, upload_to=Nectar.methods.upload_to, verbose_name='Image')),
                ('nutritions', models.CharField(blank=True, max_length=30, null=True, verbose_name='Nutritions')),
                ('amount', models.FloatField(blank=True, default=1, null=True, verbose_name='Amount')),
                ('reviews', models.FloatField(blank=True, null=True, verbose_name='Reviews')),
                ('serial', models.CharField(max_length=50, unique=True, verbose_name='Serial No.')),
                ('price', models.FloatField(blank=True, null=True, verbose_name='Price')),
                ('detail', models.TextField(blank=True, null=True, verbose_name='Detail')),
                ('is_favorite', models.BooleanField(default=False, verbose_name='is Favorite')),
                ('brand', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='Products', to='Category.brand', verbose_name='Brand')),
                ('category', models.ForeignKey(limit_choices_to={'category_parent__isnull': False}, on_delete=django.db.models.deletion.CASCADE, related_name='Products', to='Category.category', verbose_name='Category')),
                ('currency', models.ForeignKey(default='$', on_delete=django.db.models.deletion.CASCADE, related_name='Products', to='Payment.currency', verbose_name='Currency')),
                ('unit', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='Measurment_Products', to='Unit.unit', verbose_name='Unit')),
            ],
            options={
                'verbose_name': 'Product',
                'verbose_name_plural': 'Products',
            },
        ),
        migrations.CreateModel(
            name='ProductImage',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(blank=True, default='images/{instance.__class__.__name__}/default.jpg', null=True, upload_to=Nectar.methods.upload_to, verbose_name='Image')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='product_images', to='Product.product', verbose_name='Product')),
            ],
            options={
                'verbose_name': 'Product Image',
                'verbose_name_plural': 'Product Images',
            },
        ),
    ]
