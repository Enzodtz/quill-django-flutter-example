# Generated by Django 3.2.1 on 2021-05-06 02:32

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('test_app', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='description',
            old_name='text',
            new_name='json',
        ),
    ]
