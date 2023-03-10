# Generated by Django 4.1.5 on 2023-01-10 18:06

import Nectar.methods
from django.conf import settings
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
        ('Language', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('created_date', models.DateTimeField(auto_now_add=True, verbose_name='Created Date')),
                ('last_updated', models.DateTimeField(auto_now=True, null=True, verbose_name='Last Update')),
                ('username', models.CharField(max_length=30, unique=True, verbose_name='User Name')),
                ('email', models.EmailField(max_length=200, unique=True, verbose_name='E-Mail')),
                ('is_active', models.BooleanField(default=True, verbose_name='is Active')),
                ('is_staff', models.BooleanField(default=False, verbose_name='is Staff')),
                ('is_superuser', models.BooleanField(default=False, verbose_name='is Super User')),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.permission', verbose_name='user permissions')),
            ],
            options={
                'verbose_name': 'User',
                'verbose_name_plural': 'Users',
            },
        ),
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(blank=True, default='images/{instance.__class__.__name__}/default.jpg', null=True, upload_to=Nectar.methods.upload_to, verbose_name='Image')),
                ('phone_number', models.CharField(blank=True, max_length=17, null=True, validators=[django.core.validators.RegexValidator(message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.", regex='^\\+?1?\\d{9,15}$')], verbose_name='Phone Number')),
                ('full_name', models.CharField(blank=True, max_length=80, null=True, unique=True, verbose_name='Full Name')),
                ('family_name', models.CharField(blank=True, max_length=15, null=True, verbose_name='Family Name')),
                ('birth_date', models.DateField(blank=True, null=True, verbose_name='Birth Date')),
                ('gender', models.CharField(blank=True, choices=[('M', 'Male'), ('F', 'FeMale')], max_length=1, null=True, verbose_name='Gender')),
                ('language', models.ForeignKey(blank=True, default='en', null=True, on_delete=django.db.models.deletion.SET_NULL, to='Language.language', verbose_name='Language')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='User')),
            ],
            options={
                'verbose_name': 'Profile',
                'verbose_name_plural': 'Profiles',
            },
        ),
        migrations.CreateModel(
            name='Following',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_date', models.DateTimeField(auto_now_add=True, verbose_name='Created Date')),
                ('last_updated', models.DateTimeField(auto_now=True, null=True, verbose_name='Last Update')),
                ('followed', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='followed_set', to=settings.AUTH_USER_MODEL)),
                ('follower', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='followers', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'unique_together': {('followed', 'follower')},
            },
        ),
    ]
