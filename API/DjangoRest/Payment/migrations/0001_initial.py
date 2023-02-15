# Generated by Django 4.1.5 on 2023-02-15 09:18

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Currency',
            fields=[
                ('name', models.CharField(max_length=100, primary_key=True, serialize=False, verbose_name='Name')),
                ('native', models.CharField(blank=True, max_length=20, null=True, unique=True, verbose_name='Native')),
                ('code', models.CharField(max_length=3, unique=True, verbose_name='Code')),
                ('emoji', models.CharField(blank=True, max_length=5, null=True, verbose_name='Emoji')),
            ],
            options={
                'verbose_name': 'Currency',
                'verbose_name_plural': 'Currencies',
            },
        ),
        migrations.CreateModel(
            name='PaymentMethod',
            fields=[
                ('name', models.CharField(max_length=100, primary_key=True, serialize=False, verbose_name='Name')),
                ('native', models.CharField(blank=True, max_length=20, null=True, unique=True, verbose_name='Native')),
                ('emoji', models.CharField(blank=True, max_length=2, null=True, unique=True, verbose_name='Emoji')),
            ],
            options={
                'verbose_name': 'Payment',
                'verbose_name_plural': 'Payments',
            },
        ),
    ]
