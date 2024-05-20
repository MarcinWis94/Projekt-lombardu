from django.contrib.auth.backends import ModelBackend
from django.contrib.auth.models import Permission

class AdminPermissionBackend(ModelBackend):
    def has_perm(self, user_obj, perm, obj=None):
        if perm == 'admin.can_view_admin':
            return user_obj.is_authenticated and user_obj.has_perm('Lombard.can_view_admin')
        return super().has_perm(user_obj, perm, obj)
