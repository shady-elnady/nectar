# Generated by Django 4.1.5 on 2023-02-14 07:20

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('MyCart', '0001_initial'),
        ('User', '0007_remove_user_favorites_products_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='profile',
            name='my_basket',
            field=models.OneToOneField(blank=True, limit_choices_to={'is_finished': False}, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='Profile', to='MyCart.mycart', verbose_name='My Basket'),
        ),
    ]
