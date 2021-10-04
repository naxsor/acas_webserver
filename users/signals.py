from django.db.models.signals import post_save, m2m_changed
from django.contrib.auth.models import User
from django.dispatch import receiver
from .models import Profile
from django.contrib.auth.models import Group

@receiver(m2m_changed, sender=User.groups.through)
def change_position(instance, action, reverse, model, pk_set, using, *args, **kwargs):
    if model == Group and not reverse:
        user = User.objects.get(id=instance.id)
        position = user.profile.position

        pk_list = list(pk_set)
        pk_list = sorted(pk_list)

        if action == 'pre_add':
            position_to_set = Group.objects.get(id=pk_list[0])

            if position_to_set.name == 'Staff':
                user.is_staff = True

            if not position is None:
                position = Group.objects.get(name=position)
                if position_to_set.id < position.id:
                    user.profile.position = position_to_set.name
                else:
                    None
            else:
                user.profile.position = position_to_set.name
        elif action == 'pre_remove':
            position_to_remove = None


        user.save()

@receiver(post_save, sender=User)
def create_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)


@receiver(post_save, sender=User)
def save_profile(sender, instance, **kwargs):
    instance.profile.save()