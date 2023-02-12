# Generated by Django 4.1.5 on 2023-02-11 22:27

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('Product', '0003_alter_productimage_product'),
    ]

    operations = [
        migrations.CreateModel(
            name='MyBasket',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_date', models.DateTimeField(auto_now_add=True, verbose_name='Created Date')),
                ('last_updated', models.DateTimeField(auto_now=True, null=True, verbose_name='Last Update')),
                ('customer', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='Have_Baskets', to=settings.AUTH_USER_MODEL, to_field='username', verbose_name='Customer')),
            ],
            options={
                'verbose_name': 'MyBasket',
                'verbose_name_plural': 'MyBaskets',
            },
        ),
        migrations.CreateModel(
            name='MyBasketItem',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_date', models.DateTimeField(auto_now_add=True, verbose_name='Created Date')),
                ('last_updated', models.DateTimeField(auto_now=True, null=True, verbose_name='Last Update')),
                ('amount', models.SmallIntegerField(verbose_name='Amount')),
                ('my_basket', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='My_Basket_Items', to='MyBasket.mybasket', verbose_name='My Basket')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='My_Basket', to='Product.product', verbose_name='Product')),
            ],
            options={
                'verbose_name': 'MyBasket Item',
                'verbose_name_plural': 'MyBasket Items',
                'unique_together': {('my_basket', 'product')},
            },
        ),
    ]
