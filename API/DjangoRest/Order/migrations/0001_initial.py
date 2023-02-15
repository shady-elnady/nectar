# Generated by Django 4.1.5 on 2023-02-15 09:18

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('MyCart', '0001_initial'),
        ('Payment', '0001_initial'),
        ('Location', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Delivery',
            fields=[
                ('delivery_method', models.CharField(max_length=20, primary_key=True, serialize=False, verbose_name='Delivery Method')),
                ('delivery_cost', models.FloatField(blank=True, null=True, verbose_name='Delivery Cost')),
            ],
            options={
                'verbose_name': 'Delivery',
                'verbose_name_plural': 'Deliveries',
            },
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('is_refund_requested', models.BooleanField(default=False, verbose_name='is Refund Requested')),
                ('is_refund_granted', models.BooleanField(default=False, verbose_name='is Refund Granted')),
                ('total_order_cost', models.FloatField(editable=False, verbose_name='Total Order Cost')),
                ('delvirey_cost', models.FloatField(editable=False, verbose_name='Delivery Cost')),
                ('received_date', models.DateTimeField(auto_now_add=True, verbose_name='Received Date')),
                ('billing_address', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='Billing_Orders', to='Location.address', verbose_name='Billing Address')),
                ('delivery', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='Shipping_Orders', to='Order.delivery', verbose_name='Delivery')),
                ('my_cart', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='Order', to='MyCart.mycart', verbose_name='My Cart')),
            ],
            options={
                'verbose_name': 'Order',
                'verbose_name_plural': 'Orders',
            },
        ),
        migrations.CreateModel(
            name='PromoCode',
            fields=[
                ('created_date', models.DateTimeField(auto_now_add=True, verbose_name='Created Date')),
                ('last_updated', models.DateTimeField(auto_now=True, null=True, verbose_name='Last Update')),
                ('coupon', models.AutoField(primary_key=True, serialize=False, verbose_name='Coupon')),
                ('discount', models.FloatField(verbose_name='Discount')),
                ('end_time', models.DateTimeField(blank=True, null=True, verbose_name='End Time')),
            ],
            options={
                'verbose_name': 'Promo Code',
                'verbose_name_plural': 'Promo Codes',
            },
        ),
        migrations.CreateModel(
            name='Refund',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_date', models.DateTimeField(auto_now_add=True, verbose_name='Created Date')),
                ('last_updated', models.DateTimeField(auto_now=True, null=True, verbose_name='Last Update')),
                ('reason', models.TextField(blank=True, null=True, verbose_name='Reason')),
                ('is_accepted', models.BooleanField(default=False, verbose_name='is Accepted')),
                ('order', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='Refund', to='Order.order', verbose_name='Order')),
            ],
            options={
                'verbose_name': 'Refund',
                'verbose_name_plural': 'Refunds',
            },
        ),
        migrations.CreateModel(
            name='Payment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('charge_id', models.CharField(max_length=50, unique=True, verbose_name='Charge ID')),
                ('amount', models.FloatField(verbose_name='Amount')),
                ('payment_time', models.DateTimeField(auto_now_add=True, verbose_name='Payment Time')),
                ('currency', models.ForeignKey(default='$', on_delete=django.db.models.deletion.CASCADE, related_name='Payments', to='Payment.currency', verbose_name='Currency')),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Order.order', verbose_name='Order')),
                ('payment_method', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Payment.paymentmethod', verbose_name='Payment Method')),
            ],
            options={
                'verbose_name': 'Payment',
                'verbose_name_plural': 'Payments',
                'unique_together': {('order', 'payment_method')},
            },
        ),
        migrations.AddField(
            model_name='order',
            name='payments',
            field=models.ManyToManyField(through='Order.Payment', to='Payment.paymentmethod', verbose_name='Payments'),
        ),
        migrations.AddField(
            model_name='order',
            name='promo_code',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='Order.promocode', verbose_name='Promo Code'),
        ),
        migrations.AddField(
            model_name='order',
            name='shipping_address',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='Shipping_Orders', to='Location.address', verbose_name='Shipping Address'),
        ),
    ]
