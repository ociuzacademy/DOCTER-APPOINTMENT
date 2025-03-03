# Generated by Django 4.2.6 on 2025-01-31 09:41

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('doctor_app', '0002_delete_chatmessage1'),
    ]

    operations = [
        migrations.CreateModel(
            name='ChatMessage1',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('message', models.TextField()),
                ('sender', models.CharField(choices=[('user', 'User'), ('doctor', 'Doctor')], max_length=10)),
                ('is_viewed_by_user', models.BooleanField(default=False)),
                ('is_viewed_by_doctor', models.BooleanField(default=False)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('is_deleted', models.BooleanField(default=False)),
                ('chat_room', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='messages', to='doctor_app.chatroom')),
                ('doctor', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='sent_messages', to='doctor_app.doctor')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='sent_messages', to='doctor_app.user')),
            ],
            options={
                'ordering': ['created_at'],
                'indexes': [models.Index(fields=['chat_room', 'created_at'], name='doctor_app__chat_ro_2a4c89_idx')],
            },
        ),
    ]
