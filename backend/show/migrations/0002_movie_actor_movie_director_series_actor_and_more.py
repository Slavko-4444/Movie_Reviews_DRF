# Generated by Django 5.0.4 on 2024-04-09 13:38

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('show', '0001_initial'),
        ('show_worker', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='movie',
            name='actor',
            field=models.ManyToManyField(to='show_worker.actor'),
        ),
        migrations.AddField(
            model_name='movie',
            name='director',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='show_worker.director'),
        ),
        migrations.AddField(
            model_name='series',
            name='actor',
            field=models.ManyToManyField(to='show_worker.actor'),
        ),
        migrations.AddField(
            model_name='series',
            name='director_id',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='show_worker.director'),
        ),
    ]