# Generated by Django 4.1.5 on 2023-02-15 09:18

import Nectar.methods
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('Language', '0001_initial'),
        ('Payment', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='City',
            fields=[
                ('name', models.CharField(max_length=100, primary_key=True, serialize=False, verbose_name='Name')),
                ('native', models.CharField(blank=True, max_length=20, null=True, unique=True, verbose_name='Native')),
            ],
            options={
                'verbose_name': 'City',
                'verbose_name_plural': 'Cities',
            },
        ),
        migrations.CreateModel(
            name='Country',
            fields=[
                ('name', models.CharField(max_length=100, primary_key=True, serialize=False, verbose_name='Name')),
                ('native', models.CharField(blank=True, max_length=20, null=True, unique=True, verbose_name='Native')),
                ('svg_img', models.ImageField(blank=True, default='svg/{instance.__class__.__name__}/default.svg', null=True, upload_to=Nectar.methods.uploadSVG_to, verbose_name='SVG Image')),
                ('continent', models.CharField(choices=[('AF', 'Africa'), ('AS', 'Asia'), ('EU', 'Europe'), ('NA', 'North America'), ('OC', 'Oceania'), ('SA', 'South America'), ('AN', 'Antarctica')], max_length=2, verbose_name='Continent Name')),
                ('flag_emoji', models.CharField(blank=True, max_length=5, null=True, verbose_name='Flag Emoji')),
                ('tel_code', models.CharField(blank=True, max_length=3, null=True, verbose_name='Telphone Code')),
                ('capital', models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='Capital To +', to='Location.city', verbose_name='Capital')),
                ('currency', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='Countries', to='Payment.currency', verbose_name='Currency')),
                ('language', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='Countries', to='Language.language', verbose_name='languages')),
            ],
            options={
                'verbose_name': 'Country',
                'verbose_name_plural': 'Countries',
            },
        ),
        migrations.CreateModel(
            name='Geo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('lat', models.FloatField(verbose_name='Lat')),
                ('lang', models.FloatField(verbose_name='Lang')),
            ],
            options={
                'verbose_name': 'Geo',
                'verbose_name_plural': 'Geo',
            },
        ),
        migrations.CreateModel(
            name='Region',
            fields=[
                ('name', models.CharField(max_length=100, primary_key=True, serialize=False, verbose_name='Name')),
                ('native', models.CharField(blank=True, max_length=20, null=True, unique=True, verbose_name='Native')),
                ('city', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='Regions', to='Location.city', verbose_name='City')),
            ],
            options={
                'verbose_name': 'Region',
                'verbose_name_plural': 'Regions',
            },
        ),
        migrations.CreateModel(
            name='Street',
            fields=[
                ('name', models.CharField(max_length=100, primary_key=True, serialize=False, verbose_name='Name')),
                ('native', models.CharField(blank=True, max_length=20, null=True, unique=True, verbose_name='Native')),
                ('region', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='Streets', to='Location.region', verbose_name='Region')),
            ],
            options={
                'verbose_name': 'Street',
                'verbose_name_plural': 'Streets',
            },
        ),
        migrations.CreateModel(
            name='Governorate',
            fields=[
                ('name', models.CharField(max_length=100, primary_key=True, serialize=False, verbose_name='Name')),
                ('native', models.CharField(blank=True, max_length=20, null=True, unique=True, verbose_name='Native')),
                ('tel_code', models.CharField(blank=True, max_length=3, null=True, unique=True, verbose_name='Telephone Code')),
                ('country', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='Governorates', to='Location.country', verbose_name='Country')),
            ],
            options={
                'verbose_name': 'Governorate',
                'verbose_name_plural': 'Governorates',
            },
        ),
        migrations.AddField(
            model_name='city',
            name='country',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='Cities', to='Location.country', verbose_name='Country'),
        ),
        migrations.AddField(
            model_name='city',
            name='governorate',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='Cities', to='Location.governorate', verbose_name='Governorate'),
        ),
        migrations.CreateModel(
            name='Address',
            fields=[
                ('name', models.CharField(max_length=100, primary_key=True, serialize=False, verbose_name='Name')),
                ('native', models.CharField(blank=True, max_length=20, null=True, unique=True, verbose_name='Native')),
                ('geo', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='Address', to='Location.geo', verbose_name='Location')),
                ('street', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='Address', to='Location.street', verbose_name='Street')),
            ],
            options={
                'verbose_name': 'Address',
                'verbose_name_plural': 'Address',
            },
        ),
    ]
