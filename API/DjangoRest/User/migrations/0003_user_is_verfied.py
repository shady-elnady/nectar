# Generated by Django 4.1.5 on 2023-01-20 14:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('User', '0002_profile_address'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='is_verfied',
            field=models.BooleanField(default=False, verbose_name='is Verfied'),
        ),
    ]
