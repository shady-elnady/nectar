# Generated by Django 4.1.5 on 2023-02-04 16:27

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('Product', '0003_alter_productimage_product'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('payment_method', models.CharField(blank=True, choices=[('Ch', 'Check'), ('P', 'PayPal'), ('S', 'Stripe'), ('Ca', 'Cach')], max_length=2, null=True, verbose_name='Payment Method')),
                ('is_finished', models.BooleanField(default=False, verbose_name='is Finished')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Cearted At')),
                ('customer', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, to_field='username', verbose_name='Customer')),
            ],
            options={
                'verbose_name': 'Cart',
                'verbose_name_plural': 'Carts',
            },
        ),
        migrations.CreateModel(
            name='Coupon',
            fields=[
                ('promo_code', models.CharField(max_length=15, primary_key=True, serialize=False)),
                ('discount', models.FloatField(verbose_name='Discount')),
            ],
            options={
                'verbose_name': 'Coupon',
                'verbose_name_plural': 'Coupons',
            },
        ),
        migrations.CreateModel(
            name='LineInCart',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('amount', models.SmallIntegerField(verbose_name='Amount')),
                ('cart', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='Lines_In_Cart', to='Cart.cart', verbose_name='Cart')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='Lines_In_Carts', to='Product.product', verbose_name='Product')),
            ],
            options={
                'verbose_name': 'Line In Cart',
                'verbose_name_plural': 'Lines In Cart',
                'unique_together': {('cart', 'product')},
            },
        ),
        migrations.AddField(
            model_name='cart',
            name='lines_in_cart',
            field=models.ManyToManyField(through='Cart.LineInCart', to='Product.product', verbose_name='Lines In Cart'),
        ),
        migrations.AddField(
            model_name='cart',
            name='promo_code',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='Cart.coupon', verbose_name='Promo Code'),
        ),
    ]