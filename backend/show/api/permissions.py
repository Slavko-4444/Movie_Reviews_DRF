from rest_framework import permissions


class AdminExtraPermisions(permissions.BasePermission):
    def has_permission(self, request, view):
        if request.method not in ['DELETE', 'PUT', 'POST']:
            return True
        return request.user.is_staff
 