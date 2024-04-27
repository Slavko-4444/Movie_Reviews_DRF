from rest_framework import viewsets, generics

from comment.models import CommentSE, CommentMV
from rest_framework.response import Response

from .pagination import CommentPagination
from .serializers import CommentSESerializer, CommentMVSerializer
from show_worker.api.permissions import WorkerListPermission


class CommentSEVS(viewsets.ModelViewSet):
    serializer_class = CommentSESerializer
    permission_classes = [WorkerListPermission]
    pagination_class = CommentPagination

    def get_queryset(self):
        series_id = self.kwargs.get('series_id')
        return CommentSE.objects.filter(series=series_id).order_by('-created_at')

    def perform_create(self, serializer):
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors)


class CommentMVVS(viewsets.ModelViewSet):
    serializer_class = CommentMVSerializer
    permission_classes = [WorkerListPermission]
    pagination_class = CommentPagination

    def get_queryset(self):
        movie_id = self.kwargs.get('movie_id')
        return CommentMV.objects.filter(movie=movie_id)

    def perform_create(self, serializer):
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors)
